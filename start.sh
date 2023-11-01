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

# Step 3: Check available WLAN devices and switch the chosen one to Monitor Mode
echo "🔧 Checking available WLAN devices..."

# List available WLAN devices
wlan_devices=$(iwconfig 2>&1 | grep 'IEEE 802.11' | awk '{print $1}')

# Convert to array
wlan_array=($wlan_devices)

# Check number of available WLAN devices
num_devices=${#wlan_array[@]}

# If there's more than 1 device, prompt user to select one
selected_device=""
if [ $num_devices -gt 1 ]; then
    echo "Multiple WLAN devices found. Please select one:"
    select opt in "${wlan_array[@]}"; do
        selected_device=$opt
        break
    done
else
    selected_device=${wlan_array[0]}
fi

echo "🔧 Switching $selected_device to monitor mode..."
sudo ifconfig $selected_device down
sudo iwconfig $selected_device mode monitor

if [ $? -ne 0 ]; then
    echo "Unable to switch $selected_device to monitor mode. Please ensure you have a WLAN device that supports monitor mode."
    exit 1
fi

sudo ifconfig $selected_device up
echo "✅ $selected_device switched to monitor mode successfully!"

# Step 4: Launch the Program
echo "🚀 Launching the program..."
python3 dakhund.py $selected_device
