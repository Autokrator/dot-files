#!/usr/bin/env bash

# WARNING THIS WILL OVERWRITE CURRENT DOT FILES
ln -sfn $HOME/dot-files/.zshrc $HOME/.zshrc
ln -sfn $HOME/dot-files/.vimrc $HOME/.vimrc
rm -rf $HOME/.spacemacs.d && cp -r $HOME/dot-files/.spacemacs.d $HOME/.spacemacs.d

