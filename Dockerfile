FROM alpine:3.12

RUN apk add --no-cache pdns pdns-backend-pipe bash

EXPOSE 53/tcp 53/udp

COPY bin/xip-pdns /usr/local/bin
RUN chmod +x /usr/local/bin/xip-pdns
COPY etc/xip-pdns.conf /etc
COPY pdns/pdns.conf /etc/pdns/pdns.conf

CMD ["/usr/sbin/pdns_server", "--daemon=no", "--disable-syslog", "--write-pid=no"]
