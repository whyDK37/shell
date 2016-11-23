#!/bin/sh

for  i in {1..1000}
do
#  return open file list
  lsof -p pid > /tmp/20161123/$i.log
#  only return open file count
#  lsof -p pid | ec -l
  sleep 0.01
done