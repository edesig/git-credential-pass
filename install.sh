#!/usr/bin/env sh
readonly BASE_DIR=$(dirname $(realpath $0))
if test $USER != root ; then
	echo >&2 This script should run as root
	exit 1
fi
install $BASE_DIR/git-credential-pass /usr/bin/ --owner=root --mode=755
