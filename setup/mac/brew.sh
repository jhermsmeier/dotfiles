#!/usr/bin/env bash

# Be verbose in case shit hits the fan
HOMEBREW_VERBOSE=1
# Some things blow up with parallel jobs
HOMEBREW_MAKE_JOBS=1
# Don't phone home
HOMEBREW_NO_ANALYTICS=1

# Make sure we have access to /usr/local
# (`n` (node version mgr) might not work otherwise)
mkdir /usr/local/
sudo chown -R (whoami):admin /usr/local/

# Install or update brew
if command -v brew >/dev/null 2>&1; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Tap dupes
brew tap homebrew/dupes

# Version control
brew install \
  git \
  diff-so-fancy

# Core replacement utilities
brew install \
  coreutils \
  diffutils --with-default-names \
  findutils --with-default-names

# Utilities (duplicates to replace out-of-date system utils)
brew install \
  openssh \
  openssl \
  libressl \
  grep \
  gzip \
  less \
  make \
  xz

# GNU duplicate utilities
brew install \
  gnu-indent --with-default-names \
  gnu-time --with-default-names \
  gnu-tar --with-default-names \
  gnu-units --with-default-names \
  gnu-which --with-default-names \
  gnu-sed --with-default-names

# Web tools
brew install \
  wget --with-libressl --with-libmetalink \
  curl --with-c-ares --with-nghttp2 --with-libidn --with-libssh2 --with-rtmpdump --with-gssapi --with-libssh2 --with-libmetalink \
  wrk

# Network tools
brew install \
  whois \
  dnstracer \
  dnsmap \
  ngrep \
  nmap \
  masscan \
  lynx \
  netcat \
  netcat6

# System tools
brew install \
  htop \
  mtr \
  keychain \
  pass \
  screen \
  stow \
  wifi-password

# Programming languages
brew install \
  n \
  ruby \
  ruby-build \
  rbenv \
  lua \
  multirust \
  perl \
  python

# Editors
brew install \
  nano \
  vim

# Other Tools
brew install \
  pandoc \
  rsync \
  tree \
  unrar \
  unzip \
  watch \
  ag

# Shells
brew install fish
brew install bash
brew install zsh
# echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
# echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
# echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells

# Clean up *everything*
brew cleanup --prune=0 -s
