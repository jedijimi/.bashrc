#!/bin/bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#PS1='[\u@\h \W]\$ '
#PS1='\u \e[1;94m\W \e[0m\$ '
eval $( dircolors -b /etc/dircolors )

#######------ for the tty-----##########
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

##### directory #Thanks beardedlinuxgeek & z3bra######
up() {
lv=${1:-1}
while test $lv -gt 0; do
builtin cd ..
lv=$((lv - 1))
done
pwd
}

##### Aliases#####
alias ls='ls -F --group-directories-first --color'
alias lS='ls -lrS' 
alias lh='ls -lh'
alias l.='ls .[A-Za-z]*'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias edit='sudo geany'
alias pacman='pacman --color=always'
alias update='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias sa='source ~/.bashrc;echo "Bash is sourced."'
alias check='sudo pacman -Ss'
alias yaoin='yaourt -S'
alias yaoch='yaourt -Ss'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias orphans='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs $(pacman -Qdtq) || echo "no orphans to remove"'
alias pkgs='comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)'
alias errors='journalctl -b'
alias inxi='inxi -F -M'
alias wunder="telnet rainmaker.wunderground.com 3000"
alias xx='exit'

######custom search w/pacman######
alias pacs="pacsearch"
pacsearch () {
       echo -e "$(pacman -Ss $@ | sed \
                -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
                -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
                -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
                -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}

#######shell opt#########
#bind TAB:menu-complete              
shopt -s autocd                                            #cd automatically
shopt -s cdspell                                           # autocorrection
shopt -s checkwinsize                              # always have actual $LINES & $COLUMNS
shopt -u cmdhist                                        # use semicolon instead of newline
shopt -u direxpand                                      # do not expand tilde and so on
shopt -s dotglob                                          # echo * sees dotfiles
shopt -s extdebug                                      # MOAR debugging
shopt -s globstar                                         # '**' support
shopt -u gnu_errfmt                                   # POSIX, not GNU error messages
shopt -s histappend                                   # Appends history to $HISTFILE instead of overwriting
shopt -s huponexit                                     # kill all bg jobs on exit
shopt -u lithist                                            # use semicolons instead of newlines in history
shopt -s no_empty_cmd_completion      # empty command completion is stupid
shopt -u nocaseglob                                 # filenames ARE case-sensitive
shopt -u nocasematch                             # comparisons ARE case-sensitive
shopt -s xpg_echo                                    # echo has '-e' by default


################################
export EDITOR=nano
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth


############Man pages##############
export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\e[01;34m' 
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'      #Blue background, yellow text
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######colors defined#######
# Reset.
Colour_Off="\e[0m"      # Text Reset.

# Regular Colours.
Black="\e[0;30m"        # Black.
Red="\e[0;31m"          # Red.
Green="\e[0;32m"        # Green.
Yellow="\e[0;33m"       # Yellow.
Blue="\e[0;34m"         # Blue.
Purple="\e[0;35m"       # Purple.
Cyan="\e[0;36m"         # Cyan.
White="\e[0;37m"        # White.

# Bold.
BBlack="\e[1;30m"       # Black.
BRed="\e[1;31m"         # Red.
BGreen="\e[1;32m"       # Green.
BYellow="\e[1;33m"      # Yellow.
BBlue="\e[1;34m"        # Blue.
BPurple="\e[1;35m"      # Purple.
BCyan="\e[1;36m"        # Cyan.
BWhite="\e[1;37m"       # White.

# Underline.
UBlack="\e[4;30m"       # Black.
URed="\e[4;31m"         # Red.
UGreen="\e[4;32m"       # Green.
UYellow="\e[4;33m"      # Yellow.
UBlue="\e[4;34m"        # Blue.
UPurple="\e[4;35m"      # Purple.
UCyan="\e[4;36m"        # Cyan.
UWhite="\e[4;37m"       # White.

# Background.
On_Black="\e[40m"       # Black.
On_Red="\e[41m"         # Red.
On_Green="\e[42m"       # Green.
On_Yellow="\e[43m"      # Yellow.
On_Blue="\e[44m"        # Blue.
On_Purple="\e[45m"      # Purple.
On_Cyan="\e[46m"        # Cyan.
On_White="\e[47m"       # White.

# High Intensty.
IBlack="\e[0;90m"       # Black.
IRed="\e[0;91m"         # Red.
IGreen="\e[0;92m"       # Green.
IYellow="\e[0;93m"      # Yellow.
IBlue="\e[0;94m"        # Blue.
IPurple="\e[0;95m"      # Purple.
ICyan="\e[0;96m"        # Cyan.
IWhite="\e[0;97m"       # White.

# Bold High Intensty.
BIBlack="\e[1;90m"      # Black.
BIRed="\e[1;91m"        # Red.
BIGreen="\e[1;92m"      # Green.
BIYellow="\e[1;93m"     # Yellow.
BIBlue="\e[1;94m"       # Blue.
BIPurple="\e[1;95m"     # Purple.
BICyan="\e[1;96m"       # Cyan.
BIWhite="\e[1;97m"      # White.

# High Intensty backgrounds.
On_IBlack="\e[0;100m"   # Black.
On_IRed="\e[0;101m"     # Red.
On_IGreen="\e[0;102m"   # Green.
On_IYellow="\e[0;103m"  # Yellow.
On_IBlue="\e[0;104m"    # Blue.
On_IPurple="\e[10;95m"  # Purple.
On_ICyan="\e[0;106m"    # Cyan.
On_IWhite="\e[0;107m"   # White.

# Turn on colours.
case "$TERM" in
    *color*)
    color_prompt=yes;;
esac

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi

# Prompt, looks like:
# ┌─[username@host]-[time date]-[directory]
# └─[$]-> 
export PS1="\n\[$Cyan\]┌─[\[$BBlue\]\u\[$Blue\]\[$Cyan\]]-[\[$Colour_Off\]\t $(date +'%a %d %b')\[$Cyan\]]-\n\[$Cyan\]└─[\[$BGreen\]\w\[$Cyan\]]->\[$Colour_Off\] "
export PS2="\[$Cyan\]Secondary->\[$Colour_Off\] "
export PS3="\[$Cyan\]Select option->\[$Colour_Off\] "
export PS4="\[$Cyan\]+xtrace $LINENO->\[$Colour_Off\] "
PROMPT_COMMAND='[[ ${__new_wd:=$PWD} != $PWD ]] && ls ; __new_wd=$PWD' # ls  after cding

# This must be last:
# Start X11 automatically if in tty1
if [ -z "$DISPLAY" ]; then
    tty="`tty`"
    for t in "/dev/vc/1" "vc/1" "/dev/tty1" "tty1"; do
        if [ "$tty" = "$t" ]; then
            n=7
            echo "Starting X11 in $n seconds ... Ctrl+C to abort ..."
            echo
            sleep $n
            exec startx
        fi
    done
fi

######################### WELCOME SCREEN #################################
clear
  echo -ne "${BCyan}" "Hello Master." ;
  echo -e ;
############


