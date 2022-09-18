#!/bin/bash
#Autoscript-Lite By Vinstechmy

#----- Auto Remove Vmess
data=( `cat /usr/local/etc/xray/config.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -f /usr/local/etc/xray/$user-tls.json /usr/local/etc/xray/$user-none.json
rm -f /home/vps/public_html/$user-VMESS-TLS.yaml /home/vps/public_html/$user-VMESS-NTLS.yaml /home/vps/public_html/$user-VMMAXIS.yaml /home/vps/public_html/$user-VMDIGI.yaml /home/vps/public_html/$user-VMCELCOM.yaml
systemctl restart xray.service
fi
done

#----- Auto Remove Vless
data=( `cat /usr/local/etc/xray/vless.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/vless.json
rm -f /home/vps/public_html/$user-VLESS-TLS.yaml /home/vps/public_html/$user-VLESS-NTLS.yaml /home/vps/public_html/$user-VLMAXIS.yaml /home/vps/public_html/$user-VLDIGI.yaml /home/vps/public_html/$user-VLCELCOM.yaml
systemctl restart xray@vless.service
done

#----- Auto Remove Trojan
data=( `cat /usr/local/etc/xray/trojanws.json | grep '^###' | cut -d ' ' -f 2 | sort | uniq`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^### $user" "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sort | uniq)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/trojanws.json
rm -f /home/vps/public_html/$user-TROJAN-TLS.yaml /home/vps/public_html/$user-TROJAN-NTLS.yaml /home/vps/public_html/$user-TRMAXIS.yaml /home/vps/public_html/$user-TRDIGI.yaml /home/vps/public_html/$user-TRCELCOM.yaml
systemctl restart xray@trojanws.service
fi
done
