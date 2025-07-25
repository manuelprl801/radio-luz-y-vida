FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y icecast2 liquidsoap gettext-base && \
    rm -rf /var/lib/apt/lists/*

COPY icecast.xml.template /etc/icecast2/icecast.xml.template
COPY radio.liq.template /radio.liq.template
COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN mkdir -p /music
VOLUME ["/music"]

ENV PORT=8000
EXPOSE 8000
CMD ["/run.sh"]
