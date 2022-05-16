FROM debian:11.0-slim

RUN apt-get update \
    && apt install -y --no-install-recommends \
        ca-certificates \
        gnupg

COPY ca-certificates /home/ca-certificates/
RUN cat /home/ca-certificates/* > /home/ca-certificates/certificates.crt
RUN cp /home/ca-certificates/certificates.crt /usr/local/share/ca-certificates/certificates.crt
RUN update-ca-certificates
RUN echo "deb https://packages.sury.org/php bullseye main" > /etc/apt/sources.list.d/sury.list \
    && apt-key adv --fetch-keys https://packages.sury.org/php/apt.gpg


RUN apt-get update \
    && apt-get install -y --no-install-recommends

ARG PHP_VERSION
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-common \
            php${PHP_VERSION}-gd \
        && apt-get clean

COPY ./ /
RUN chmod +x /index.php

