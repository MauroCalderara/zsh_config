# Copyright 2025 Mauro Calderara
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


# All settings related to the PATH variable. Ordering obviously matters. This
# file is loaded before oh-my-zsh starts up

[[ -d "/snap/bin" ]] && PATH="/snap/bin:${PATH}"

[[ -d "/opt/homebrew/bin" ]] && PATH="/opt/homebrew/bin:${PATH}"
[[ -d "/usr/local/Homebrew/bin" ]] && PATH="/usr/local/Homebrew/bin:${PATH}"

[[ -n "${GOPATH}" && -d "${GOPATH}/bin" ]] && PATH="${GOPATH}/bin:${PATH}"

[[ -d "${HOME}/.cargo/bin" ]] && PATH="${HOME}/.cargo/bin:${PATH}"

[[ -d "${HOME}/.emacs.d/private/mmc/scripts" ]] && \
  PATH="${HOME}/.emacs.d/private/mmc/scripts:${PATH}"

[[ -d "${HOME}/local/bin" ]] && PATH="${HOME}/local/bin:${PATH}"
[[ -d "${HOME}/bin" ]] && PATH="${HOME}/bin:${PATH}"

export PATH
