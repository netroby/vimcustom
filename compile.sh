#!/bin/sh
cd /usr/local/src/vim
hg pull -f
sed -i 's/CROSS=no/CROSS=yes/g' src/Make_ming.mak
sed -i 's/i586-pc-mingw32msvc-/i686-pc-mingw32-/g' src/Make_ming.mak 
cd src 
mingw32-make -f Make_ming.mak
\cp *.exe /usr/local/src/vim-zip/vim/vim73/
cd /usr/local/src/vim-zip
zip -r vim.zip vim
mv vim.zip /var/www/vimcustom
