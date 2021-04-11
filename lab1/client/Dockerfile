FROM alpine

RUN apk update
RUN apk add --no-cache tshark && apk add bash && apk -U upgrade && \
    apk add nano && \
    rm -rf /var/cache/apk/*
RUN apk add vim && apk add tcptraceroute 
