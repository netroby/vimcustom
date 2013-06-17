#!/bin/sh
export BASEDIR=$(pwd)
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf ${BASEDIR}/vim.tgz .vim*
cd ${BASEDIR}
if [  -f ${BASEDIR}/output/vim.tgz ]
then
    unlink ${BASEDIR}/output/vim.tgz
fi
mv ${BASEDIR}/vim.tgz ${BASEDIR}/output/
