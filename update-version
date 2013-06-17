#!/bin/sh
export BASEDIR=$(pwd)
if [ -f ${BASEDIR}/output/index.html ]
then
    unlink ${BASEDIR}/output/index.html
fi
cp ${BASEDIR}/index.html.orig ${BASEDIR}/output/index.html
export VER=$(date +"%Y-%m-%d %H:%I:%S")
export VER_NUM=$(date +"%Y%m%d%H%I%S")
sed -i "s/{VER}/${VER}/g" ${BASEDIR}/output/index.html
sed -i "s/{VER_NUM}/${VER_NUM}/g" ${BASEDIR}/output/index.html
