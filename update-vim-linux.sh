#!/bin/sh
export BASEDIR=$(pwd)
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf vim.tgz .vim*
cd ${BASEDIR}
unlink output/vim.tgz
mv vim.tgz output/
