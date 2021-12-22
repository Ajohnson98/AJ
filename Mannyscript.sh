#!/bin/bash

aws iam create-user --user-name $1
echo "Creating username $1"
echo "Listing all users"
aws iam list-users | grep $1
echo "creating group"
aws iam create-group --group-name $2
aws iam list-groups | grep $2