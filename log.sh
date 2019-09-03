#!/bin/bash

# User-Agent List
UA=$(cat ua.txt | sort -R  | head -1)

# Username Password
USER="username"
PASS="password"

# Login
login(){
local log=$(curl -s -k -A "${UA}" "https://gabut.club/api/v3-beta/method/account.signIn" \
-d "username=${USER}&clientId=1005&password=${PASS}")
local tok=$(echo -e "${log}" | grep -Po '(?<=\"accessToken\":").*?(?=")')
local id=$(echo -e "${log}" | grep -Po '(?<=\"accountId\":").*?(?=")')
local retVal=$(paste <(echo "${tok}") <(echo "${id}") --delimiters='|')
echo "${retVal}"
echo -e "${retVal}" > tok.txt
}
login
