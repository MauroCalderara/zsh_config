# $ZDOT_USER/zloglin - user-defined zlogin
#
# This file is sourced last for login-shells
# (zshenv -> zprofile -> zshrc -> zlogin)
#
# Do:
#	- adjust things relevant for login shells (which are
#	  possibly non-interactive) like
#	  - terminal settings
#	  - options that should apply
#	- produce output if needed (login message, fortune etc.)
#
# Do not:
#	- modify the environment (variables, aliases)
#



# options to be set
setopt NO_HUP     # do not kill background jobs when the shell terminates


## cool(?) things:
case $- in
  # for interactive shells
  *i*)
    # login message is in a separate file
    [ -r $ZDOT_USER/conf.d/loginmsg ] && . $ZDOT_USER/conf.d/loginmsg
    [ -r $ZDOT_USER/conf.d/loginmsg.local ] && \
                                   . $ZDOT_USER/conf.d/loginmsg.local
    #fortune    
    # a function that shows who is online (check w and the log-builtin)
    #echo -n ${fg[blue]}; uptime; echo ${reset_color}
  ;;
  # for other login shells
  *)
    # don't know anything good :)
  ;;
esac

# OS specific configuration
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogin ] && \
                                  . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogin
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogin.local ] && \
                            . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zlogin.local

[ -r $ZDOT_USER/zlogin.local ] && . $ZDOT_USER/zlogin.local

# ensure proper exit value
true
