# Setup Env
#export NIX_PATH=nixpkgs='$HOME/nixpkgs'

# Access to Nix utilities
alias nix='. $HOME/.nix-profile/etc/profile.d/nix.sh'

# Nix Install
alias nix-install='nix-env -iA'

# Nix Search
alias nix-search='nix-env -qaP'

# Nix Update
alias nix-update='nix-env -e -uA'

# Nix Remove
alias nix-remove='nix-env -e'

alias nix-channel-update='nix-channel --update'
