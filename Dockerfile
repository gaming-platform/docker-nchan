FROM ubuntu:24.04

RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes software-properties-common \
    && add-apt-repository --yes ppa:ondrej/nginx \
    && apt install --yes \
        gettext \
        nginx=1.28.0-1+ubuntu24.04.1+deb.sury.org+2 \
        libnginx-mod-nchan=1:1.3.7+dfsg+1.28.0-2+ubuntu24.04.1+deb.sury.org+1 \
    && apt-get purge --yes software-properties-common \
    && apt-get autoremove --yes \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV NCHAN_SHARED_MEMORY_SIZE=256M \
    NCHAN_MESSAGE_BUFFER_LENGTH=10 \
    NCHAN_MESSAGE_TIMEOUT=10s \
    NCHAN_HTTP_KEEPALIVE_REQUESTS=10000

COPY /entrypoint.sh /
COPY /config/nginx/site-template /etc/nginx/sites-template/
COPY /config/nginx/conf.d /etc/nginx/conf.d/

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
