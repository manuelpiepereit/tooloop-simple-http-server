#!/bin/bash

pkill chromium &
fuser -k 9000/tcp &

exit 0
