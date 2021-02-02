#!/usr/bin/env bash
set -Eo pipefail

BM_SRC="$(dirname "$(readlink -f "$0")")"
: "${BM_DATA:="${XDG_DATA_HOME:-$HOME/.local/share}/bm"}"

source "$BM_SRC/lib/util.sh"
source "$BM_SRC/lib/helper.sh"
source "$BM_SRC/lib/db.sh"
source "$BM_SRC/lib/do.sh"

ensure_files
ensure_prerequisites

main() {
	[[ $* =~ --help ]] && {
		show_help
		exit
	}

	ensureArg "$*" main 1 "Subcommand"
	local -r subCmd=$1

	case "$subCmd" in
	install)
		ensureArg "$*" main 2 "Package name"
		local -r package="$2"

		do_install "$package"
		;;
	uninstall)
		ensureArg "$*" main 2 "Package name"
		local -r pkg="$2"

		do_uninstall "$pkg"
		;;
	show)
		ensureArg "$*" main 2 "Package name"
		local -r pkg="$2"

		do_show "$pkg"
		;;
	list)
		do_list
		;;
	*)
		do_any
		;;
	esac
}

main "$@"
