#!/usr/bin/env bash
# author: @ivoarch

OPT="$1"
PACKAGE="$2"

usage() {
    echo ""
    echo "$0 - list RPM package contents"
    echo ""
    echo "Usage: $0 [-OPTION] [PACKAGE-NAME]"
    echo "Options:"
    echo "  -b : Show binaries of a package."
    echo "  -c : View the Changelog of a package."
    echo "  -d : Show documentation contained in that package."
    echo ""
    echo "Example 1: $0 -d openssh"
    echo "Example 2: $0 -d /path/to/openssh.rpm"
    echo ""
    exit 1
}

show_binaries() {
    # check to see if an rpm is installed
    if rpm -q --quiet "${PACKAGE}"; then
        # the package is installed
        rpm -ql "${PACKAGE}" | grep --color=auto 'bin';
    else
        # the package is not installed
        rpm -qlp "${PACKAGE}" | grep --color=auto 'bin';
    fi
}

show_changelog() {
    # check to see if an rpm is installed
    if rpm -q --quiet "${PACKAGE}"; then
        # the package is installed
        rpm -q --changelog "${PACKAGE}" | less;
    else
        # the package is not installed
        rpm -qp --changelog "${PACKAGE}" | less;
    fi
}

show_doc() {
    # check to see if an rpm is installed
    if rpm -q --quiet "${PACKAGE}"; then
        # the package is installed
        rpm -qd "${PACKAGE}" | grep --color=auto 'doc';
    else
        # the package is not installed
        rpm -qdf "${PACKAGE}" | grep --color=auto 'doc';
    fi
}

if [ $# -eq 0 ]; then
    echo 'Invalid argument!';
    usage;
fi

# get options
while [ $# -gt 1 ]; do
    case "$OPT" in
        -b)
            show_binaries;
            ;;
        -c)
            show_changelog;
            ;;
        -d)
            show_doc;
            ;;
         *)
            echo "That option is not recognized!"
            usage;
            ;;
    esac
    shift
done
