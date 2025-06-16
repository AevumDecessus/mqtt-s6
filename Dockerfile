FROM lsiobase/alpine:3.17

LABEL maintainer="aevumdecessus"

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
         sudo \
         mosquitto \
         mosquitto-clients && \
  echo "**** Give abc sudo access to mosquitto ****" && \
  echo \
  "abc ALL=(ALL) NOPASSWD: /usr/sbin/mosquitto" >> \
         /etc/sudoers.d/mosquitto && \
  echo "**** remove default mosquitto conf ****" && \
  rm -f /etc/mosquitto/mosquitto.conf


# Add local files
COPY root/ /

# ports and volumes
EXPOSE 1883
VOLUME /config
