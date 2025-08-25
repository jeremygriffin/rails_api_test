#!/bin/bash
export RBENV_ROOT="/root/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$($RBENV_ROOT/bin/rbenv init -)"
/work/bin/rails db:create
/work/bin/rails db:migrate
