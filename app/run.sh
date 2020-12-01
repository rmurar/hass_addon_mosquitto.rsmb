#!/usr/bin/with-contenv bashio
CONFIG_PATH=/data/options.json

NAME_CUSTOM="$(bashio::config 'name')"
YEAR_CUSTOM="$(bashio::config 'year')"

echo $NAME_CUSTOM
echo $YEAR_CUSTOM

pwd

ls -al

python3 -m http.server 8000

#cd RIOT/dist/tools/ethos && ./start_network /dev/ttyACM0 tap0 2001:db8::/64 | logger &

#./MQTT-SNGateway -f gateway.conf &

#mosquitto.rsmb/rsmb/src/broker_mqtts broker_config.conf
