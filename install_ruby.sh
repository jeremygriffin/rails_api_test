#!/bin/bash
export RBENV_ROOT="/root/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$($RBENV_ROOT/bin/rbenv init -)"
rbenv install 3.3.5
rbenv global 3.3.5
rbenv rehash
