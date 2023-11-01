from flask import Flask, render_template, request, jsonify
from scapy.all import *
import threading
import queue
import sys

app = Flask(__name__, template_folder='.')

PACKET_QUEUE = queue.Queue()
SIGNAL_STRENGTH = -100
LAST_PACKETS = []
HOST_MAC = ''
API_ADDRESS = ""
CLIENT_MAC = ''

@app.route('/', methods=['GET', 'POST'])
def index():
    global HOST_MAC, CLIENT_MAC
    if request.method == 'POST':
        HOST_MAC = request.form.get('host_mac').lower()
        CLIENT_MAC = request.form.get('client_mac').lower()
    return render_template('index.html', last_packets=LAST_PACKETS, host_mac=HOST_MAC, client_mac=CLIENT_MAC)

@app.route('/signal_strength')
def signal_strength():
    return jsonify(signal_strength=SIGNAL_STRENGTH)

@app.route('/set_api_address', methods=['POST'])
def set_api_address():
    global API_ADDRESS
    API_ADDRESS = request.form.get('api_address')
    return jsonify(success=True)

@app.route('/last_deauth_packets')
def last_deauth_packets():
    return jsonify(last_packets=LAST_PACKETS)

def packet_handler():
    global SIGNAL_STRENGTH
    while True:
        packet = PACKET_QUEUE.get()
        if packet.haslayer(Dot11):
            addr1 = packet[Dot11].addr1
            addr2 = packet[Dot11].addr2
            if 'dBm_AntSignal' in packet.fields:
                strength = packet.dBm_AntSignal
                if (addr1 == HOST_MAC and addr2 == CLIENT_MAC) or (addr2 == HOST_MAC and addr1 == CLIENT_MAC):
                    SIGNAL_STRENGTH = strength
                    print(f"Signal Strength between {HOST_MAC} and {CLIENT_MAC}: {SIGNAL_STRENGTH} dBm")
        if packet.haslayer(Dot11Deauth):
            sender = packet[Dot11].addr2
            receiver = packet[Dot11].addr1
            strength = packet.dBm_AntSignal if 'dBm_AntSignal' in packet.fields else -100
            current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            LAST_PACKETS.append(f"{sender} -> {receiver}, Signal: {strength} dBm at {current_time}")
            if len(LAST_PACKETS) > 20:
                LAST_PACKETS.pop(0)

def sniff_packets():
    sniff(iface=selected_device, prn=lambda x: PACKET_QUEUE.put(x), store=0)

if __name__ == "__main__":
    selected_device = sys.argv[1] # Move this line to the top
    packet_thread = threading.Thread(target=packet_handler)
    sniff_thread = threading.Thread(target=sniff_packets)
    packet_thread.start()
    sniff_thread.start()
    app.run(port=5000, debug=True, use_reloader=False)
