#!/bin/sh
cd /root/.vim
./update.sh
cd /root/
tar zcf ${WORKSPACE}/vim.tgz .vim*
cd ${WORKSPACE}
if [  -f ${WORKSPACE}/output/vim.tgz ]
then
    /bin/unlink ${WORKSPACE}/output/vim.tgz
fi
mv ${WORKSPACE}/vim.tgz ${WORKSPACE}/output/
cd ${WORKSPACE}
