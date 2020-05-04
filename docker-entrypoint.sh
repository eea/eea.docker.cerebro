#!/bin/sh

set -e

export CEREBRO_PORT=${CEREBRO_PORT:-9000}
export ELASTIC_URL=${ELASTIC_URL:-'http://localhost:9200'}
export CEREBRO_SECRET=${CEREBRO_SECRET:-"$(openssl rand -base64 32)"}


if [ -z "$BASIC_AUTH_USER" ] && [ $(grep -c  "^auth =" /opt/cerebro/conf/application.conf) -gt 0 ]; then

   start=$(grep -n "^auth =" /opt/cerebro/conf/application.conf | awk -F: '{print $1}')
   start=$(($start-1))
   end=$(($start+9))

   sed -i "${start},${end}d" /opt/cerebro/conf/application.conf

fi


exec $@ 

