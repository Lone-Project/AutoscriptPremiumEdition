#!/bin/bash
# Websocker Tunneling Installer By Vinstechmy
clear
cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/vinstechmy/AutoscriptPremiumEdition/main/SSHWS/openssh-socket.py
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/vinstechmy/AutoscriptPremiumEdition/main/SSHWS/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/vinstechmy/AutoscriptPremiumEdition/main/SSHWS/ws-stunnel

#izin permision
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/vinstechmy/AutoscriptPremiumEdition/main/SSHWS/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/vinstechmy/AutoscriptPremiumEdition/main/SSHWS/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

#restart service
systemctl daemon-reload

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
