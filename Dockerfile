ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /
COPY broker_config.conf /

# Install requirements for add-on
RUN apk add --no-cache python3
RUN apk add make build-base perl git
RUN git clone https://github.com/eclipse/mosquitto.rsmb.git && cd mosquitto.rsmb/rsmb/src && make
#RUN git clone https://github.com/eclipse/mosquitto.rsmb.git

#COPY mosquitto.rsmb/rsmb/src/broker_mqtts /

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]