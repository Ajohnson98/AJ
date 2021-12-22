#!/bin/bash

#creating bucket
aws s3 $1 s3://$2

# checking buckets
aws s3 ls
