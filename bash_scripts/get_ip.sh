if [[ "$OSTYPE" == "linux-android" ]]; then
    MYIP=$(ifconfig 2>/dev/null | awk '/inet addr:/ {print$2}' | sed's/addr://')
    MPREFIX='127.0.0.1'
    MYIP=${MYIP##$MPREFIX}
    MYIP=${MYIP%%$MPREFIX}
    echo ${MYIP}
elif [[ "$OSTYPE" == "linux-gnueabihf" || "$OSTYPE" == "linux-gnu" ]]; then
    MYIP=$(networkctl status 2>/dev/null | grep Address)
    MPREFIX='^Address:'
    MPOSTFIX='on*'
    MYIP=${MYIP%%$MPOSTFIX}
    echo ${MYIP} | tail -c +10
fi
