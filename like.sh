#!/bin/bash
# Nikmati aja gayn
DG='\033[1;32m'
NC='\033[0m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
GREEN='\e[38;5;82m'
TOKEN=""
ID=""
bash get.sh
cekvoc(){
curl -A "Chrome" -s "https://gabut.club/api/v3-beta/method/items.like" \
--data "accessToken=${TOKEN}&accountId=${ID}&itemId=${itemId}&" | grep -Po 'myLike":true'>
if [[ $ppk != false ]]; then
echo -e "${CYAN}$itemId${NC} = ${GREEN}Liked${NC}"
else
echo -e "${CYAN}$itemId${NC} = ${GREEN}Already Liked${NC}"
fi
}

gas(){
NOW=`date "+%r"`

for itemId in `cat $voc`
do
cekvoc $itemId
done
rm id.txt
}

cek(){
if [ ! -f $voc ]; then
echo "File $voc Not Found"
exit
else
gas
fi
}

voc='id.txt'
cek
