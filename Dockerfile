FROM alpine:3.13
RUN apk --no-cache add vsftpd

RUN ln -sf /dev/stdout /var/log/vsftpd.log

COPY start_vsftpd.sh /bin/start_vsftpd.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010
VOLUME /ftp/ftp

ENTRYPOINT ["/bin/start_vsftpd.sh"]
