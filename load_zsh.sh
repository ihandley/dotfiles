#!/usr/bin/env bash
MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"

rm -rf ~/.zshrc.d
ln -s $MY_PATH/.zshrc.d ~

rm ~/.zshrc
ln -s $MY_PATH/.zshrc ~
