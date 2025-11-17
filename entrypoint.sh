#!/usr/bin/env bash

envsubst "$(printf '${%s}' ${!NCHAN_*})" \
    < "/etc/nginx/sites-template/default" \
    > "/etc/nginx/sites-available/default"

exec "$@"
