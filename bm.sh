#!/usr/bin/env bash
set -uo pipefail

BM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/bm"
BM_SRC="$( cd "$(dirname "$0")" &>/dev/null ; pwd -P )"

main() {
	: ${1:?"Error: First arg not found. Specify package"}
	package="$1"

	mkdir -p "$BM_DATA"
	mkdir -p "$BM_DATA/bin"
	mkdir -p "$BM_DATA/man"

	source "$BM_SRC/packages/common.sh"
	pushd "$(mktemp -d)" >/dev/null
		debug "TEMP FOLDER: $PWD"
		doInstall "$BM_SRC" "$package"
	popd &>/dev/null
}

debug() {
	if [[ -v DEBUG ]]; then echo "$@"; fi
}

doInstall() {
	: ${1:?"Error: First arg not found"}
	: ${2:?"Error: Second arg not found"}

	debug "doInstall: $1"
	debug "doInstall: $2"

	source "$1/packages/$2/package.sh"

	installl
	code="$?"

	unset -f installl
}

trapExit() {
  echo "Exiting"
}
trap trapExit SIGINT

main "$@"
