#!/bin/bash
CWD=$(pwd)
GitCommands=$CWD'/.bash_docker_functions' 

# $1 — shell configuraton file path
function register_path {
   PATH_LINE='export PATH=$PATH:'$GitCommands':$PATH'
    if [ -f $1 ]; then
	    if ! grep -Fxq "$PATH_LINE" $1; then
			echo
			echo "Adding path to $1"
			echo $PATH_LINE >> $1
			source $1
		fi
	fi
}

register_path ~/.bashrc
register_path ~/.zshrc