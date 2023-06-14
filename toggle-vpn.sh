!#/bin/bash

vpn_con="soltani@ssl-vpn.vz-nrw.de";

if [[ -n $(nmcli con show $vpn_con | grep "VPN connected") ]]; 
then 
    nmcli con down $vpn_con; 
    gsettings set org.gnome.system.proxy mode "none"; 
else 
    nmcli con up $vpn_con; 
    gsettings set org.gnome.system.proxy mode "manual"; 
fi; 
