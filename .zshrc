# $ZDOT_USER/zshrc user-defined zshrc
#
# this file is sourced on all interactive shells
# (zshenv -> zprofile -> zshrc -> zlogin)
#
# Do:
#	- in general set things which are relevant for interactive shells:
#	  - aliases
#	  - functions
#	  - options for interactive shells
#	  - keybindings
#	- try not to modify this file but instead the corresponding file in
#	  $ZDOT_SYS/
#
# Do not:
#	- produce output
#	- meddle with TERM (setting TERM is the terminal's job, not the shell's)
#

colors		# load color-codes

# OS specific configuration (this comes first as it tends to mess up
# things)
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshrc ] && \
                                   . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshrc
[ -r $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshrc.local ] && \
                             . $ZDOT_USER/conf.d/OS/$ZDOT_OS_SHORT/zshrc.local

# the aspects of interactive shells are configured in separate files
[ -r $ZDOT_USER/conf.d/history ] && . $ZDOT_USER/conf.d/history
[ -r $ZDOT_USER/conf.d/history.local ] && . $ZDOT_USER/conf.d/history.local
[ -r $ZDOT_USER/conf.d/prompt ] && . $ZDOT_USER/conf.d/prompt
[ -r $ZDOT_USER/conf.d/prompt.local ] && . $ZDOT_USER/conf.d/prompt.local
[ -r $ZDOT_USER/conf.d/editor ] && . $ZDOT_USER/conf.d/editor
[ -r $ZDOT_USER/conf.d/editor.local ] && . $ZDOT_USER/conf.d/editor.local
[ -r $ZDOT_USER/conf.d/zle ] && . $ZDOT_USER/conf.d/zle
[ -r $ZDOT_USER/conf.d/zle.local ] && . $ZDOT_USER/conf.d/zle.local
[ -r $ZDOT_USER/conf.d/aliases ] && . $ZDOT_USER/conf.d/aliases
[ -r $ZDOT_USER/conf.d/aliases.local ] && . $ZDOT_USER/conf.d/aliases.local
[ -r $ZDOT_USER/conf.d/keybindings ] && . $ZDOT_USER/conf.d/keybindings
[ -r $ZDOT_USER/conf.d/keybindings.local ] && \
                                      . $ZDOT_USER/conf.d/keybindings.local
[ -r $ZDOT_USER/conf.d/completion ] && . $ZDOT_USER/conf.d/completion
[ -r $ZDOT_USER/conf.d/completion.local ] && \
                                       . $ZDOT_USER/conf.d/completion.local
[ -r $ZDOT_USER/conf.d/misc ] && . $ZDOT_USER/conf.d/misc
[ -r $ZDOT_USER/conf.d/misc.local ] && . $ZDOT_USER/conf.d/misc.local
[ -r $ZDOT_USER/conf.d/root -a X${ZDOT_ID} = Xroot ] && \
                                       . $ZDOT_USER/conf.d/root
[ -r $ZDOT_USER/conf.d/root.local -a X${ZDOT_ID} = Xroot ] && \
                                       . $ZDOT_USER/conf.d/root.local

[ -r $ZDOT_USER/zshrc.local ] && . $ZDOT_USER/zshrc.local

# ensure proper exit value
true
