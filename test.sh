#!/bin/bash
#title
#description
#author
#date
#version
#usage
#CopyRights
#Contac

echo "Enter your Github Personal Access Token:"
read token
echo $token >token.txt
#cat token.txt
cat ~/.ssh/id_rsa.pub
#if condition to validate weather ssh keys are already present or not
if [$? -eq 0]
then
	echo "SSH Keys are already present..."
else
	echo "SSH Keys are not present ..., Creating using SSh-keygen command"
ssh-keygen -t rsa
echo "Key Successfully Generated"
fi

sshekey='cat ~/.ssh/id_rsa.pub'

if [$? -eq 0]
then
	echo "copying the key to github account"
curl -X POST -H "Contect-type : application/json" -d "{\"title\": \"SSHKEY\",\"Key\": \"$sshkey\"}" "https://api.github.com/user/keys?access_token=$token" 
if  [$? -eq 0]
then
echo "Succesfully copied the token to github"
exit 0
else
echo "Failed"
fi
else
echo "failure in generating the key"
exit 1
fi
