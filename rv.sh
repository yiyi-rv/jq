#!/bin/bash
set -x 

json_out=`pwd`/errors.json
report_out=`pwd`/report
rm -rf $json_out
rm -rf $report_out

apt install -y bison flex libtool make autoconf

git submodule update --init
autoreconf -fi
./configure --with-oniguruma=builtin CC=kcc LD=kcc CFLAGS="-fissue-report=$json_out"
make -j`nproc`
make check

