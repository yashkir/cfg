# Usage

Clone a bare repo:

  git clone --bare http://github.com/yashkir/cfg .cfg.git

Set up an alias to use the bare repo:

  alias config="/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"

Pull it:

  config pull
