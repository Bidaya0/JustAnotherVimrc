#!/usr/bin/env s0

######################################################################
# @author      : bidaya0 (bidaya0@$HOSTNAME)
# @file        : init
# @created     : Sunday Aug 08, 2021 23:11:59 CST
#
# @description : 
######################################################################


ln ./.vimrc ~/.vimrc
ln -s `realpath ./.vim` `realpath ~/.vim`
python3 /opt/vimsettings/.vim/plugged/YouCompleteMe/install.py --all --system-libclang
npm config set prefix '~/.npm-packages'
export PATH="$PATH:$HOME/.npm-packages/bin"
npm install merge-sub-gits -g
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y 
