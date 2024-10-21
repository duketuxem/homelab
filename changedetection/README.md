# Changedetection service

A simple and user-friendly web application to monitor changes on any webpage, easy to set up.

Use it to track your favorite news updates, software releases, or any other website content changes.

[Changedetection Website](https://changedetection.io)

[Changedetection Github](https://github.com/dgtlmoon/changedetection.io)


## How to run

```bash
docker-compose up -d
```


## How to backup

You can easily back up the app's configuration through the web interface by downloading a .zip file.

Alternatively, you can copy data directly from the Docker volume, though the result seems to be the effectively the same.


## Restoring a backup

Currently, there isn't a simple restore feature, though there is an [open issue](https://github.com/dgtlmoon/changedetection.io/issues/130) requesting it.

To restore data manually:

1. Run the app for the first time, then stop the container.

2. Use a temporary container to mount both the .zip backup file and the `changedetection_data` volume.

3. Copy the files using `cp -a` into the volume.