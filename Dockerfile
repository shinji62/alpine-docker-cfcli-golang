FROM golang:1.6-alpine

MAINTAINER Gwenn Etourneau <gwenn.etourneau@gmail.com>

RUN apk upgrade
RUN apk add --update \
    bash \
    git  \
    curl \
    jq  && rm -rf /var/cache/apk/*

RUN curl -sSL "http://cli.run.pivotal.io/stable?release=linux64-binary&version=6.18.1&source=github-rel"  -o cf-cli_amd64.tar.gz
RUN gzip -dc cf-cli_amd64.tar.gz | tar xf -

RUN mv cf /bin && chmod +x /bin/cf
