# Hook up SSH_AGENT, GPG_AGENT and ENV vars
# N_ (keychain id_rsa 1A0CEE9F)
if status --is-interactive
  set -l IFS # this temporarily clears IFS, which disables the newline-splitting
  eval (keychain --eval --inherit any --agents ssh,gpg 'id_rsa' 'GPGKEYID')
end

# Disable welcome message
# NOTE: If you want an interactive message (i.e. generated by a command),
# implement the fish_greeting as a function
set fish_greeting ""

# Enable detailed git status in prompt
set -x __fish_git_prompt_show_informative_status 'true'
set -x __fish_git_prompt_showupstream 'true'
set -x __fish_git_prompt_char_cleanstate 'ø'
set -x __fish_git_prompt_char_dirtystate '*'
set -x __fish_git_prompt_char_invalidstate '#'
set -x __fish_git_prompt_char_stagedstate '+'
set -x __fish_git_prompt_char_upstream_prefix '|'
set -x __fish_git_prompt_char_upstream_ahead '˄'
set -x __fish_git_prompt_char_upstream_behind '˅'
# set -x __fish_git_prompt_showcolorhints 'true'
set -x __fish_git_prompt_color 'yellow'
# set -x __fish_git_prompt_color_branch 'yellow'

# eval (docker-machine env --shell fish default)
# eval (gdircolors -c ~/.dircolors)

# Homebrew sbin
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# GNU Core utils
set PATH "/usr/local/opt/coreutils/libexec/gnubin" $PATH
set MANPATH "/usr/local/opt/coreutils/libexec/gnuman" $MANPATH

# Support building against Homebrewed OpenSSL
# set -x LDFLAGS "-L/usr/local/opt/openssl/lib"
# set -x CPPFLAGS "-I/usr/local/opt/openssl/include"

# Lib path
# set -g -x LIBRARY_PATH $LIBRARY_PATH "/usr/local/lib"

# Don’t clear the screen after quitting a manual page
set -g -x MANPAGER "less -RFX"

# Prefer US English and use UTF-8
set -g -x LC_ALL "en_US.UTF-8"
set -g -x LANG "en_US"

# Homebrew needs this, because it fails when doing
# a couple more searches and/or installs in a short amount of time
set -g -x HOMEBREW_GITHUB_API_TOKEN ""
set -g -x HOMEBREW_MAKE_JOBS 1
set -g -x HOMEBREW_VERBOSE 1
set -g -x HOMEBREW_NO_ANALYTICS 1

set -g -x AWS_ACCESS_KEY_ID ""
set -g -x AWS_SECRET_ACCESS_KEY ""

set -g -x LESS "-RFX --SILENT"

# rbenv
if status --is-interactive
  . (rbenv init -|psub)
end

# python virtualenv (virtualfish)
eval (python -m virtualfish auto_activation global_requirements)

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
# alias ls 'ls --color=auto --group-directories-first'

# Easier directory listing
alias ll 'ls --color=auto --group-directories-first -LFlh'
alias la 'ls --color=auto --group-directories-first -AFlh'
alias l 'ls --color=auto --group-directories-first -CF'

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

# Screensaver
alias saver 'open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"
alias cleantmp "sudo rm -rfv ~/tmp/*"
alias clean "sudo rm -rfv /Library/Caches/*; sudo rm -rfv ~/Library/Caches/*; sudo rm -rfv /.Spotlight-V100/; sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash"

# Homebrew: update, upgrade & clean
alias rebrew 'brew update; brew upgrade; brew cleanup --prune=0 -s'

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
