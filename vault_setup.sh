#!/bin/bash
#create directory
mkdir secure_vault
touch ./secure_vault/keys.txt ./secure_vault/secrets.txt ./secure_vault/logs.txt
echo "Welcome to keys file" > ./secure_vault/keys.txt
echo "Welcome to secrets file" > ./secure_vault/secrets.txt
echo "Welcome to logs files" > ./secure_vault/logs.txt
echo "Files successfully created"
ls -l secure_vault
