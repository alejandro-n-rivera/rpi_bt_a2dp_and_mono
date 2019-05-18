#!/bin/bash
# This shell script must be run with sudo/root privileges
# Place this shell script in /home/pi
# Add "sudo /home/pi/startA2DP.sh" (without quotes) to the end of /home/pi/.profile to run automatically after login
# Alternatively add to the end of /etc/xdg/lxsession/LXDE-pi/autostart for system-wide automatic run
# Don't forget to <sudo chmod +x /home/pi/startA2DP.sh> to mark as executable
# Before first run, do: <sudo apt-get update>, then <sudo apt-get upgrade>, and then: <sudo apt-get install bluealsa python-dbus>
# Make RPi discoverable over bluetooth (click on BT icon in taskbar)
# Initiate one-time pairing from the RPi in order to invoke a passkey
# Don't try to connect to the RPi from the BT Audio source first. Connect to the source from RPi BT menu in taskbar.
# Play around with pcm-buffer-time and pcm-period-time to adjust audio/video sync/delay (read bluealsa documentation online)
# Reboot after making changes to buffer/period time values
# NOTE: If connection is made, but there is no sound, right-click the volume icon in the taskbar and make sure it's set to "Analog" then reboot
# NOTE: This script does not stop after pressing Ctrl+C (due to forking '&' at the end), it continues running in the background

echo "Starting A2DP..."

# Remove old files in case of bad prev. exit
rm /var/run/bluealsa/*

# Start A2DP receiver stream, wait 1 sec, then route to headphone jack
bluealsa -p a2dp-sink & sleep 1s; bluealsa-aplay --pcm-buffer-time=135000 --pcm-period-time=33750 -vv 00:00:00:00:00:00 &

echo "A2DP Started."
