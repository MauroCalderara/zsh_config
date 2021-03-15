----------
zsh config
----------

A zsh configuration using `oh-my-zsh <https://ohmyz.sh/>`_ and `powerlevel10k
<https://github.com/romkatv/powerlevel10k>`_. There is minimal customization to
make this work more easily with
`my spacemacs configuration <https://github.com/MauroCalderara/spacemacs_config.git>`_
but this config can be used independently as well.

.. image:: https://github.com/MauroCalderara/zsh_config/raw/master/docs/screenshot.png

For things to look as in the above screenshot a font with support for special
symbols needs to be used. I use Fira Code patched by
`Ryan McIntyre <https://github.com/ryanoasis/nerd-fonts>`_. See the instructions
below on how to install that specific font - or another one with the same symbols.

Installation
-------------

The configuration assumes that `oh-my-zsh <https://ohmyz.sh/>`_ is available
under ``~/.zsh`` and `powerlevel10k <https://github.com/romkatv/powerlevel10k>`_
under ``~/.zsh/custom/themes/powerlevel10k``, respectively. A suggestion for
``~/.zshrc`` as well as an entry hook for use under ``~/.zsh/custom`` are part
of the repository as well.

Following these instructions will get you started::

   # Optional: download and install a font supporting fancy symbols, e.g.
   # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
   #
   # To install the font for your user extract the archive to
   # ~/.local/share/fonts, then run fc-cache -f -v and finally adjust the font
   # in the terminal that you use to run zsh.
   
   # Fetch oh-my-zsh (alternatively one can follow the official instructions
   # and move things into place afterwards)
   git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh
   
   # Fetch powerlevel10k
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
     ~/.zsh/custom/themes/powerlevel10k
   
   # Fetch this repository
   git clone --depth=1 https://github.com/MauroCalderara/zsh_config.git \
     ~/.zsh/custom/mmc
   
   # Activate the entry hook
   (cd ~/.zsh/custom && ln -s mmc/entry-hook mmc.zsh)
   
   # Activate the .zshrc (this will fail if you already have a ~/.zshrc)
   (cd ~ && ln -s .zsh/custom/mmc/zshrc .zshrc)

If the above worked running ``zsh`` should give you a decent looking prompt. If
not, see the next section.


Updating
--------

Should be pretty simple::

   cd ~/.zsh/custom/mmc
   git pull


Customization...
-------------------

... of the shell in general
~~~~~~~~~~~~~~~~~~~~~~~~~~~

All file paths are relative to ``~/.zsh/custom``

+-----------------------------+--------------------------------------------+
| File                        | Purpose                                    |
+=============================+============================================+
| ``<any_name>.zsh``          | Standard way to customize oh-my-zsh.       |
|                             | Creating a new file in this location is    |
|                             | probably what you should use for your      |
|                             | modifications.                             |
+-----------------------------+--------------------------------------------+

These files are part of my configuration, of course you can adjust them as well:

+-------------------------------+-------------------------------------------+
| File                          | Purpose                                   |
+===============================+===========================================+
| ``mmc/config/local.zsh``      | Not tracked by version control an can     |
|                               | contain any local, untracked changes.     |
+-------------------------------+-------------------------------------------+
| ``mmc/config/ls.zsh``         | Alias(es) for ``ls``.                     |
+-------------------------------+-------------------------------------------+
| ``mmc/config/p10k.zsh``       | My configuration for the powerlevel       |
|                               | prompt. This file will get overwritten    |
|                               | when you run ``p10k configure`` (see      |
|                               | below).                                   |
+-------------------------------+-------------------------------------------+
| ``mmc/config/path.zsh``       | Changes to the standard PATH variable.    |
+-------------------------------+-------------------------------------------+
| ``mmc/config/spacemacs.zsh``  | Settings related to the integration with  |
|                               | my spacemacs configuration (see above).   |
+-------------------------------+-------------------------------------------+
| ``mmc/config/<any_name>.zsh`` | Will also be loaded upon zsh startup.     |
+-------------------------------+-------------------------------------------+


... of the powerlevel prompt
~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you don't like the look of the prompt for either font-related or aestethic
reasons run::

   > p10k configure

