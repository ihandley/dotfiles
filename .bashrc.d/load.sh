#!/bin/bash

shopt -s globstar nullglob
for file in ~/.bashrc.d/src/**/*.bashrc
do
  source "$file"
done

# Give files correct permissions
chmod -R 700 ~/.bashrc.d
find ~/.bashrc.d/src -name '*.bashrc' | xargs chmod +x
