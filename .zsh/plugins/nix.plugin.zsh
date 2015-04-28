# Setup Env
export NIX_PATH=nixpkgs='$HOME/nixpkgs'

# Access to Nix utilities
alias nix='. $HOME/.nix-profile/etc/profile.d/nix.sh'

# Nix Install
alias ni='nix-env -iA'

# Nix Search
alias ns='nix-env -qaP'

# Nix Update
alias nu='nix-env -e -uA'

# Nix Remove
alias ne='nix-env -e'
