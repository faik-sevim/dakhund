# Dakhund
Wifi deauthantication attack detector.

Information and Capabilities:
Packet Sniffing: It captures packets from the specified WiFi interface (e.g., wlan0mon).

Host & Client Interaction: Users can input MAC addresses for a host and a client to monitor interactions between them.

Signal Strength Monitoring: The app displays the WiFi signal strength between the chosen host and client, updated regularly.

Deauthentication Packets: It keeps track of the last 20 Deauthentication (Deauth) packets. Deauth packets are a subtype of management packets in the IEEE 802.11 (WiFi) protocol. They're used to tell a client it has been "deauthenticated" from a network. This can be a legitimate operation or used in attacks to disconnect users from a network.

API Notification: If 10 Deauth packets are received within 5 seconds, it triggers an API call to a specified address. However, it limits this trigger to once every 10 minutes to prevent overloading or spamming.

Time-Stamping: For each Deauth packet detected, a timestamp is added, showing the date and time it was registered.

How It Works:
Backend with Flask: The Python application uses the Flask framework for web functionalities. Flask routes manage API endpoints and rendering the HTML template.

Packet Capturing with Scapy: Scapy is a Python library used for packet manipulation. In this application, Scapy's sniff function is used to capture packets from the WiFi interface. Captured packets are put into a queue for further processing.

Multithreading: The packet capturing (sniffing) and packet handling functions run in separate threads to ensure smooth operation without blocking.

Frontend with HTML & JavaScript: The frontend is a simple web page where users can set the MAC addresses to be monitored. It uses JavaScript (and the jQuery library) to fetch updates from the backend asynchronously.

Data Fetching and Rendering: Every 5 seconds, the frontend fetches the list of the last 20 Deauth packets and updates the displayed list. Every second, it fetches and displays the current WiFi signal strength between the specified host and client.

API Interaction: If a burst of Deauth packets is detected (10 packets within 5 seconds), the frontend will send a request to the specified API address. However, to prevent frequent triggers, a cooldown of 10 minutes is implemented.

In essence, the application offers a visual interface for monitoring specific WiFi interactions, especially deauthentication events, which can be indicative of network attacks or issues.

Use your wifi adapter in monitor mode, after that run the python script. Go to the http://localhost:5000/ Add your host and client mac adress. Also you can add your api address for triggering the alarm. I used Push Notification Apı in my case.

![image](https://github.com/faik-sevim/dakhund/assets/35146324/b5f3ec83-1aae-4bda-ba4e-598ecb59f9d8)




Before using the provided Packet Sniffer application, there are several prerequisites and configurations to consider:

Wireless Adapter Compatibility: Ensure that your wireless adapter/card is capable of "monitor mode." Not all wireless cards support this mode. Popular choices for packet sniffing are Alfa cards or those using the Atheros or Ralink chipsets.

Enable Monitor Mode: Before starting the application, you'll need to put your wireless adapter into monitor mode. Monitor mode allows your wireless card to monitor all wireless traffic in its vicinity, not just traffic intended for it.
After executing this, your wireless interface may change its name, often to something like wlan0mon. Make sure to update the interface name in the code if it's different.
Dependencies: Ensure you've installed all necessary dependencies. The given code seems to rely on Flask and Scapy primarily.

Run as Root: Packet sniffing often requires root privileges. When starting the application, use:

Firewall Settings: If you're using a firewall, make sure to allow traffic on port 5000 (or whatever port you choose) so you can access the web interface.

Environment: It's essential to note where you're using this tool. Sniffing packets, especially on networks you don't own, can be illegal or against the terms of service. Always get permission and be aware of local regulations and laws.

Physical Proximity: To accurately capture packets, especially if you're focusing on a specific device or network, ensure you're within a good range of the target WiFi network. Signal strength will directly affect the number of packets you can capture.

API Endpoint: If you're going to use the API notification feature, make sure the API endpoint you're planning to call is set up, reachable, and can handle the expected request format.

Time Synchronization: Since the application now logs timestamps for each packet, ensure your system clock is accurate.

Web Browser: Ensure you have a web browser to access the application's frontend. Any modern browser like Chrome, Firefox, or Safari should work fine.

By meeting these prerequisites and following the guidelines, you'll be able to utilize the packet sniffer tool effectively. Always remember to use such tools responsibly and ethically.

Poc : 

The left side attacker with Kali, Right side with ubuntu is the user side in this scenario.  



https://github.com/faik-sevim/dakhund/assets/35146324/a522e4dc-52cd-4a13-a3eb-0e7219dc3463




