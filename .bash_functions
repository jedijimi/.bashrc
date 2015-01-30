#!  /usr/bin/bash
# .bash_functions

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
 
# 'move up a dir ------------------------------------
function up() {
           lv=${1:-1}
              while test $lv -gt 0; do
            builtin cd ..
           lv=$((lv - 1))
    done
  pwd
}

# 'pacman search database --------------------
function pacs () {
       echo -e "$(pacman -Ss $@ | sed \
                -e 's#core/.*#\\033[1;31m&\\033[0;37m#g' \
                -e 's#extra/.*#\\033[0;32m&\\033[0;37m#g' \
                -e 's#community/.*#\\033[1;35m&\\033[0;37m#g' \
                -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' )"
}


# 'git-status ------------------------------------------
function g {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status
    fi
}

# Extract Files
function extract() {
         if [ -f $1 ] ; then
             case $1 in
                      *.tar.bz2) tar xvjf $1 ;;
                      *.tar.gz) tar xvzf $1 ;;
                      *.tar.xz) tar xvJf $1 ;;
                      *.bz2) bunzip2 $1 ;;
                      *.rar) unrar x $1 ;;
                      *.gz) gunzip $1 ;;
                      *.tar) tar xvf $1 ;;
                      *.tbz2) tar xvjf $1 ;;
                      *.tgz) tar xvzf $1 ;;
                      *.zip) unzip $1 ;;
                      *.Z) uncompress $1 ;;
                      *.7z) 7z x $1 ;;
                      *.xz) unxz $1 ;;
                      *.exe) cabextract $1 ;;
                      *) echo "\`$1': unrecognized file compression" ;;
             esac
         else
                  echo "\`$1' is not a valid file"
         fi
}

# 'colors I picked-up online ---------------------
function color-blocks () {   
            echo
                  local width=$(( ($COLUMNS / 16) -1 ))
                  local chars
                  local pre=$(( ( $COLUMNS - ($width+1)*16)/2 ))
         for ((i=0; i<$width; i++)); do chars+="░" ; done
         for ((i=0; i<$pre; i++)); do echo -n " " ; done
         for ((i=0; i<=7; i++)); do echo -en "\e[3${i}m${chars} \e[1;3${i}m${chars}\e[m "; done; echo; echo
    unset i
}

# matrix fun -----------------------------------------
function matrix()
{
               echo -e "\e[36m";
               while :; do
                               printf '%*c' $(($RANDOM % 30)) $(($RANDOM % 2));
done
}

# Create directory and cd to it ----------------
function mcd {
               mkdir -p "$1" && cd "$1"
}

# Adds some text in the terminal frame (if applicable).

function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}


# Aliases that use xtitle -------------------------
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'

# Set title for term----------------------------------
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -a "$i"
    done
}


