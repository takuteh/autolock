#!/bin/sh

ask_yes_no() {
    while true; do
        echo -n "$* [y/n]:"
        read ANS
        case $ANS in
        [Yy]*)
            return 0
            ;;
        [Nn]*)
            return 1
            ;;
        *)
            echo "Input y or n!"
            ;;
        esac
    done
}

WD=$(pwd)
#パッケージインストール
apt install pigpio mosquitto libmosquitto-dev

#mqtt設定
MQTT_CONFIG="/etc/mosquitto/mosquitto.conf"
if ! grep -q "listener" "$MQTT_CONFIG"; then
    echo "listener 1883" >> "$MQTT_CONFIG"
    MQTT_PORT=1883
else
#既にmqttのポートが設定されている場合そのポートを代入
    MQTT_PORT=$(grep "listener" "$MQTT_CONFIG"|awk '{print $2}')
fi

#外部からのアクセスを許可
if ! grep -q "allow_anonymous true" "$MQTT_CONFIG"; then
    echo "allow_anonymous true" >> "$MQTT_CONFIG"
fi

echo "Mqtt listener port is" $MQTT_PORT

#setting.jsonにMQTTのポートを設定
if ! grep -q "mqtt_port" autolock_setting.json; then
    echo "mqtt_port:$MQTT_PORT" >> autolock_setting.json
else 
    sed -i "s/\"mqtt_port\":[0-9]*/\"mqtt_port\":$MQTT_PORT/" autolock_setting.json
fi

#autolockコンパイル
cd src
make

#systemd登録
sed -i "s|^WorkingDirectory=.*|WorkingDirectory=$WD|" "service/autolock.service"
sed -i "s|^ExecStart=.*|ExecStart=$WD/autolock|" "service/autolock.service"
cp service/autolock.service /etc/systemd/system
systemctl daemon-reload 
systemctl enable autolock.service
systemctl enable pigpiod.service

if ask_yes_no "All tasks are completed. Do you want to reboot the system?"; then
    echo "Rebooting the system..."
    reboot
else
    echo "Aborting"
    exit 1
fi
