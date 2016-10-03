# Hook up SSH_AGENT, GPG_AGENT and ENV vars
# N_ (keychain id_rsa GPGKEYID)
eval (keychain id_rsa)
eval (docker-machine env --shell fish default)
eval (gdircolors -c ~/.dircolors)

# PATH
set -g -x PATH /usr/local/opt/ccache/libexec $PATH
set -g -x PATH /usr/local/bin $PATH
set -g -x PATH /usr/local/sbin $PATH
set -g -x PATH (brew --prefix make)/bin $PATH
set -g -x PATH (brew --prefix coreutils)/libexec/gnubin $PATH
# set PATH (brew --prefix binutils)/x86_64-apple-darwin14.1.0/bin $PATH
# set PATH $PATH /usr/local/opt/ruby/bin
# set PATH /Library/Developer/CommandLineTools/usr/bin/ $PATH

# Shim support for rbenv
set -g -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Android SDK
# set PATH $PATH /usr/local/lib/android-sdk/tools
# set PATH $PATH /usr/local/lib/android-sdk/platform-tools
# set PATH $PATH /usr/local/lib/android-sdk/build-tools

# MANPATH
set MANPATH "(brew --prefix coreutils)/libexec/gnuman" $MANPATH

# Personal Lib
set PATH $HOME/Lib/bin $PATH

# Don’t clear the screen after quitting a manual page
set -g -x MANPAGER "less -X"

# Prefer US English and use UTF-8
set -g -x LC_ALL "en_US.UTF-8"
set -g -x LANG "en_US"

# Homebrew needs this, because it fails when doing a couple
# of searches and/or installs in a short amount of time
set -g -x HOMEBREW_GITHUB_API_TOKEN "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
set -g -x HOMEBREW_MAKE_JOBS 4
set -g -x HOMEBREW_VERBOSE false

# Easier navigation: .., ..., ~ and -
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
# alias "--" "cd -"

# Easier directory munching
alias mkd 'mkdir -p'
alias rmd 'rm -rvf'
alias cpd 'cp -R'

alias grep "grep --color"

# MAC OSX
alias ls 'gls --color=auto --group-directories-first'

# Easier directory listing
alias ll 'ls -LFlh'
alias la 'ls -AFlh'
alias l 'ls -CF'

alias tree 'tree -aACF --dirsfirst'
alias tt 'tree -L 1 -ahiFn'

# Make make faster
# alias make 'make -j 4'

# be nice
alias please sudo
alias hosts 'sudo vim /etc/hosts'

# `cat` with beautiful colors. requires Pygments installed.
# -> sudo easy_install Pygments
alias pyg 'pygmentize -O style=manni -f console256 -g'

# Run node with exposed GC and some optimizing flags
alias gcnode "node --packed_arrays --expose-gc --max-old-space-size=8192 --max-new-space-size=2048"

# IP addresses
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr $1"
alias ips "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
# alias whois "whois -h whois-servers.net"

# Flush Directory Service cache
alias flushdns "dscacheutil -flushcache"

# File size
alias fs "stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias cleantmp "sudo rm -rfv ~/tmp/*"
alias clean "sudo rm -rfv /Library/Caches/*; rm -rfv ~/Library/Caches/*; rm -rfv /.Spotlight-V100/; rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Homebrew: update, upgrade & clean
alias rebrew 'brew update; brew upgrade; brew cleanup --force -s'

# npm
alias nls "npm ls --depth 0"
alias ngls "npm ls --global --depth 0"
alias ni "npm install"
alias nis "npm install --save"
alias nisd "npm install --save-dev"
alias nu "npm update"
alias nug "npm ls -g --depth 0 | grep '^[├└]' | sed -E 's/^[├└]── ([^@]*).*\$/\1/g' | grep -E -v '^npm\$' | xargs npm update --global"
alias nh "npm home $1"

# Volume
alias stfu "osascript -e 'set volume output muted true'"
alias pumpitup "osascript -e 'set volume 10'"

# Ruby / Bundler
alias be "bundle exec"
