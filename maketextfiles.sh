#!/bin/bash

buckets="$1 $2 $3 $4"
echo $bucket

for x in $buckets
do
touch $x
done
ls
