#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# command completion
source /home/falcon/.bin/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

alias redwm='cd ~/.dwm; updpkgsums; makepkg -efi --noconfirm; killall dwm; cd ~;'
alias reconnman='sudo systemctl stop connman; sudo systemctl start connman;'
alias ls='ls --color=auto'
alias vim='vim 2>/dev/null'
alias shed='remind -c+1 -w87 /home/falcon/.config/remind/schedule.rem;'
alias cont='remind -c+4 -w87 /home/falcon/.config/remind/contests.rem;'

# old configuration:
# PS1='[\u@\h \W]\$ '
# PS1="\[\e[0;37m\]┌─[\A]─[\[\e[0;35m\]\u\[\e[0;37m\]]─[\[\e[0;33m\]\w\[\e[0;37m\]]\$(__git_ps1 '─[\[\e[0;31m\]%s\[\e[0;37m\]]')\n\[\e[0;37m\]└─▪ \[\e[0;m\]"

# function to generate the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
	    # Strip out the path and just leave the env name
	    venv="${VIRTUAL_ENV##*/}"
	else
	    # In case you don't have one activated
	    venv=''
	fi
	[[ -n "$venv" ]] && echo -e "─[\e[0;35mvenv: $venv\e[0;37m]"
}

PS1="\[\e[0;37m\]┌─\$([[ -n \$_ret ]] && echo \"[\[\e[0;31m\]\$_ret\[\e[0;37m\]]─\")[\A]─[\[\e[0;35m\]\u\[\e[0;37m\]]─[\[\e[0;33m\]\w\[\e[0;37m\]]\$(__git_ps1 '─[\[\e[0;31m\]%s\[\e[0;37m\]]')\$(virtualenv_info)\n\[\e[0;37m\]└─▪ \[\e[0;m\]"



trapDbg() {
	local c="$BASH_COMMAND"
	[[ "$c" != "pc" ]] && export _cmd="$c"
}

pc() {
	local r=$?
	if [[ $r == 0 ]]; then
		r=''
    fi

	trap "" DEBUG
	[[ -n "$_cmd" ]] && _ret="$r" || _ret=""
    export _ret
    export _cmd=
    trap 'trapDbg' DEBUG
}

export PROMPT_COMMAND=pc
trap 'trapDbg' DEBUG

PS2="\[\e[0;37m\] ─▪ \[\e[0m\]"
export EDITOR="vim"

#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist 
GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin
