#!/bin/sh

#
# get redis one key value every second
#
#EOF

while true
do
redis-cli -a xue\$Xin+2\@\!3<<EOF
get inter:user:signalrouter:770000
exit
EOF
sleep 1s
done