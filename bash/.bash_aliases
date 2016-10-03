# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Easier directory munching
alias mkd='mkdir -p'
alias rmd='rm -rf'
alias cpd='cp -R'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

alias ls="ls ${colorflag}"
alias grep="grep --color"

# MAC OSX
# alias ls='gls --color=auto'

# Easier directory listing
alias ll='ls -halFX'
alias la='ls -AX'
alias l='ls -CFX'

alias tree='tree -aACF --dirsfirst'
alias tt='tree -L 1 -ahiFn'

# Make make faster
alias make='make -j 4'

# be nice
alias please=sudo
alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

# `cat` with beautiful colors. requires Pygments installed.
# -> sudo easy_install Pygments
alias pyg='pygmentize -O style=manni -f console256 -g'

# Run node with exposed GC and some optimizing flags
alias gcnode="node --packed_arrays --expose-gc --max-old-space-size=8192 --max-new-space-size=2048"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
type -t hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"
alias cleantmp="sudo rm -rfv ~/tmp/*"
alias clean="sudo rm -rfv /Library/Caches/*; rm -rfv ~/Library/Caches/*; rm -rfv /.Spotlight-V100/; rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Open with Sublime Text 2
alias sublime='open -a Sublime\ Text\ 2'

# Homebrew: update, upgrade & clean
alias rebrew='brew update && brew upgrade && brew cleanup --force -s'

# Volume
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
