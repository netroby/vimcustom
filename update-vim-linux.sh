#!/bin/sh
cd /root/.vim/bundle
./update.sh
cd /root/
tar zcvf vim.tgz .vim*
mv vim.tgz /var/www/vimcustom
