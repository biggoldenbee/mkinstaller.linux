#!/bin/sh
# Copyright 2019 FOTON
#

if [ ! -e /bin/dirname ] ; then busybox ln -sf /bin/busybox /bin/dirname; fi
export FOTONROOT=$(cd `dirname $0`; pwd)
export PATH=$FOTONROOT:$PATH
export LD_LIBRARY_PATH=$FOTONROOT/../lib:$LD_LIBRARY_PATH
mosquitto_sub -h 127.0.0.1 -t cn.com.foton.tbox.logd.publisher
