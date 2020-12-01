ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY app /app

# Install requirements for add-on
RUN apk add --no-cache python3
RUN apk add make build-base perl git linux-headers iproute2 openssl-dev

#RUN git clone https://github.com/eclipse/mosquitto.rsmb.git

#COPY mosquitto.rsmb/rsmb/src/broker_mqtts /

WORKDIR /app/




#RUN git clone https://github.com/rmurar/mosquitto.rsmb.git && cd mosquitto.rsmb/rsmb/src && make && cp broker_mqtts /app/ 
RUN git clone https://github.com/eclipse/paho.mqtt-sn.embedded-c.git && \
    cd paho.mqtt-sn.embedded-c/MQTTSNGateway && make SENSORNET=udp6 && \
    cp -pf Build/MQTT-SNGateway ../../ && cp -pf Build/MQTT-SNLogmonitor ../../ && make clean

RUN cd /app && git clone --depth 1 https://github.com/rmurar/RIOT.git
RUN cd /app/RIOT/dist/tools/ethos && make && cp ethos /app/
RUN cd /app/RIOT/dist/tools/uhcpd && make && cp bin/uhcpd /app/


WORKDIR /app/

RUN chmod a+x /app/run.sh

CMD [ "./run.sh" ]