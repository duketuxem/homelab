# Syncthing

Synchronize all data you want thanks to [Syncthing](https://syncthing.net/)

Syncthing excels at keeping data seamlessly redundant between devices. It can
handle large amounts of data, implement backup strategies, apply file pattern
filters, and much more!


## How to run

1. [MANDATORY] Create an `.env` file in this directory with the following variables:
```ini
# Where the app will persist/read data on the host
HOST_MOUNT=/home/user/navidrome

# [OPTIONAL] Create a different UUID/GUID than 1000 to match your user's
UUID=1002
GUID=1002
```

2. Run `docker compose up -d`
