#!/bin/bash

function load_rvm {
  [[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
}

function install_rvm {
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  echo 'export rvm_project_rvmrc=1' >> $HOME/.rvmrc
  load_rvm
  echo "rvm installed"
}

function install_ruby {
  rvm pkg install zlib && \
  rvm pkg install libxml2 && \
  rvm pkg install readline && \
  rvm install ruby-1.8.7 && \
  rvm use 1.8.7 && \
  rvm gemset create infoq && \
  echo "ruby installed"
}

function install_bundler {
  gem install bundler --no-ri --no-rdoc
  echo "bundler installed"
}

function check_env {
  load_rvm
  hash rvm || install_rvm && \
  rvm list | grep 1.8.7 > /dev/null || install_ruby && \
  use_ruby && \
  which bundle | grep 1.8.7 > /dev/null || install_bundler
}

function use_ruby {
  rvm use 1.8.7@infoq
}

function bundle_install {
  bundle install
}

function main {
  check_env && \
  load_rvm && \
  use_ruby && \
  bundle_install
}

main $@
