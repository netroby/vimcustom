#!/bin/sh
export BASEDIR=$(pwd)
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf vim.tgz .vim*
cd ${BASEDIR}
if [  -f output/vim.tgz ]
then
    unlink output/vim.tgz
fi
mv vim.tgz output/
