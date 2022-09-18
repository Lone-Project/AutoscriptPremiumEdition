#!/bin/bash
#Autoscript-Lite By Vinstechmy
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;41;36m    Check XRAY Vless WS Config     \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;41;36m    Check XRAY Vmess WS Config     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear
echo ""
read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " hst
bug_addr=${address}.
bug_addr2=${address}
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
bug=${hst}
bug2=bug.com
if [[ $hst == "" ]]; then
sni=$bug2
else
sni=$bug
fi
user=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
tls="$(cat ~/log-install.txt | grep -w "VLESS WS TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VLESS WS None TLS" | cut -d: -f2|sed 's/ //g')"
domain=$(cat /usr/local/etc/xray/domain)
uuid=$(grep "},{" /usr/local/etc/xray/vless.json | cut -b 11-46 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

vlesslink1="vless://${uuid}@${sts}${domain}:${tls}?type=ws&encryption=none&security=tls&host=${domain}&path=/vlessws&allowInsecure=1&sni=${sni}#XRAY_VLESS_TLS_${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:${none}?type=ws&encryption=none&security=none&host=${domain}&path=/vlessws#XRAY_VLESS_NON_TLS_${user}"
vlesslink3="vless://${uuid}@104.17.113.188:${tls}?type=ws&encryption=none&security=tls&host=${domain}&path=wss://who.int/vlessws&allowInsecure=1&sni=who.int#XRAY_VLESS_MAXIS_${user}"
vlesslink4="vless://${uuid}@162.159.134.61:${none}?type=ws&encryption=none&security=none&host=${domain}&path=/vlessws#XRAY_VLESS_DIGI_${user}"
vlesslink5="vless://${uuid}@104.20.65.29:${tls}?type=ws&encryption=none&security=tls&host=${domain}&path=wss://onlinepayment.celcom.com.my/vlessws&allowInsecure=1&sni=onlinepayment.celcom.com.my#XRAY_VLESS_CELCOM_${user}"
clear
echo -e ""
echo -e "════════════[XRAY VLESS WS]════════════"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port TLS          : $tls"
echo -e "Port None TLS     : $none"
echo -e "ID                : ${uuid}"
echo -e "Security          : TLS"
echo -e "Encryption        : None"
echo -e "Network           : WS"
echo -e "Path              : /vlessws"
echo -e "═══════════════════════════════════════"
echo -e "Link WS TLS       : ${vlesslink1}"
echo -e "═══════════════════════════════════════"
echo -e "Link WS None TLS  : ${vlesslink2}"
echo -e "═══════════════════════════════════════"
echo -e "Link (MAXIS)      : ${vlesslink3}"
echo -e "═══════════════════════════════════════"
echo -e "Link (DIGI)       : ${vlesslink4}"
echo -e "═══════════════════════════════════════"
echo -e "Link (CELCOM)     : ${vlesslink5}"
echo -e "═══════════════════════════════════════"
echo -e "YAML WS TLS       : http://${domain}:81/$user-VLESS-TLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML WS None TLS  : http://${domain}:81/$user-VLESS-NTLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (MAXIS)      : http://${domain}:81/$user-VLMAXIS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (DIGI)       : http://${domain}:81/$user-VLDIGI.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (CELCOM)     : http://${domain}:81/$user-VLCELCOM.yaml"
echo -e "════════════════════════════════════════"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "═══════════════════════════════════════"
echo -e ""
echo -e "Autoscript By Vinstechmy"
echo -e ""