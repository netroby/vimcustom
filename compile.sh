#!/bin/sh
cd /usr/local/src/vim
/usr/local/bin/proxychains4 hg pull -f
sed -i 's/CROSS=no/CROSS=yes/g' src/Make_ming.mak
sed -i 's/i586-pc-mingw32msvc-/i686-pc-mingw32-/g' src/Make_ming.mak 
cd src 
rm -rf *.exe
make clean
make distclean
mingw32-make -f Make_ming.mak
\cp -rf *.exe /usr/local/src/vim-zip/vim/vim73/ 
cd /usr/local/src/vim-zip
zip -r vim.zip vim
unlink /var/www/vimcustom/vim.zip
mv vim.zip /var/www/vimcustom
