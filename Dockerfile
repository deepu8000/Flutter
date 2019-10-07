FROM antoniopicone/ubuntu_develop

WORKDIR /tmp

# Setting up development user
ARG USERNAME=devuser

RUN wget -O /tmp/flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.7.8+hotfix.4-stable.tar.xz

RUN tar xf /tmp/flutter.tar.xz && \
    rm -rf /tmp/flutter.tar.xz && \
    mv /tmp/flutter /home/$USERNAME/flutter

ENV FLUTTER_PATH="/home/$USERNAME/flutter/bin"
ENV PUB_CACHE_BIN="/home/$USERNAME/flutter/.pub-cache/bin"
ENV DART_PATH="/home/$USERNAME/flutter/bin/cache/dart-sdk/bin"

ENV PATH="$PATH:${FLUTTER_PATH}:${PUB_CACHE_BIN}:${DART_PATH}"

# Added alias 'livecode' to execute web dev server
RUN echo 'alias livecode="flutter packages pub global run webdev serve --hostname 0.0.0.0 --auto restart"' >> ~/.bashrc

# Execute minimum actions for flutter development
RUN flutter precache && flutter config --no-analytics && flutter upgrade

# FROM nathansamson/flutter-builder-docker
# FROM antoniopicone/flutter_web

# ENV FLUTTER_HOME=/home/gitpod/flutter \
#    PATH=/usr/lib/dart/bin:$FLUTTER_HOME/bin:$PATH

# USER root

# RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
#    curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list && \
#    apt-get update && \
#    apt-get -y install  build-essential dart libkrb5-dev gcc make && \
#    apt-get clean && \
#    apt-get -y autoremove && \
#    apt-get -y clean && \
#    rm -rf /var/lib/apt/lists/*

# RUN cd /home/gitpod && wget -O flutter_sdk.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.0.0-stable.tar.xz \
#    && tar -xvf flutter_sdk.tar.xz && rm flutter_sdk.tar.xz;
