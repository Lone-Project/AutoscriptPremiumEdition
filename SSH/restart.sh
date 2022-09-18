#!/bin/bash
#Autoscript-Lite By Vinstechmy
clear
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
systemctl restart xray.service
systemctl restart xray@vless.service
systemctl restart xray@trojanws.service
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m       All Services Restarted      \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 1
clear