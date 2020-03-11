#!/bin/bash -e

envsubst \
 '$$NGINX_SERVER_NAME' \
 < /etc/nginx/conf.d/default.conf.template \
 > /etc/nginx/conf.d/default.conf

envsubst < /etc/nginx/lua/saml/service_provider/config.lua.template > /etc/nginx/lua/saml/service_provider/config.lua

cat /etc/nginx/nginx.conf
cat /etc/nginx/lua/saml/service_provider/config.lua

nginx -g "daemon off;"
