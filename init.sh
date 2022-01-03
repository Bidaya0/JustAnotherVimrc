#!/usr/bin/env sh

######################################################################
# @author      : bidaya0 (bidaya0@$HOSTNAME)
# @file        : init
# @created     : Sunday Aug 08, 2021 23:11:59 CST
#
# @description : 
######################################################################


ln ./.vimrc ~/.vimrc
ln -s `realpath ./.vim-templates` `realpath ~/.vim-templates`
if [[ "$VIM_USE_PROXY" == "TRUE" ]]; then
		proxychains4 -q vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
else
		vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
fi
