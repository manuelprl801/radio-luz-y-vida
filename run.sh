#!/bin/bash
set -e
PORT_TO_USE=${PORT:-8000}

envsubst < /etc/icecast2/icecast.xml.template > /etc/icecast2/icecast.xml
sed "s/{{PORT}}/${PORT_TO_USE}/g" /radio.liq.template > /radio.liq

icecast2 -b -c /etc/icecast2/icecast.xml &
exec liquidsoap /radio.liq
