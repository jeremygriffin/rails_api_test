#!/bin/bash
export RBENV_ROOT="/root/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$($RBENV_ROOT/bin/rbenv init -)"
export POSTGRES_PASSWORD=""
/work/bin/bundle exec rspec