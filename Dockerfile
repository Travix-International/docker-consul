FROM travix/base-alpine:latest

MAINTAINER Travix

# build time environment variables
ENV CONSUL_VERSION=0.6.4

# install consul.io server
RUN apk --update add \
      curl \
      unzip \
    && rm /var/cache/apk/* \
    && mkdir -p /opt/consul /data \
    && curl -fSL "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" -o consul.zip \
    && unzip consul.zip -d /opt/consul \
    && rm -f consul.zip

COPY ./config /config/

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
