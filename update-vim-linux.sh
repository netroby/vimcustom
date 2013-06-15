#!/bin/sh
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf vim.tgz .vim*
unlink /var/www/vimcustom/vim.tgz
mv vim.tgz /var/www/vimcustom
