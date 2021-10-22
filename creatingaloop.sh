#!/bin/bash

bucket1=$(aws s3 ls | grep tyler |sed '2d'| cut -c21-28)
	bucket2=$(aws s3 ls | grep try | cut -c21-41)

echo "would you like to delete buckets"
read answer


echo "you chose $bucket1 and $bucket2"

if [[ $answer = yes ]]
then
	echo "delteing the following buckets $bucket1 and $bucket2"
	aws s3 rb s3://$bucket1
	aws s3 rb s3://$bucket2
	echo "these are the buckets I have left"
	aws s3 ls
else  
	echo "you said no and would like to create more buckets"
	aws s3 mb s3://adrianjohn9218 
	aws s3 mb s3://tylercvi98
fi
