# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#export PATH="$PATH:/home/andrew/Muse"

#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/andrew/Muse"

#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --widthtype percent --width 5 --transparent true --tint 0x000000 --height 10 &

xbindkeys

synclient TapButton2=2
synclient TapButton3=3

/home/andrew/bin/xbattbar.sh &
#xbattbar -c -t 4  -i \#0e8bff -o \#ec251a -I \#8bff0e right &


redshift &

rescuetime &

selfspy &

workrave &
#monitor &
