# Navidrome service

Enjoy your music collection with [Navidrome](https://www.navidrome.org).

Nice to use thanks to its simple interface, and compatible with mobile clients!


## How to run

1. Create an `.env` file in this directory with the following variables:
```ini
# Check https://github.com/navidrome/navidrome/releases
APP_VERSION=0.53.0

# Where the app will persist/read data on the host
HOST_PREFIX=/home/user/navidrome

# Check the output of the following command: id -u && id -g
UUID=1000
GUID=1000
```

2. Create those three directories **as a regular user**, under the previously defined HOST_PREFIX value:
```sh
$> mkdir -p /home/user/navidrome{/cache,/data,/music}
```

3. Run `docker-compose up -d`.
