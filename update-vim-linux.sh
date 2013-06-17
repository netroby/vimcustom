#!/bin/sh
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf ${WORKSPACE}/vim.tgz .vim*
cd ${WORKSPACE}
if [  -f ${WORKSPACE}/output/vim.tgz ]
then
    /bin/unlink ${WORKSPACE}/output/vim.tgz
fi
mv ${WORKSPACE}/vim.tgz ${WORKSPACE}/output/
cd ${WORKSPACE}
