# YUM
alias yumd='yumdownloader'      # downloading RPMs
alias yumc='sudo yum clean all' # Cleans the cache.
alias yumh='yum history'        # Displays history.
alias yumi='sudo yum install'   # Installs package(s).
alias yuml='yum list'           # Lists packages.
alias yumL='yum list installed' # Lists installed packages.
alias yumq='yum info'           # Displays package information.
alias yumr='sudo yum -C remove' # Removes package(s).
alias yums='yum -C search'      # Searches for a package.
alias yumu='sudo yum update'    # Updates packages.
alias yumU='sudo yum upgrade'   # Upgrades packages.
alias yump='sudo yum provides'  # Find out which package provides some feature or file.

# clean incomplete or aborted yum transactions
alias yum-complete-transaction='sudo yum-complete-transaction --cleanup-only'

# Rebuilding rpmdb
rpmdb-rebuild () {
  su -c 'rm -f /var/lib/rpm/__db*; rpm --rebuilddb -v -v; yum clean all; yum update'
}

# Adding, Enabling, and Disabling a Yum Repository.
alias addrepo='sudo yum-config-manager --add-repo'
alias enablerepo='sudo yum-config-manager --enable'
alias disablerepo='sudo yum-config-manager --disable'

# Show priority scores.
alias priority='sed -n -e "/^\[/h; /priority *=/{ G; s/\n/ /; s/ity=/ity = /; p }" /etc/yum.repos.d/*.repo | sort -k3n'

# Verify the list of gpg public keys in RPM DB.
alias rpm_pubkeys="rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'"

# Display last installed packages.
alias last-installed='rpm -q --all --last | less'

# Display the installed rpm list with their size.
alias rpmsize="rpm -qa --queryformat '%10{size} - %-25{name} \t %{version}\n' | sort -n -r | less"
