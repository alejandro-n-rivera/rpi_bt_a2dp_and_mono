# startA2DP.sh
A shell script that makes use of [bluealsa](https://github.com/Arkq/bluez-alsa) to configure a Raspberry Pi as an A2DP Bluetooth Audio receiver. Instructions are included in the comments of the script.

# makemono
An optional configuration file for system-wide mono audio. Mono audio is played on both the Left and Right audio channels--useful if you require mono output from the RPi's audio jack. Instructions are included in the comments of the file. It should be renamed to asound.conf and placed in /etc (reboot to apply changes).

These files were used on a Raspberry Pi 3 Model B

