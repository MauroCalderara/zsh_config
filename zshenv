# $ZDOT_USER/zshenv
#
# This file is sourced on all invokations of zsh
# (zshenv -> zprofile -> zshrc -> zlogin)
#
# Do:
#       - set variables
#         - PATH
#       - set other important variables
#       - set shell-options for zsh-scripts
#
# Do not:
#       - produce any output
#       - assume you do have a tty
#       - write too much things here as this gets executed a lot
#       - load functions that are in general only needed in 
#         interactive settings
#

# these here might need adaptation
ZDOT_USER=$HOME/.zsh
ZDOTDIR=$ZDOT_USER

# The rest shouldn't (edit the respective files instead)
[ -r $ZDOT_USER/conf.d/globaloptions ] && . $ZDOT_USER/conf.d/globaloptions
[ -r $ZDOT_USER/conf.d/globaloptions.local ] && \
                                    . $ZDOT_USER/conf.d/globaloptions.local
[ -r $ZDOT_USER/conf.d/functions ] && . $ZDOT_USER/conf.d/functions
[ -r $ZDOT_USER/conf.d/functions.local ] && . $ZDOT_USER/conf.d/functions.local
[ -r $ZDOT_USER/conf.d/termtitle ] && . $ZDOT_USER/conf.d/termtitle
[ -r $ZDOT_USER/conf.d/termtitle.local ] && . $ZDOT_USER/conf.d/termtitle.local

# This function tries to find out stuff about the system and sets
# some variables (see $ZDOT_FUNCTIONS/zdot_env what variables).
# The script will not change previously set variables.
zdot_env

# if we find ~/bin, add that to the (end) of the path
#[ -d $HOME/bin ] && path+="$HOME/bin"

# SSH agent (useful for all shells)
[ -r ~/.ssh/agent ] && . ~/.ssh/agent >/dev/null

# OS specific configuration
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshenv ] && \
                                 . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshenv
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshenv.local ] && \
                           . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshenv.local

# host specific configuration
[ -r $ZDOT_USER/zshenv.local ] && . $ZDOT_USER/zshenv.local

# sanitize the PATH variable (removes duplicates)
PATH="$(printf "%s" "${PATH}" | awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
