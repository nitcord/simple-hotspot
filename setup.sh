sudo apt-get install network-manager

sudo sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf

sudo nmcli connection add type ethernet ifname eth0 con-name "mobile" autoconnect yes
sudo nmcli connection add type wifi ifname wlan0 con-name "hotspot" autoconnect yes ssid "Hotspot"

# Allowed 5 GHz channels in the UK: 36, 40, 44, 48, 52, 56, 60, 64, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136, 140 (some require DFS/TPC per Ofcom)
# Allowed 5 GHz channels in the US: 36, 40, 44, 48, 52, 56, 60, 64, 100, 104, 108, 112, 116, 120, 124, 128, 132, 136, 140, 144, 149, 153, 157, 161, 165 (some require DFS per FCC)
sudo nmcli connection modify "hotspot" 802-11-wireless.mode ap 802-11-wireless.band a 802-11-wireless.channel 48 ipv4.method shared ipv6.method ignore

sudo nmcli connection modify "hotspot" wifi-sec.key-mgmt wpa-psk
sudo nmcli connection modify "hotspot" wifi-sec.psk "PASSWORD_GOES_HERE"

sudo nmcli connection up mobile
sudo nmcli connection up hotspot
