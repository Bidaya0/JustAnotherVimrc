#!/usr/bin/env sh

######################################################################
# @author      : bidaya0 (bidaya0@$HOSTNAME)
# @file        : mgit
# @created     : Thursday Aug 05, 2021 15:26:51 CST
#
# @description : 
######################################################################

merge-sub-gits local
git status
merge-sub-gits origin -l
