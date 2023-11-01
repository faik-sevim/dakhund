#!/bin/bash

# Installation Script: Packet Sniffer

echo "🚀 Starting Packet Sniffer Installation..."

# Step 1: Download Packages from GitHub
echo "🔧 Downloading packages from GitHub..."
git clone [Your GitHub Repo Link] && cd [Your Repo Name]

# Step 2: Check and Install Necessary Packages
echo "🔧 Checking required packages..."

# Python check
command -v python3 >/dev/null 2>&1 || {
    echo "Python3 is not installed. Initiating installation..."
    sudo apt-get install python3
}

# Scapy check
python3 -c "import scapy" >/dev/null 2>&1 || {
    echo "Scapy is not installed. Initiating installation..."
    sudo python3 -m pip install scapy
}

# Flask check
python3 -c "import flask" >/dev/null 2>&1 || {
    echo "Flask is not installed. Initiating installation..."
    sudo python3 -m pip install Flask
}

# Step 3: Switch WLAN Device to Monitor Mode
echo "🔧 Switching WLAN device to monitor mode..."
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor

if [ $? -ne 0 ]; then
    echo "Unable to switch WLAN to monitor mode. Please ensure you have a WLAN device that supports monitor mode."
    exit 1
fi

sudo ifconfig wlan0 up
echo "✅ WLAN device switched to monitor mode successfully!"

# Step 4: Launch the Program
echo "🚀 Launching the program..."
python3 [your_program_name].py
