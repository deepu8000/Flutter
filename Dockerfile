
FROM gitpod/workspace-full

USER root
RUN apt-get update && apt-get install -y \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod

WORKDIR /tmp

# Setting up development user
ARG USERNAME=gitpod

RUN wget -O /tmp/flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.5-stable.tar.xz

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
RUN flutter precache && flutter config --no-analytics && flutter upgrade && flutter channel beta && flutter upgrade && flutter config --enable-web

USER root

# Set the Chrome repo.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# Install Chrome.
RUN apt-get update && apt-get -y install google-chrome-stable
