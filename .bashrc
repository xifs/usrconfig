#export PS1='[\[\033[0;34m\]\u\[\033[0;35m\]@\[\033[0;33m\]\w\[\033[00m\]]$'
export PS1='`a=$?;if [ $a -ne 0 ]; then echo -n -e "\[\e[01;32;41m\]{$a}"; fi`\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W`B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\033[01;32m\]\[\e[00m\]"`\[\033[01;34m\] $ \[\e[00m\]'
export AWT_TOOLKIT=MToolkit
export PATH="$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools"
complete -o filenames -F _root_command notify
#export PYTHONDOCS=/usr/share/doc/python/html/
export PYTHONDOCS=/usr/share/doc/python2/html/
#export GNOME_DESKTOP_SESSION_ID=1
#export LIBOVERLAY_SCROLLBAR=1
export GNOME_DESKTOP_SESSION_ID=Default
export PAGER=most
export PACMAN=pacman-color
export HISTIGNORE="pwd:ls:ls -al:"

#`echo $- | grep -qs i` && which byobu-launcher > /dev/null && byobu-launcher && exit

# alias for locale
alias mutt="LC_ALL=zh_TW.UTF-8 mutt"
alias gimp="LC_ALL=zh_TW.UTF-8 gimp"
#alias filezilla="LC_ALL=zh_TW.UTF-8 filezilla"
alias man="LC_ALL=zh_CN.UTF-8 man"
alias vimtutor="LC_ALL=zh_CN.UTF-8 vimtutor"

# alias for switch
alias lsblk="lsblk -o NAME,KNAME,FSTYPE,MOUNTPOINT,LABEL,UUID,SIZE,OWNER,GROUP,MODE"
#alias wget="wget"
alias rm='trash-put'
alias grep='grep --color=always'
alias ls='ls --color'