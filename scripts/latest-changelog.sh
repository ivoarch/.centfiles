#!/bin/bash
# http://users.linpro.no/ingvar/latest-changelog

usage() {
	me=$(basename $0)
	echo ""
	echo "$me: Shows the most recent changelog part of the latest installed package given"
	echo ""
	echo "Usage: $me [-s] package | [-h]"
	echo "Options:"
	echo "  -s | --security : Filter out security information"
	echo "  -h | --help     : This message"
	echo ""
	echo "Example: $me -s kernel"
	echo ""
	exit 1
}

security=0

if [ "$1" == "" ]; then usage; fi

# Get options
while [[ "$1" =~ ^- ]]; do
	case "$1" in
	-s|--security)
		security=1
		shift
		;;
	-h|--help)
		usage
		;;
	--)
		shift
		;;
	esac
done

package=$(rpm --last -q $1 | head -1 | awk '{print $1}')

if [ "$package" = "" ]; then
	echo "No package $1 found"
	exit 1
fi

lines=$(rpm -q "$package" --changelog | cat -n | grep [*] | head -2 | tail -1 | awk '{print $1}')

if (( lines == 0 )); then
	echo No changelog found for $package
	exit 0
fi

((lines--))

if (( security == 0 )); then
	rpm -q --changelog "$package" | head -$lines
else
	rpm -q --changelog "$package" | head -$lines | grep --color -i -P 'CVE-\d+-\d+|security'
fi
