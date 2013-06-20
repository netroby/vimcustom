#!/bin/sh
cd /usr/local/src/vim
/usr/local/bin/proxychains4 hg pull -uf
hg checkout -C
sed -i 's/CROSS=no/CROSS=yes/g' src/Make_ming.mak
sed -i 's/i586-pc-mingw32msvc-/i686-pc-mingw32-/g' src/Make_ming.mak 
sed -i 's/CROSS),no)/CROSS),yes)/g' src/Make_ming.mak 
sed -i 's/#PYTHON=c:\/python20/PYTHON=\/usr\/local\/src\/python27/g' src/Make_ming.mak 
cd src 
rm -rf *.exe
make clean
make distclean
rm -rf gobji386
mingw32-make -f Make_ming.mak
\cp -rf *.exe /usr/local/src/vim-zip/vim/vim73/ 
cd /usr/local/src/vim-zip
zip -qr ${WORKSPACE}/vim.zip vim
cd ${WORKSPACE}
if [ -f ${WORKSPACE}/output/vim.zip ]
then
    /bin/unlink ${WORKSPACE}/output/vim.zip
fi
mv ${WORKSPACE}/vim.zip ${WORKSPACE}/output/
cd ${WORKSPACE}
