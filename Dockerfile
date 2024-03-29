FROM darkflib/nginx-nchan:1.24.0

ENV NCHAN_SHARED_MEMORY_SIZE=256M \
    NCHAN_MESSAGE_BUFFER_LENGTH=10 \
    NCHAN_MESSAGE_TIMEOUT=10s \
    NCHAN_HTTP_KEEPALIVE_REQUESTS=10000

COPY /entrypoint.sh /
COPY /default.conf /etc/nginx/sites-template/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
