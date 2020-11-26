# What is it?

My Linux config files so I can pull them anywhere and don't lose them.

# Usage

Clone a bare repo:

    git clone --bare http://github.com/yashkir/cfg .cfg.git

Set up an alias to use the bare repo:

    alias config="/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"

Pull it:

    config pull

# New Machine Checklist:

- terminal font: Iosevka
- WM workspace and window shortcuts with META key
- depending on DE: /usr/bin/setxkbmap -option "ctrl:nocaps"
- set up pCloud syncs: projects, admin, music_sync
