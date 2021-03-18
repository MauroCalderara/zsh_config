# Copyright 2021 Mauro Calderara
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

# For my spacemacs config I use vterm. If the emacs plugin is already loaded we
# don't override the hooks here (in the hope that at some point the emacs plugin
# makes this obsolete).

if [[ "${INSIDE_EMACS}" = "vterm" && ((${plugins[(Ie)"emacs"]})) ]]; then

  vterm_printf() {
    if [[ -n "$TMUX" && \
            ( "${TERM%%-*}" = "tmux" || "${TERM%%-*}" = "screen" ) ]]; then
      # Tell tmux to pass the escape sequences through
      printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [[ "${TERM%%-*}" = "screen" ]]; then
      # GNU screen (screen, screen-256color, screen-256color-bce)
      printf "\eP\e]%s\007\e\\" "$1"
    else
      printf "\e]%s\e\\" "$1"
    fi
  }

  # TODO: I don't quite get how the end of the prompt and the pwd are signaled
  # in the same command (seems bad to do it like that but that is what the vterm
  # docs suggest).
  #
  # This signals the end of the prompt as well as the CDW/PWD back to emacs...
  vterm_prompt_end() {
    vterm_printf "51;A${USER}@${HOST}:${PWD}"
  }
  add-zsh-hook chpwd vterm_prompt_end

fi

# Custom path settings
[[ -d "${HOME}/.emacs.d/private/mmc/scripts" ]] && \
	export PATH="${HOME}/.emacs.d/private/mmc/scripts:${PATH}"

# Use emcommit for git
export GIT_EDITOR=emcommit

# When in emacs / spacemacs, alias vi to em
[[ -n "${INSIDE_EMACS}" ]] && alias vi='em'
