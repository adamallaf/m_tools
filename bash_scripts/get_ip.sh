MYIP=$(ifconfig 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://')
MPREFIX='127.0.0.1'
MYIP=${MYIP##$MPREFIX}
MYIP=${MYIP%%$MPREFIX}
echo ${MYIP}
