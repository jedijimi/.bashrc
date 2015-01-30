# .bash_aliases   

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

# alias ability for 'sudo'
alias sudo="sudo "

# 'ls'-wizardry ---------------------------------------------------
alias ls='ls -F --color=auto --group-directories-first' #->colorfull
alias ll='ls -l'                                 #->list
alias la='ls -a'                               #->all
alias lla='ls -la'                             #->list all
alias lx='ls -lXB'                           #->sort/extension
alias lz='ls -lSr'                            #->sort/size
alias lt='ls -ltr'                             #->sort/date
alias lr='ls -R'                              #->recursive
alias lm='ls -al --color=always|more'                 #->piped
alias l='ls'

# 'cd'-wizardry --------------------------------------------------
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

# 'chmod'-wizardry --------------------------------------------
alias +r='chmod a+r'
alias ++r='chmod a-r'
alias +w='chmod a+w'
alias ++w='chmod a-w'
alias +x='chmod a+x'
alias ++x='chmod a-x'
alias 000='chmod 000'
alias 640='chmod 640'
alias 644='chmod 644'
alias 750='chmod 750'
alias 755='chmod 755'

# 'grep'-wizardry -----------------------------------------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dgrep='dmesg|grep -i'
alias hgrep='history|grep'
alias mgrep='cat /var/log/messages|grep -i'
alias sgrep='cat /var/log/syslog|grep -i'

# 'mount'-wizardry --------------------------------------------
alias remount='mount -o remount'
alias mount='sudo mount'

# 'dd'-wizardry --------------------------------------------------
alias readcd='dd if=/dev/cdrom of=cdrom.iso'
alias readdvd='dd if=/dev/dvd of=dvd.iso'
alias writecd='dd if=cdrom.iso of=/dev/cdrecorder'
alias writedvd='dd if=dvd.iso of=/dev/cdrecorder'

# 'pacman'-wizardry -------------------------------------------
alias pacman='pacman --color=always'
alias update='sudo pacman -Syu'
alias pacin='sudo pacman -S '
alias qi='pacman -Qi'
alias qimore='pacman -Qi | more'        #(this is to search whole database)
alias orphans='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs $(pacman -Qdtq) || echo $BRed "no orphans to remove"'
alias pkgs='comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)'

# 'systemd-wizardry ------------------------------------------
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias enable='sudo systemctl enable'
alias reenable='sudo systemctl reenable'
alias status='sudo systemctl status'
alias disable='sudo systemctl disable'
alias targets='systemctl list-units --type=target'
alias systemctl='sudo systemctl'
alias journal='sudo journalctl -b'
alias poweroff='systemctl poweroff'

# 'yaourt'-wizardry --------------------------------------------
alias yaoin='yaourt -S'
alias yaoch='yaourt -Ss'

# 'grub-update' -------------------------------------------------
alias grub-up='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-edit='sudo geany /etc/default/grub'

# 'geany-edit' ---------------------------------------------------
alias edit='geany '
alias sedit='sudo geany'

# 'human readable' -------------------------------------------
alias df='df -Th'
alias du='du -h'
alias datetime='date "+%A, %d-%m-%Y - %T %Z"'
alias which='type -a'
alias perm='stat --printf "%a %n \n"'

# 'to save me from myself ----------------------------------
alias rm='rm -iv '
alias cp='cp -iv '
alias rmdir='rm -rf '


#'ping'-limit -----------------------------------------------------
alias ping='ping -c 3'

#'slocate' ---------------------------------------------------------
alias slocup='sudo slocate -U /'

# 'watching' -----------------------------------------------------
alias wdf='watch df'
alias wfree='watch free'
alias wmount='watch mount'
alias wsensor='watch sensors'

# '/proc' -----------------------------------------------------------
alias loadavg='cat /proc/loadavg'

# 'git-wizardry --------------------------------------------------
alias  gits='git status'
alias gita='git  add'
alias gitc='git commit'
alias gitp='git push origin'

# 'misc' ------------------------------------------------------------
alias inxi='inxi -F -M'
alias wunder="telnet rainmaker.wunderground.com 3000"
alias xx='exit'
alias sa='source ~/.bashrc;echo $Cyan "Bash is sourced."'
alias less='more'
alias chroot='sudo arch-chroot'

