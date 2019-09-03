#!/bin/bash

# User-Agent List
UA=$(cat ua.txt | sort -R  | head -1)

# Get item in stream
getStream(){
local ugh=$(curl -A "${UA}" -s "https://gabut.club/api/v3-beta/method/stream.get" \
-d "accessToken=${TOKID[0]}&language=en&itemId=0&accountId=${TOKID[1]}&")
  local mylike=$(echo -e "${ugh}" | grep -Po "(?<=\"myLike\":).*?(?=,)")
  local ids=$(echo -e "${ugh}" | grep -Po "(?<=\"id\":\").*?(?=\",)")
local retVal=$(paste <(echo "${ids}") <(echo "${mylike}") --delimiters='|')
if [[ $mylike != "true" ]]; then
echo -e "${retVal}" | grep "false" >> di.txt
fi
}

# Filter itemId
getId(){
while IFS='|' read -ra TOKID
do
getStream ${TOKID[0]} ${TOKID[1]}
done < tok.txt
}
getId
cat di.txt | grep -Eo "[0-9]{1,}" >> id.txt
rm di.txt
