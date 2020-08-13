#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing..."
if grep -xq "$DIR/.bashrc.d.*" "$HOME/.bashrc"
then
  echo "Already installed."
else
  echo "source ${DIR}/.bashrc" >> ${HOME}/.bashrc
  echo "Installed into ${HOME}/.bashrc"
fi

