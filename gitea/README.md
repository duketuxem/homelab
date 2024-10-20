# Gitea service

Your own personal and lightweight Github!

Check the [Gitea](https://about.gitea.com) website for more information.

## Environment

You can create an .env file here to adjust the user and group IDs if they don't match the default configuration.

```ini
UID=1002
GID=1002
```

## How to create a backup

Run:

```bash
docker-compose stop
sudo ./backup.sh
docker-compose up
```

## How to restore a backup

Make sure the data folder is empty (only the `.keep` file should remain), then run:

```bash
sudo tar -xzv --same-owner -f gitea-DATE-TIME.tar.gz -C data/
```