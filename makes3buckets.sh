#!/bin/bash
buckets="$1 $2 $3 $4"

echo $buckets

for x in $buckets
do
aws s3 mb s3://$x
done
aws s3 ls
