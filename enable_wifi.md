enable wifi on rapsberry pi via command line

check if wifi is blocked:
rfkill list all
sudo rfkill unlock wifi
rfkill list all
sudo ifconfig up/down to enable wifi or not
make sure that wifi info is in wpasupplicant.conf file in
/etc/wpa_supplicant/wpa_supplicant.conf

network={
    ssid="lalal"
    psk="password"
}

pi should auto connect, but reboot if suspicious
