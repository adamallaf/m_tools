cat /dev/urandom | tr -dc 0-9a-zA-Z | fold -w $1 | head -n 1
