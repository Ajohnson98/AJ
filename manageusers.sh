#!/bin/bash
echo -n "would you like to create users, yes or no: "
read Decision
if [ $Decision = yes ]
then
	echo -n "user name:"
	read name
	aws iam create-user --user-name $name
	echo "Creating username $name"
	echo "Listing all users"
	aws iam list-users | grep $name
else
echo "ok I will not create a user"
fi

echo -n "Would you like to create a group?: "
read groupchoice
 
if [ $groupchoice = yes ]
then
	echo -n "Please enter group name: "
	read group
aws iam create-group --group-name $group	
echo "Listing all groups"
aws iam list-groups
else	
	echo "You do not want to create users or groups."
fi
echo -n "Would you like to add users to groups:"
read addusers
if [ $addusers = yes ]
then
echo -n "user name:"
read adduser
echo -n "group name:"
read addgroup
aws iam add-user-to-group --user-name $adduser --group-name $addgroup
fi


