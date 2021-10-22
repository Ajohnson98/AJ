#!/bin/bash


echo "Please enter type of sport:"
read sport
if [ $sport = football ]
	        then echo "Amazing, I love Football"
		elif [ $sport = soccer ]
			        then echo "Good, I like Soccer"
				elif [ $sport = basketball ]
					        then echo "Good, I like basketball"
							        else echo "Oh no, I don't like that sport!"
fi
