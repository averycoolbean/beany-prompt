#!/usr/bin/zsh

######################################################################################
# a pretty cool prompt, thats also really minimal and thusly immune to all criticism #
#                                                                                    #
# a main goal was to make it not break when resizing the terminal like literally     #
# every fucking multi-line prompt on earth... by keeping it single line :)           #
######################################################################################


autoload -U colors && colors
# PS1 & PS2 near identical to make sure they're in line
#  doesnt matter and noone uses PS2, but i like it
# the way it prints the cwd was taken from some stackoverflow post i sadly closed sry
PROMPT="%F{blue}%(5~|%-1~/.../%3~|%4~)%F{reset_color} ❯❯❯ "
PROMPT2="%F{blue}%(5~|%-1~/.../%3~|%4~)%F{reset_color}  ❯❯ "

# stolen from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function preexec() {
  timer=$(date +%s)
}
function precmd() {
  if [ $timer ]; then
    now=$(date +%s)
    elapsed=$(($now-$timer))
    if [ "$elapsed" -gt 0 ] ; then
    	export RPROMPT="%F{yellow}${elapsed}s %{$reset_color%}"
    fi
    unset timer
  fi
}

# used to have the return code but honestly, it just wasnt of much use to me
# im also just too stupid and lazy to figure out how to make it work well alongside the 
#
##returncode () {
#	if (( $1 > 1 )); then
#    	echo "SIG$(kill -l $1)"
#	else
#	    echo $1
#	fi
#}
#RPROMPT="%(?..%F{red}[$(returncode $?)]%F{reset_color%}"
