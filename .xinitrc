!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#export LANG="zh_TW.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="zh_TW.UTF-8"
LD_PRELOAD="/usr/lib/liblunar-gtk-preload.so"
export LD_PRELOAD
#export KERN_DIR='/usr/src/linux-2.6.35-zen'
exec xrdb -merge ~/.Xdefaults &

#export XMODIFIERS="@im=ibus"
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#exec ibus-daemon -d -x -r &

export XMODIFIERS="@im=xsunpinyin"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
exec xsunpinyin -d &

#export XMODIFIERS="@im=fcitx"
#export GTK_IM_MODULE=xim
#export QT_IM_MODULE=xim
#exec fcitx &

exec wicd-client &
#exec feh --bg-scale /home/xifs/InthedarkRedux.jpg &
#exec feh --bg-scale /home/xifs/Pictures/flOw_postercolor72-01.png &
exec feh --bg-scale /home/unicorn.interface.png &
exec conky &
exec gtk-redshift -l 31.7:103.6 -t 5400:6500 -g 0.8 -m vidmode -v &
exec guake &
exec parcellite &
exec volumeicon &
exec keepassx &
exec trayfreq &
exec gtg &
exec start-pulseaudio-x11 &
exec ooffice -quickstart -nologo -nodefault &
#exec xcompmgr -cC -t-3 -l-5 -r5 &

# exec gnome-session
# exec openbox-session
 exec awesome
# exec musca
