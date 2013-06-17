#!/bin/sh
cd ${WORKSPACE}
if [ -f ${WORKSPACE}/output/index.html ]
then
    /bin/unlink ${WORKSPACE}/output/index.html
fi
cp ${WORKSPACE}/index.html.orig ${WORKSPACE}/output/index.html
export VER=$(date +"%Y-%m-%d %H:%M:%S")
export VER_NUM=$(date +"%Y%m%d%H%M%S")
sed -i "s/{VER}/${VER}/g" ${WORKSPACE}/output/index.html
sed -i "s/{VER_NUM}/${VER_NUM}/g" ${WORKSPACE}/output/index.html
cd ${WORKSPACE}
