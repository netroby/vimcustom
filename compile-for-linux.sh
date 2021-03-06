#!/bin/sh
cd /usr/local/src
if [ ! -d "vim" ]; then
hg clone https://vim.googlecode.com/hg/ vim
fi
cd vim
hg checkout -C
hg pull -uf
sed -i 's/#CONF_OPT_GUI = --disable-gui/CONF_OPT_GUI = --disable-gui/g' src/Makefile
sed -i 's/#CONF_OPT_X = --without-x/CONF_OPT_X = --without-x/g' src/Makefile
sed -i 's/#CONF_OPT_PYTHON = --enable-pythoninterp=dynamic/CONF_OPT_PYTHON = --enable-pythoninterp=dynamic/g' src/Makefile 
sed -i 's/#CONF_OPT_LUA = --enable-luainterp/CONF_OPT_LUA = --enable-luainterp/g' src/Makefile
export CFLAGS="-O3 -msse -msse2 -mmmx -funroll-loops -mfpmath=sse"
make && make install
hg checkout -C
make clean && make distclean 
if [ -d "src/gobji386" ];
then
    rm -rf src/gobji386
fi


