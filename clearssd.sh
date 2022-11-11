#!/bin/bash

echo 'Clearing ssd image cache on pi remotes'

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

for remote in $(cat $DIR/remotes); do
  ssh cslics04@$remote rm /media/cslics04/cslics_ssd/images/*.png 2>&1 | tee $remote.log &
done

wait

echo '/media/cslics04/cslics_ssd/images cleared'