#!/bin/bash

export CONFIGPATH=~/.vim/config

rm -f ~/.vimrc

mkdir -p $CONFIGPATH 
cp ./me_vimrcs/js.vim $CONFIGPATH/js.vim
cp ./me_vimrcs/golang.vim $CONFIGPATH/golang.vim
ln ./me_vimrcs/base_vimrc.vim ~/.vimrc
