#!/usr/bin/env bash
#rm -r "${HOME}/dotfiles"
#mkdir "${HOME}/dotfiles"
(cd ~  && rm .zshrc .gitignore_global .gitconfig .ripgreprc)
DIR="${HOME}/code/github/ihandley/dotfiles"
ln -sfh "${DIR}/.zshrc" "${HOME}/.zshrc"
ln -sfh "${DIR}/.gitignore_global" "${HOME}/.gitignore_global"
ln -sfh "${DIR}/.gitconfig" "${HOME}/.gitconfig"
ln -sfh "${DIR}/.ripgreprc" "${HOME}/.ripgreprc"
