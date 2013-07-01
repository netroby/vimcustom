#!/bin/sh
cd /usr/local/src/vim
/usr/local/bin/proxychains4 hg pull -uf
hg checkout -C
sed -i 's/CROSS=no/CROSS=yes/g' src/Make_ming.mak
sed -i 's/i586-pc-mingw32msvc-/i686-pc-mingw32-/g' src/Make_ming.mak 
sed -i 's/CROSS),no)/CROSS),yes)/g' src/Make_ming.mak 
sed -i 's/#PYTHON=c:\/python20/PYTHON=\/usr\/local\/src\/python27/g' src/Make_ming.mak 
sed -i 's/#LUA=\/usr\/local/LUA=\/usr\/local\/src\/lua\/5.1/g' src/Make_ming.mak
sed -i 's/PYTHON_VER=22/PYTHON_VER=27/g' src/Make_ming.mak
cd src 
rm -rf *.exe 
mingw32-make -f Make_ming.mak
\cp -rf *.exe /usr/local/src/vim-zip/vim/vim73/ 
cd /usr/local/src/vim
hg checkout -C
make clean && make distclean 
if [ -d "src/gobji386" ];
then
    rm -rf src/gobji386
fi
cd /usr/local/src/vim-zip
zip -qr ${WORKSPACE}/vim.zip vim
cd ${WORKSPACE}
if [ -f ${WORKSPACE}/output/vim.zip ]
then
    /bin/unlink ${WORKSPACE}/output/vim.zip
fi
mv ${WORKSPACE}/vim.zip ${WORKSPACE}/output/
cd ${WORKSPACE}
