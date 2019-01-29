#!/bin/bash

# start server
cd /assets/data

# set url
URL="http://localhost:9000"

COMMAND="chromium-browser \
--bwsi \
--class=TooloopKiosk \
--disable-overscroll-edge-effect \
--disable-infobars \
--disable-translate \
--disable-pinch \
--enable-zero-copy \
--incognito \
--noerrdialogs \
--no-default-browser-check \
--no-message-box \
--no-first-run \
--num-raster-threads=4 \
--overscroll-history-navigation=0 \
--pull-to-refresh=0 \
--kiosk \
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
