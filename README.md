# dotfiles

To use these, you need to soft link them into place

Assuming you've cloned this directory into ~/dotfiles

    cd ~
    ln -s dotfiles/.profile .
    ln -s dotfiles/emacs_d .emacs_d
    ln -s dotfiles/.gitconfig .
    ln -s dotfiles/.inputrc .
    ln -s dotfiles/.gitignore .
    ln -s dotfiles/bash_completions .
   
    # for fish
    mkdir -p ~/.config/fish
    ln -s ~/dotfiles/config/fish/config.fish  ~/.config/fish/config.fish
