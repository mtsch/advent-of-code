#!/bin/bash

secret=$1
num=0

# najbolj neučinkovita koda na svetu:
while md5 -d"${secret}${num}" | grep -vq '^00000'; do
  (( num++ ))
  echo -n $'\r' $num
done

echo


