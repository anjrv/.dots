#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups
export PATH="/home/annaj/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export READER="mupdf"
export TERMINAL="alacritty"
export CODEEDITOR="code"
export BROWSER="chromium"
export WM="i3"
export COLORTERM="truecolor"
export PAGER="less"

PS1='[\W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#system
alias shutdown='sudo shutdown -h now'
alias lock='betterlockscreen -l dimblur'

#list
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias v='nvim'

#readable output
alias df='df -h'

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

alias pacman='sudo pacman --color auto'
#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

#recently installed
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#orphans
alias orphans='pacman -Qtdq'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#config files
alias vimconf="nvim ~/.config/nvim/init.vim"
alias bashrc="nvim ~/.bashrc"
alias i3conf="nvim ~/.config/i3/config"
alias i3statusconf="nvim ~/.config/i3/i3status.conf"
alias picomconf="nvim ~/.config/i3/picom.conf"
alias alacrittyconf="nvim ~/.config/alacritty/alacritty.yml"
alias qutebrowserconf="nvim ~/.config/qutebrowser/config.py"

#dotfiles repo
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


