FROM nginx:1.27.2

ARG APP_VERSION

# Build
WORKDIR /app

RUN apt-get update && apt-get install unzip wget \
    && wget https://github.com/sabre-io/Baikal/releases/download/${APP_VERSION}/baikal-${APP_VERSION}.zip -O baikal.zip \
    && unzip baikal.zip \
    && rm baikal.zip \
    && chown -R 82:82 /app/baikal/config /app/baikal/Specific
    #           ^^ match the www-data id from the php-fpm image

COPY baikal.conf /etc/nginx/conf.d/default.conf

# Runtime:

# The only data to be saved (in anonymous volumes if omitted in runtime parameters...)
VOLUME /app/baikal/config /app/baikal/Specific
