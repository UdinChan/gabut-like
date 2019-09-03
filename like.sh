#!/bin/bash
# Nikmati aja gayn

# User-Agent List
UA=$(cat ua.txt | sort -R  | head -1)

# Colours
DG='\033[1;32m'
NC='\033[0m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
GREEN='\e[38;5;82m'

# ID Token
TOKEN=""
ID=""

# run get.sh
bash get.sh

like(){
curl -A "${UA}" -s "https://gabut.club/api/v3-beta/method/items.like" \
--data "accessToken=${TOKEN}&accountId=${ID}&itemId=${itemId}&" | grep -Po 'myLike":true' > /dev/null;ppk=$?
if [[ $ppk != false ]]; then
echo -e "${CYAN}$itemId${NC} = ${GREEN}Liked${NC}"
else
echo -e "${CYAN}$itemId${NC} = ${GREEN}Already Liked${NC}"
fi
}

doLike(){
NOW=`date "+%r"`

for itemId in `cat $item`
do
like $itemId
done
rm id.txt
}

cek(){
if [ ! -f $item ]; then
echo "File $item Not Found"
exit
else
doLike
fi
}

item='id.txt'
cek
