FROM alpine

RUN apk add --update sqlite && rm -rf /var/cache/apk/*

COPY ./init /

ENTRYPOINT ["/init"]
