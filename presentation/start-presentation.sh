#!/bin/bash

# start server
cd /assets/data

# set url
URL="http://localhost:9000"

COMMAND="chromium-browser \
--kiosk \
--bwsi \
--overscroll-history-navigation=1 \
--incognito \
--disable-infobars \
--disable-translate \
--no-default-browser-check \
--no-first-run \
--disable-translate-new-ux \
--num-raster-threads=4 \
--enable-zero-copy \
--noerrdialogs \
--class=TooloopKiosk \
$URL"

# kill open port and chromium
fuser -k 9000/tcp
pkill chromium
sleep 0.1
# start server and chromium
python -m SimpleHTTPServer 9000 &
$COMMAND &

#if [ $EUID == 0 ]; then
#    pkill chromium
#    sleep 0.1
#    su tooloop -c "$COMMAND" &
#else
#    pkill chromium
#    sleep 0.1
#    $COMMAND &
#fi

exit 0
