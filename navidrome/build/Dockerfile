# Considering there would be not so much breaking changes
# for the required dependencies, the version is not fixed
FROM alpine:latest

# Received from ../docker-compose.yaml, which gets it from ../.env
ARG APP_VERSION
ARG GUID
ARG UUID

# Also mkdir
WORKDIR /app

RUN mkdir ./config ./bin \
	&& wget https://github.com/navidrome/navidrome/releases/download/v${APP_VERSION}/navidrome_${APP_VERSION}_linux_amd64.tar.gz -O navidrome.tar.gz \
	&& tar -C ./bin -zxvf navidrome.tar.gz navidrome \
	&& rm navidrome.tar.gz \
	&& addgroup -g ${GUID} navi && adduser -H -D -G navi -u ${UUID} navi \
	&& chown -R navi:navi /app

# Overall configuration + data persistence
COPY navidrome.toml /app/config

# Match the config in navidrome.toml
VOLUME [ "/cache", "/data", "/music" ]

# Switch to a non-root user for better security
USER navi

ENTRYPOINT [ "/app/bin/navidrome", "--configfile", "/app/config/navidrome.toml" ]

EXPOSE 4533