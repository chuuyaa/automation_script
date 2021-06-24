#!/usr/bin/env bash
#defining variables
gc=gclustering.sparklingGraphTwitter
ocd=ocdetection.OverlappingCommunityDetection
rgd=mapreducePredictionTwitter

echo "Hello welcome to automation script to run link prediction application with varying data size and resource size"

echo "chech if all data files exists"

echo "loop over data"
for data in '100k.txt' '200k.txt' '300k.txt' '400k.txt' '500k.txt' '600k.txt' '700k.txt' '800k.txt' '900k.txt' '1000k.txt';
do
	echo "running gclustering app in standalone mode"
	spark-submit --class $gc --master spark://cmaster:7077 /home/hadoop/graphx-application/target/scala-2.12/graphx-experiment_2.12-1.0.jar "/tmp/$data" --data /tmp/100k.txt --workload 5 --mm 64 --mc 8 --wn 3 --wmpn 64 --wcpn 8
        echo "running ocdetection app in standalone mode"
	spark-submit --class $ocd --master spark://cmaster:7077 /home/hadoop/graphx-application/target/scala-2.12/graphx-experiment_2.12-1.0.jar "/tmp/$data" --data /tmp/$data --workload 5 --mm 64 --mc 8 --wn 3 --wmpn 64 --wcpn 8
        echo "running rgdetection app in standalone mode"
	spark-submit --class $rgd --master spark://cmaster:7077 /home/mapreduce-experiment/target/mapreduce-experiment-1.0-SNAPSHOT.jar "/tmp/$data" --data /tmp/$data --workload 5 --mm 64 --mc 8 --wn 3 --wmpn 64 --wcpn 8
	echo "succesfully executed"
done
#takpe la cm byk masa guna utk buat ni
#echo "Copying spark-evetns to history tmp for results monitoring"
#cd /tmp
#cp -r /tmp/spark-events /tmp/spark-events
#hdfs dfs -put . /tmp/spark-events

#echo "Deleting /tmp/spark-events"
#cd /tmp
#rm -R /tmp/spark-events/*
