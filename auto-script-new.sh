#!/usr/bin/env bash
#defining variables
gc=gclustering.sparklingGraphTwitter
ocd=ocdetection.OverlappingCommunityDetection
rgd=
echo "Hello welcome to automation script to run link prediction application with varying data size and resource size"

echo "creating directory for data"

filename=$1
if [ -f "$filename" ]; then
  echo "File $1 exists"
else
  echo "File does not exists"
fi

for (( counter=10; counter>0; counter-- ))
do
echo -n "$counter "	
echo "run spark-submit here"
done
printf "\n"

for FILE1 in "$@"
do
wc $FILE1
done

for data in 


#takpe la cm byk masa guna utk buat ni
#echo "Copying spark-evetns to history tmp for results monitoring"
#cd /tmp
#cp -r /tmp/spark-events /tmp/spark-events
#hdfs dfs -put . /tmp/spark-events

#echo "Deleting /tmp/spark-events"
#cd /tmp
#rm -R /tmp/spark-events/*
