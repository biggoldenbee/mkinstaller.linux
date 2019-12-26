#!/system/bin/sh
# Copyright 2019 FOTON
#

export FOTONROOTBIN=$(cd `busybox dirname $0`; pwd)
export PATH=$FOTONROOTBIN:$PATH

mosquitto_pub -h broker.hivemq.com -t "info.tbox.foton.com.cn" -m \
"\
[$(date)]\
[IMEI=$(cat /usrdata/foton/sys_info/mimei.txt)]\
[IMSI=$(cat /usrdata/foton/sys_info/imsi.txt)]\
[ICCID=$(cat /usrdata/foton/sys_info/iccid.txt)]\
[INFO=$1]\
"
echo 'done'
