#!/usr/bin/env bash

echo OpenJVS Debug

echo "---- OpenJVS Debug ----" > /tmp/openjvs-debug
echo " " >> /tmp/openjvs-debug
echo "-- lsusb --" >> /tmp/openjvs-debug
lsusb 2>&1 >> /tmp/openjvs-debug

echo " " >> /tmp/openjvs-debug
echo "-- evtest --" >> /tmp/openjvs-debug
for f in /dev/input/event*; do
  echo "- Device: $f -" >> /tmp/openjvs-debug
  evtest --grab $f 2>&1 >> /tmp/openjvs-debug &
  echo Waiting...
  sleep 2
  killall -9 evtest 2>&1 > /dev/null
done
sleep 1
echo ""
echo " " >> /tmp/openjvs-debug
echo "-- openjvs --" >> /tmp/openjvs-debug
openjvs --list >> /tmp/openjvs-debug

echo ""
echo "Waiting for link... "
cat /tmp/openjvs-debug | nc termbin.com 9999
echo "Finished, please send bobby the above link!"

