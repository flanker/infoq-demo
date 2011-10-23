#!/bin/bash

function ruby_environment {
  check_rvm && \
  check_ruby && \
  check_bundler
}

function load_rvm {
  [[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
}

function install_rvm {
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  echo 'export rvm_project_rvmrc=1' >> $HOME/.rvmrc
  load_rvm
}

function install_ruby {
  rvm install ruby-1.8.7
  rvm use 1.8.7
  rvm gemset create infoq
}

function install_bundler {
  gem install bundler --no-ri --no-rdoc
}

function check_env {
  load_rvm
  hash rvm || install_rvm
  echo "rvm installed"
  rvm list | grep 1.8.7 > /dev/null || install_ruby
  echo "ruby installed"
  use_ruby
  which bundle | grep 1.8.7 > /dev/null || install_bundler
  echo "bundler installed"
}

function use_ruby {
  rvm use 1.8.7@infoq
}

function bundle_install {
  bundle install
  echo "bundle installed"
}

function main {
  check_env && \
  load_rvm && \
  use_ruby && \
  bundle_install
}

main $@
