FROM alpine:3.13

RUN apk --no-cache add vsftpd pwgen

EXPOSE 21 21000-21010

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY docker-vsftpd-start /usr/local/bin/

ENTRYPOINT ["docker-vsftpd-start"]
