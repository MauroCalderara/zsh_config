# $ZDOT_USER/zloglout - user-defined zlogout
#
# This file is sourced when logging out from a login shell
#
# Do:
#       - what needs to be done in case of a logout
#
# Do not:
#       - reset the terminal (this should be done by the shell to which
#         we return)
#
# when looking for something that is executed in the end of every shell,
# not just login shells, consider defining trapexit()
#

# If we're on a hardware terminal (TTY), clear before exit
if ! [ -z "$TTY" ]; then
	case $TTY in
		/dev/console)
			clear
		;;
		*)
			true
		;;
	esac
fi

# OS specific configuration
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogout ] && \
                                . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogout
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogout.local ] && \
                          . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogout.local

[ -r $ZDOT_USER/zlogout.local ] && . $ZDOT_USER/zlogout.local
