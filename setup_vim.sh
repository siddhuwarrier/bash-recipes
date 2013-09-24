#!/bin/bash
function setup_vim
{
    #Download vimrc from Github if Vimrc directory does not exist
    if [ ! -d ~/.vim_runtime ]; then
        git clone git://github.com/siddhuwarrier/vimrc.git ~/.vim_runtime
	chmod +x ~/.vim_runtime/install_awesome_vimrc.sh
        ~/.vim_runtime/install_awesome_vimrc.sh
    fi
}

setup_vim

