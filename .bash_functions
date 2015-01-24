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

## h -grep history ---------------------------------
function h() {
        fc -l 1 -1 | sed -n "/$1/s/^ */!/p" | tail -n 50
}
alias h=' h'
 
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
