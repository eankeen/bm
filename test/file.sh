#!/usr/bin/env bats

source util.sh

# globals
pwd="$PWD"
mainTemp="$(mktemp -d --suffix=-bats-bm)"
subTemp=
bm="$PWD/bm.sh"

debug_ls() {
	ls -A -- * >&3 2>&3
}

debug_echo() {
	echo "$*" >&3 2>&3
}

debug_pipe() {
	cat >&3 2>&3
}

setup() {
	subTemp="$(mktemp -d --tmpdir="$mainTemp")"
	export BM_DATA="$subTemp"
	cd "$BM_DATA" || false
}

teardown() {
	rm -rf "$subTemp"
}

@test "test caddy installation" {
	"$bm" install caddy >&3 2>&3
	[ -e "$BM_DATA/bin/caddy" ]
}

@test "test all extract properly and have their executable placed" {
	for pkg in "$pwd"/packages/*/; do
		pkg="${pkg::-1}"
		pkg="${pkg##*/}"
		debug_echo "# ON: '$pkg'"

		"$bm" install "$pkg"
		[ -e "$BM_DATA/bin/$pkg" ]
	done
}

signal_clean() {
	rm -rf mainTemp
}
trap signal_clean SIGINT
