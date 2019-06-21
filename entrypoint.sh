#!/bin/sh

echo "Action : $1"

if [ "$1" == 'no-cron' ]; then
    /dobackup.sh
else
    echo "creating crontab"
    echo -e "$CRON_SCHEDULE /dobackup.sh\n" > /etc/crontabs/root
    echo "starting crond"
    crond -f
fi
