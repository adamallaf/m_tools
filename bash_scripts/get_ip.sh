MYIP=$(ifconfig 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://')
echo $MYIP | tail -c +11
