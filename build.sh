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
  rvm install ruby-1.8.7 && \
  rvm use 1.8.7 && \
  rvm gemset create infoq && \
  echo "ruby installed"
}

function install_bundler {
  gem install bundler --no-ri --no-rdoc
  echo "bundler installed"
}

function install_node {
  sudo apt-get -y update && \
  sudo apt-get -y install libssl-dev git-core pkg-config build-essential curl gcc g++ && \
  mkdir /tmp/node-install && \
  cd /tmp/node-install && \
  wget http://nodejs.org/dist/v0.6.5/node-v0.6.5.tar.gz && \
  tar -zxf node-v0.6.5.tar.gz && \
  cd node-v0.6.5 && \
  ./configure && make && sudo make install && \
  curl http://npmjs.org/install.sh | sudo sh && \
  echo 'nodejs and npm install completed'
}

function check_env {
  load_rvm
  hash rvm || install_rvm && \
  rvm list | grep 1.8.7 > /dev/null || install_ruby && \
  use_ruby && \
  which bundle | grep 1.8.7 > /dev/null || install_bundler && \
  hash node || install_node
}

function use_ruby {
  rvm use 1.8.7@infoq
}

function bundle_install {
  bundle install
}

function main {
  echo "check env" && \
  check_env && \
  echo "load rvm" && \
  load_rvm && \
  echo "use ruby & gem" && \
  use_ruby && \
  echo "bundle install" && \
  bundle_install && \
  echo "rake $1" && \
  rake $1
}

main $@
