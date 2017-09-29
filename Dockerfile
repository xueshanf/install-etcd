FROM alpine:3.6
LABEL maintainer="Xueshan Feng <xueshan.feng@gmail.com>"
ADD start.sh /start.sh
RUN chmod +x /start.sh
VOLUME ["/shared"]
CMD [ "/start.sh" ]
