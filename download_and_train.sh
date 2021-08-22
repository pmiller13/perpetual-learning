#!/bin/bash

function rm_runfile() {
  rm -f $RUNFILE
}
PROG_PATH="$(dirname $0)"
PROG_NAME="$(basename $0)"
RUNFILE="${PROG_PATH}/${PROG_NAME}.running"
trap rm_runfile INT KILL HUP
if [ -f $RUNFILE ]; then
  echo "${PROG_NAME} already running, exiting"
  exit 0
fi

touch $RUNFILE

echo "Downloading next training data"
echo " => curl domain.com/download -o tmp.json"
echo
echo "Unpacking text and image from json blob"
echo " => python unpack_json.py -f tmp.json"
echo "text='i test in production' image='/var/spool/foo.jpg'"
sleep 1
echo
echo "Training with text='i test in production', image='/var/spool/foo.jpg"
echo " => python gan.py --text 'i test in production' --image '/var/spool/foo.jpg'"
sleep 1
echo
echo "Moving .mp4 to videos directory"
echo " => mv output.mp4 /app/videos/output007.mp4"
sleep 1
rm_runfile
