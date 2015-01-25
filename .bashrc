#!/bin/bash
# ~/.bashrc

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#PS1='[\u@\h \W]\$ '
#PS1='\u \e[1;94m\W \e[0m\$ '
eval $( dircolors -b ~/.dircolors )

# bash-shell options------------------------------
shopt -s autocd                                             # cd automatically
shopt -s cdspell                                            # autocorrection
shopt -s checkwinsize                                       # always have actual $LINES & $COLUMNS
shopt -u cmdhist                                            # use semicolon instead of newline
shopt -u direxpand                                          # do not expand tilde and so on
shopt -s dotglob                                            # echo * sees dotfiles
shopt -s extdebug                                           # MOAR debugging
shopt -s globstar                                           # '**' support
shopt -u gnu_errfmt                                         # POSIX, not GNU error messages
shopt -s histappend                                         # Appends history to $HISTFILE instead of overwriting
shopt -s huponexit                                          # kill all bg jobs on exit
shopt -u lithist                                            # use semicolons instead of newlines in history
shopt -s no_empty_cmd_completion                            # empty command completion is stupid
shopt -u nocaseglob                                         # filenames ARE case-sensitive
shopt -u nocasematch                                        # comparisons ARE case-sensitive
shopt -s xpg_echo                                           # echo has '-e' by default


# exports ---------------------------------------------
export EDITOR=nano
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# colors for prompt --------------------------------
# Reset.
Colour_Off="\e[0m"      # Text Reset.

# Regular Colours ----------------------------------
Black="\e[0;30m"        # Black.
Red="\e[0;31m"          # Red.
Green="\e[0;32m"        # Green.
Yellow="\e[0;33m"       # Yellow.
Blue="\e[0;34m"         # Blue.
Purple="\e[0;35m"       # Purple.
Cyan="\e[0;36m"         # Cyan.
White="\e[0;37m"        # White.

# Bold --------------------------------------------------
BBlack="\e[1;30m"       # Black.
BRed="\e[1;31m"         # Red.
BGreen="\e[1;32m"       # Green.
BYellow="\e[1;33m"      # Yellow.
BBlue="\e[1;34m"        # Blue.
BPurple="\e[1;35m"      # Purple.
BCyan="\e[1;36m"        # Cyan.
BWhite="\e[1;37m"       # White.

# linux console -------------------------------------
if [ "$TERM" = "linux" ]; then
   echo -en "\e]P0000000" #black
   echo -en "\e]P88C8B89" #darkgrey
   echo -en "\e]P1B32323" #darkred
   echo -en "\e]P9DC2C2C" #red
   echo -en "\e]P21AAA13" #darkgreen
   echo -en "\e]PA5DCE33" #green
   echo -en "\e]P3FF9F3E" #brown
   echo -en "\e]PBE6CB29" #yellow
   echo -en "\e]P44957F3" #darkblue
   echo -en "\e]PC4D79FF" #blue
   echo -en "\e]P5BF3E94" #darkmagenta
   echo -en "\e]PDB641CC" #magenta
   echo -en "\e]P609A5B3" #darkcyan
   echo -en "\e]PE3CB6F3" #cyan
   echo -en "\e]P7AEAEAE" #lightgrey
   echo -en "\e]PFDBDDE4" #white
fi


# Turn on colours------------------------------------(unknown if this is useful)
case "$TERM" in
    *color*)
    color_prompt=yes;;
esac

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

## source useful files ----------------------------
[[ -r /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_functions ]] && source ~/.bash_functions


# De-Prompt -----------------------------------------
# ┌─[username@host]-[time date]-[directory]
# └─[$]->
export PS1="\n\[$Cyan\]┌─[\[$BBlue\]\u\[$Blue\]\[$Cyan\]]-[\[$Colour_Off\]\t $(date +'%a %d %b')\[$Cyan\]]-\n\[$Cyan\]└─[\[$BGreen\]\w\[$Cyan\]]->\[$Colour_Off\] "
export PS2="\[$Cyan\]Secondary->\[$Colour_Off\] "
export PS3="\[$Cyan\]Select option->\[$Colour_Off\] "
export PS4="\[$Cyan\]+xtrace $LINENO->\[$Colour_Off\] "
PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && ls ; __new_wd=$PWD' # ls  after cding

# This must be last: -------------------------------
# Start X11 automatically if in tty1
#if [ -z "$DISPLAY" ]; then
#   tty="`tty`"
#    for t in "/dev/vc/1" "vc/1" "/dev/tty1" "tty1"; do
#        if [ "$tty" = "$t" ]; then
#            n=7
#            echo "Starting X11 in $n seconds ... Ctrl+C to abort ..."
#            echo
#            sleep $n
#            exec startx
#        fi
#    done
#fi

######################### WELCOME SCREEN #################################
  echo -ne "${BCyan}" "#-------> Hello Master <-------#" ;
  echo -e ;



