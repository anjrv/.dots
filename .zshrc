# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
ZSH_THEME=""
PS1='[\W]\$ '
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

export LANG=en_US.UTF-8
export ZSH="/home/anjrv/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
if [ -d "$GEM_HOME/bin" ] ;
  then PATH="$GEM_HOME/bin:$PATH"
fi

export VISUAL="nvim"
export READER="mupdf"
export TERMINAL="alacritty"
export CODEEDITOR="code"
export BROWSER="chromium"
export WM="i3"
export COLORTERM="truecolor"
export PAGER="less"

alias shutdown='sudo shutdown now'
alias lock='betterlockscreen -l dimblur'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias v='nvim'

#readable output
alias df='df -h'

#continue download
alias wget="wget -c"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#pacman
alias pacman='sudo pacman --color auto'
alias paclist='pacman -Qqen > ~/.config/packages/pacmanpackages.txt'
alias aurlist='pacman -Qqem > ~/.config/packages/aurpackages.txt'
#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
#orphans
alias orphans='pacman -Qdt'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#config files
alias vimconf="nvim ~/.config/nvim/init.vim"
alias bashconf="nvim ~/.bashrc"
alias zshconf="nvim ~/.zshrc"
alias i3conf="nvim ~/.config/i3/config"
alias i3statusconf="nvim ~/.config/i3/i3status.conf"
alias dunstconf="nvim ~/.config/dunst/dunstrc"
alias picomconf="nvim ~/.config/i3/picom.conf"
alias alacrittyconf="nvim ~/.config/alacritty/alacritty.yml"
alias qutebrowserconf="nvim ~/.config/qutebrowser/config.py"

#dotfiles repo
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME"

# usage: ex <file>
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

eval "$(starship init zsh)"
