#!/usr/bin/env sh

ask()
{
	printf "%s [Y/n] " "$1"
	read -r answer
	if [ -z "$answer" ] || [ "$answer" = "y" ] || [ "$answer" = "Y" ]
	then
		return 0
	else
		return 1
	fi
}

if ! ask 'Are you sure you want to clean backup folder ?'
then
    exit 0
fi

# Remove all files
find backup -type f ! -name ".keep" -exec sudo rm {} \;

# Remove remaining empty folders
find backup -depth -type d -empty -exec sudo rmdir {} \;
