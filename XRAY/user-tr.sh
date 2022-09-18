#!/bin/bash
#Autoscript-Lite By Vinstechmy
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/trojanws.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;41;36m    Check XRAY Trojan WS Config    \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                echo ""
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;41;36m    Check XRAY Trojan WS Config    \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2-3 | nl -s ') '
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

user=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
tr="$(cat ~/log-install.txt | grep -w "TROJAN WS TLS" | cut -d: -f2|sed 's/ //g')"
trnone="$(cat ~/log-install.txt | grep -w "TROJAN WS None TLS" | cut -d: -f2|sed 's/ //g')"
domain=$(cat /usr/local/etc/xray/domain)
uuid=$(grep "},{" /usr/local/etc/xray/trojanws.json | cut -b 17-52 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/trojanws.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
trojanlink1="trojan://${uuid}@${sts}${domain}:${tr}?type=ws&security=tls&host=${domain}&path=/trojanws&sni=${sni}#XRAY_TROJAN_TLS_${user}"
trojanlink2="trojan://${uuid}@${sts}${domain}:${trnone}?type=ws&security=none&host=${domain}&path=/trojanws#TROJAN_NON_TLS_${user}"
trojanlink3="trojan://${uuid}@104.17.113.188:${tr}?type=ws&security=tls&host=${domain}&path=wss://who.int/trojanws&sni=who.int#XRAY_TROJAN_MAXIS_${user}"
trojanlink4="trojan://${uuid}@162.159.134.61:${trnone}?type=ws&security=none&host=${domain}&path=/trojanws#TROJAN_DIGI_${user}"
trojanlink5="trojan://${uuid}@104.20.65.29:${tr}?type=ws&security=tls&host=${domain}&path=wss://onlinepayment.celcom.com.my/trojanws&sni=onlinepayment.celcom.com.my#XRAY_TROJAN_CELCOM_${user}"
clear
echo -e ""
echo -e "════════════[XRAY TROJAN WS]════════════"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "Port TLS          : $tr"
echo -e "Port None TLS     : $trnone"
echo -e "ID                : ${uuid}"
echo -e "Security          : TLS"
echo -e "Encryption        : None"
echo -e "Network           : WS"
echo -e "Path              : /trojanws"
echo -e "════════════════════════════════════════"
echo -e "Link WS TLS       : ${trojanlink1}"
echo -e "════════════════════════════════════════"
echo -e "Link WS None TLS  : ${trojanlink2}"
echo -e "════════════════════════════════════════"
echo -e "Link (MAXIS)      : ${trojanlink3}"
echo -e "════════════════════════════════════════"
echo -e "Link (DIGI)       : ${trojanlink4}"
echo -e "════════════════════════════════════════"
echo -e "Link (CELCOM)     : ${trojanlink5}"
echo -e "════════════════════════════════════════"
echo -e "YAML WS TLS       : http://${domain}:81/$user-TROJAN-TLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML WS None TLS  : http://${domain}:81/$user-TROJAN-NTLS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (MAXIS)      : http://${domain}:81/$user-TRMAXIS.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (DIGI)       : http://${domain}:81/$user-TRDIGI.yaml"
echo -e "════════════════════════════════════════"
echo -e "YAML (CELCOM)     : http://${domain}:81/$user-TRCELCOM.yaml"
echo -e "════════════════════════════════════════"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "════════════════════════════════════════"
echo -e ""
echo -e "Autoscript By Vinstechmy"
echo -e ""