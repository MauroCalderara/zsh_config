# zsh_config

A configuration for the [Z shell (zsh)](http://zsh.org/). This configuration aims to be simple, modular, clean and fast. Most useful features of [zsh](http://zsh.org/) are enabled but without going over the top so the shell is still fast on slow machines. Support for a [git](https://git-scm.com/) prompt is provided by [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt).

Support for [Debian](http://www.debian.org/), [Ubuntu](http://www.ubuntu.com/), [CentOS](http://www.centos.org/), [Gentoo](http://www.gentoo.org/), as well as [Mac OS X](http://www.apple.com/osx/), [FreeBSD](http://www.freebsd.org/), [OpenBSD](http://www.openbsd.org/) and [Solaris 10+](http://www.oracle.com/solaris) is provided. Generic Unix systems are supported as well.

- [Overview](#overview)
- [Installation](#installation)

Overview
---

The configuration is installed in the user's home and split into multiple files under `~/.zsh`:

| File &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Purpose |
| ---- | ------------ |
| `conf.d/` | Directory containing most of the configuration. All files are overridden by a corresponding `.local` file such as `aliases.local`. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `aliases[.local]` | Alias configuration. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `completion[.local]` | Completion settings. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `editor[.local]` | Set the EDITOR variable(s). |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `functions[.local]` | FPATH and autoloading. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `globaloptions[.local]` | Settings that apply to zsh scripts. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `history[.local]` | Settings related to the history of interactive shells. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `keybindings[.local]` | Non-ZLE keyboard shortcuts. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `loginmsg[.local]` | Login message/banner. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `misc[.local]` | Various settings, modules to load. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `OS/` | OS specific settings. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `prompt[.local]` | Configuration of the prompts (also see `lib/functions/zdot_prompt`). |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `root[.local]` | Configuration specifically for the `root` user. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `termtitle[.local]` | Setting the title of the terminal. |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `zle[.local]` | Zsh Line Editor (ZLE) settings. |
| `external/` | External code used in the configuration. |
| `lib/` | Library of helper functions and files. |
| `zlogin[.local]` | Sourced for (possibly non-interactive) login shells. |
| `zlogout[.local]` | Sourced at logout from a login shell. |
| `zshenv[.local]` | Sourced by all shells, sets environment variables. |
| `zshrc[.local]` | Sourced by all interactive shells, sets prompts etc. |

Installation
---

Clone the repository recursively (`git clone --recursive`) to `~/.zsh` and create a symlink from `~/.zsh/zshenv` to `~/.zshenv`. If you enabled the git prompt (`ZDOT_GIT_PROMPT=yes` in `conf.d/prompt`, which is the default), you can speed up the prompt considerably by compiling the Haskell binary in `external/zsh-git-prompt` as described [here](https://github.com/olivierverdier/zsh-git-prompt). Once `stack install` succeeded, the zsh configuration will automatically detect the binary and use it instead of the python script.
