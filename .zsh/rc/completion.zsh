#
# ZSHELL completion
#

# Add custom path for the completions (echo $FPATH)
[ -d "$HOME/.zsh/completions/" ] && fpath=($HOME/.zsh/completions $fpath)

# Load completions
autoload -U compinit
compinit
zmodload zsh/complist

# Options
setopt completealiases         # complete alisases
setopt extendedglob            # weird & wacky pattern matching - yay zsh!
setopt nolisttypes             # show types in completion
setopt autolist                # filename completion
setopt listpacked              # compact completion lists
setopt MARK_DIRS               # Append a trailing `/' to all directory names resulting from filename generation (globbing).
setopt completeinword          # not just at the end

# Formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'%{\e[0;33m%} %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt'%S%M matches%s'
zstyle ':completion:*:prefix:*' add-space true

# Speed up zsh completion
zstyle ':completion:*:paths' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Zsh auto rehash commands
#Sometimes zsh not recognize the executable when installing a new program.
#To rebuild the cache of executable commands, add the following line to your ~/.zshrc file.
zstyle ':completion:*' rehash true

# Case sensitive, partial word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Activate menu selection
zstyle ':completion:*' menu select=2

# Get zsh to color the completed part of the results when using tab completion.
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=34=36"

# I really like the kill|all autocomplete functionality of zsh.
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $(whoami) -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# SSH Completion
# use /etc/hosts and known_hosts for hostname completion
[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r ~/.ssh/config ] && _ssh_config=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_config=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
    "$_ssh_config[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    "$HOST"
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' users off

zstyle ':completion:*:scp:*' tag-order \
    'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:scp:*' group-order \
    users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
    users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order \
    hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
    '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
    '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
    '^<->.<->.<->.<->' '127.0.0.<->'
#zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns \
#    adm avahi-autoipd bin daemon dbus gdm halt haldaemon lp named mail postfix rtkit shutdown sync
