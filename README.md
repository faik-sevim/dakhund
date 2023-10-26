# Dakhund
Wifi deauthantication attack detector.

![image](https://github.com/faik-sevim/dakhund/assets/35146324/b5f3ec83-1aae-4bda-ba4e-598ecb59f9d8)

𝗜𝗻𝗳𝗼𝗿𝗺𝗮𝘁𝗶𝗼𝗻 𝗮𝗻𝗱 𝗖𝗮𝗽𝗮𝗯𝗶𝗹𝗶𝘁𝗶𝗲𝘀:

𝗽𝗮𝗰𝗸𝗲𝘁 𝗦𝗻𝗶𝗳𝗳𝗶𝗻𝗴: It captures packets from the specified WiFi interface (e.g., wlan0mon).

𝙃𝙤𝙨𝙩 & 𝘾𝙡𝙞𝙚𝙣𝙩 𝙄𝙣𝙩𝙚𝙧𝙖𝙘𝙩𝙞𝙤𝙣: Users can input MAC addresses for a host and a client to monitor interactions between them.

𝗦𝗶𝗴𝗻𝗮𝗹 𝗦𝘁𝗿𝗲𝗻𝗴𝘁𝗵 𝗠𝗼𝗻𝗶𝘁𝗼𝗿𝗶𝗻𝗴: The app displays the WiFi signal strength between the chosen host and client, updated regularly.

𝗗𝗲𝗮𝘂𝘁𝗵𝗲𝗻𝘁𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝗣𝗮𝗰𝗸𝗲𝘁𝘀: It keeps track of the last 20 Deauthentication (Deauth) packets. Deauth packets are a subtype of management packets in the IEEE 802.11 (WiFi) protocol. They're used to tell a client it has been "deauthenticated" from a network. This can be a legitimate operation or used in attacks to disconnect users from a network.

𝘼𝙋𝙄 𝙉𝙤𝙩𝙞𝙛𝙞𝙘𝙖𝙩𝙞𝙤𝙣: If 10 Deauth packets are received within 5 seconds, it triggers an API call to a specified address. However, it limits this trigger to once every 10 minutes to prevent overloading or spamming.

𝗧𝗶𝗺𝗲-𝗦𝘁𝗮𝗺𝗽𝗶𝗻𝗴: For each Deauth packet detected, a timestamp is added, showing the date and time it was registered.

🅷🅾🆆 🅸🆃 🆆🅾🆁🅺🆂:

𝗕𝗮𝗰𝗸𝗲𝗻𝗱 𝘄𝗶𝘁𝗵 𝗙𝗹𝗮𝘀𝗸: The Python application uses the Flask framework for web functionalities. Flask routes manage API endpoints and rendering the HTML template.

Packet Capturing with Scapy: Scapy is a Python library used for packet manipulation. In this application, Scapy's sniff function is used to capture packets from the WiFi interface. Captured packets are put into a queue for further processing.

𝗠𝘂𝗹𝘁𝗶𝘁𝗵𝗿𝗲𝗮𝗱𝗶𝗻𝗴: The packet capturing (sniffing) and packet handling functions run in separate threads to ensure smooth operation without blocking.

𝙁𝙧𝙤𝙣𝙩𝙚𝙣𝙙 𝙬𝙞𝙩𝙝 𝙃𝙏𝙈𝙇 & 𝙅𝙖𝙫𝙖𝙎𝙘𝙧𝙞𝙥𝙩: The frontend is a simple web page where users can set the MAC addresses to be monitored. It uses JavaScript (and the jQuery library) to fetch updates from the backend asynchronously.

Data Fetching and Rendering: Every 5 seconds, the frontend fetches the list of the last 20 Deauth packets and updates the displayed list. Every second, it fetches and displays the current WiFi signal strength between the specified host and client.

𝘼𝙋𝙄 𝙄𝙣𝙩𝙚𝙧𝙖𝙘𝙩𝙞𝙤𝙣: If a burst of Deauth packets is detected (10 packets within 5 seconds), the frontend will send a request to the specified API address. However, to prevent frequent triggers, a cooldown of 10 minutes is implemented.

In essence, the application offers a visual interface for monitoring specific WiFi interactions, especially deauthentication events, which can be indicative of network attacks or issues.

Use your wifi adapter in monitor mode, after that run the python script. Go to the http://localhost:5000/ Add your host and client mac adress. Also you can add your api address for triggering the alarm. I used Push Notification Apı in my case.






𝘽𝙚𝙛𝙤𝙧𝙚 𝙪𝙨𝙞𝙣𝙜 𝙩𝙝𝙚 𝙥𝙧𝙤𝙫𝙞𝙙𝙚𝙙 𝙋𝙖𝙘𝙠𝙚𝙩 𝙎𝙣𝙞𝙛𝙛𝙚𝙧 𝙖𝙥𝙥𝙡𝙞𝙘𝙖𝙩𝙞𝙤𝙣, 𝙩𝙝𝙚𝙧𝙚 𝙖𝙧𝙚 𝙨𝙚𝙫𝙚𝙧𝙖𝙡 𝙥𝙧𝙚𝙧𝙚𝙦𝙪𝙞𝙨𝙞𝙩𝙚𝙨 𝙖𝙣𝙙 𝙘𝙤𝙣𝙛𝙞𝙜𝙪𝙧𝙖𝙩𝙞𝙤𝙣𝙨 𝙩𝙤 𝙘𝙤𝙣𝙨𝙞𝙙𝙚𝙧:

𝙒𝙞𝙧𝙚𝙡𝙚𝙨𝙨 𝘼𝙙𝙖𝙥𝙩𝙚𝙧 𝘾𝙤𝙢𝙥𝙖𝙩𝙞𝙗𝙞𝙡𝙞𝙩𝙮: Ensure that your wireless adapter/card is capable of "monitor mode." Not all wireless cards support this mode. Popular choices for packet sniffing are Alfa cards or those using the Atheros or Ralink chipsets.

𝙀𝙣𝙖𝙗𝙡𝙚 𝙈𝙤𝙣𝙞𝙩𝙤𝙧 𝙈𝙤𝙙𝙚: Before starting the application, you'll need to put your wireless adapter into monitor mode. Monitor mode allows your wireless card to monitor all wireless traffic in its vicinity, not just traffic intended for it.
After executing this, your wireless interface may change its name, often to something like wlan0mon. Make sure to update the interface name in the code if it's different.

𝘿𝙚𝙥𝙚𝙣𝙙𝙚𝙣𝙘𝙞𝙚𝙨: Ensure you've installed all necessary dependencies. The given code seems to rely on Flask and Scapy primarily.

𝙍𝙪𝙣 𝙖𝙨 𝙍𝙤𝙤𝙩: Packet sniffing often requires root privileges.

𝙁𝙞𝙧𝙚𝙬𝙖𝙡𝙡 𝙎𝙚𝙩𝙩𝙞𝙣𝙜𝙨: If you're using a firewall, make sure to allow traffic on port 5000 (or whatever port you choose) so you can access the web interface.

𝙀𝙣𝙫𝙞𝙧𝙤𝙣𝙢𝙚𝙣𝙩: It's essential to note where you're using this tool. Sniffing packets, especially on networks you don't own, can be illegal or against the terms of service. Always get permission and be aware of local regulations and laws.

𝙋𝙝𝙮𝙨𝙞𝙘𝙖𝙡 𝙋𝙧𝙤𝙭𝙞𝙢𝙞𝙩𝙮: To accurately capture packets, especially if you're focusing on a specific device or network, ensure you're within a good range of the target WiFi network. Signal strength will directly affect the number of packets you can capture.

𝘼𝙋𝙄 𝙀𝙣𝙙𝙥𝙤𝙞𝙣𝙩: If you're going to use the API notification feature, make sure the API endpoint you're planning to call is set up, reachable, and can handle the expected request format.

𝙏𝙞𝙢𝙚 𝙎𝙮𝙣𝙘𝙝𝙧𝙤𝙣𝙞𝙯𝙖𝙩𝙞𝙤𝙣: Since the application now logs timestamps for each packet, ensure your system clock is accurate.

𝙒𝙚𝙗 𝘽𝙧𝙤𝙬𝙨𝙚𝙧: Ensure you have a web browser to access the application's frontend. Any modern browser like Chrome, Firefox, or Safari should work fine.

By meeting these prerequisites and following the guidelines, you'll be able to utilize the packet sniffer tool effectively. Always remember to use such tools 𝗿𝗲𝘀𝗽𝗼𝗻𝘀𝗶𝗯𝗹𝘆 𝗮𝗻𝗱 𝗲𝘁𝗵𝗶𝗰𝗮𝗹𝗹𝘆.

Ⓟⓞⓒ : 

The left side attacker with Kali, Right side with ubuntu is the user side in this scenario.  



https://github.com/faik-sevim/dakhund/assets/35146324/a522e4dc-52cd-4a13-a3eb-0e7219dc3463




