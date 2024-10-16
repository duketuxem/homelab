# Baikal service

A lightweight and user-friendly Calendar and Contacts server with an intuitive interface to manage users and settings.

Perfect for keeping your personal contacts and schedule under your control.

More information on the [Baikal](https://sabre.io/baikal/) website.

## How to run

1. Create/check there is an `.env` file in this directory with the following variable:
```ini
APP_VERSION=0.9.5
```
See https://github.com/sabre-io/Baikal/tags for versions

2. Run:
```bash
docker-compose build
docker-compose up -d
```

3. Access the app at [localhost:8080](http://localhost:8080) and complete the server configuration.

4. Connect your devices (e.g., phone, desktop clients) and enjoy seamless synchronization of your calendar and contacts.

## Notes

For simplicity, this setup uses SQLite for data storage.

Data is persisted in Docker volumes so no bind mounts are involved.

### Making a Backup

To back up your data:

1. Stop the service:
    ```bash
    docker-compose down
    ```

2. Dump the volumes:
    ```bash
    ./volumes-dump.sh
    ```
    This replicates the volume contents into the `backup` directory.

3. Tag the backup:
    ```bash
    ./tag-backup.sh
    ```
    This creates a `.tar.gz` archive of the backup folder with the current date as part of the filename.

4. Empty the backup folder (optional):
    ```bash
    ./empty-backup-folder.sh
    ```
    This clears the `backup` folder but preserves the directory structure for the next backup.

5. Restart the service:
    ```bash
    docker-compose up -d
    ```

## Restoring a Backup

It’s recommended to start fresh when restoring from a backup:

1. Initialize the volumes:
    ```bash
    docker-compose up
    ```
    Once the services are initialized, press `Ctrl+C` to stop the running containers.

2. Restore the backup:
    Extract the archive and copy (using `cp -a`\!) the relevant data to the appropriate folders:
    - `backup/config`
    - `backup/Specific`

3. Load the volumes:
    ```bash
    ./volumes-load.sh
    ```

4. Start the service:
    ```bash
    docker-compose up -d
    ```
    Verify that everything is back in place and functioning properly.

5. Prepare for the next backup:
    ```bash
    ./empty-backup-folder.sh
    ```
    This keeps the folder ready for the next backup cycle.