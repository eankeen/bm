#!/usr/bin/env bash
set -Eo pipefail

BM_SRC="$(dirname "$(readlink -f "$0")")"

source "$BM_SRC/util.sh"
source "$BM_SRC/helper.sh"
source "$BM_SRC/db.sh"

: "${BM_DATA:="${XDG_DATA_HOME:-$HOME/.local/share}/bm"}"

mkdir -p "$BM_DATA/bin"
mkdir -p "$BM_DATA/man"
touch "$BM_DATA/db.txt"

main() {
	[[ $* =~ --help ]] && {
		show_help
		exit
	}

	ensureArg "$*" main 1 "Subcommand"

	local -r subcommand=$1
	case "$subcommand" in
	install)
		ensureArg "$*" main 2 "Package name"

		local -r package="$2"

		source "$BM_SRC/packages/common.sh"
		do_install "$package"
		;;
	uninstall)
		ensureArg "$*" main 2 "Package name"

		local -r package="$2"
		rm "$BM_DATA/bin/$package"
		;;
	show)
		ensureArg "$*" main 2 "Package name"
		pkg="$2"

		name="?"
		version="?"
		integrity_check="?"
		identity_check="?"
		source "$BM_SRC/packages/$pkg/package.sh"
		echo "name: $name"
		echo "  version: $version"
		echo "  integrity: $integrity_check"
		echo "  identity: $identity_check"
		;;
	list)
		local -a pkgs=()
		for dir in "$BM_SRC"/packages/*/; do
			dir="${dir::-1}"
			dir="${dir##*/}"
			pkgs+=("$dir")
		done

		for pkg in "${pkgs[@]}"; do
			name="?"
			version="?"
			integrity_check="?"
			identity_check="?"
			source "$BM_SRC/packages/$pkg/package.sh"
			echo "name: $name"
			echo "  version: $version"
			echo "  integrity: $integrity_check"
			echo "  identity: $identity_check"
			:
		done
		;;
	*)
		log_error "No matching subcommand found. Exiting"
		show_help
		exit 1
		;;
	esac
}

do_install() {
	ensureArg "$@" main 2 "Package name"

	local -r package="$1"

	# test if already installed
	db_exists "$package" && {
		log_info "Info: do_install: Package '$package' already installed"
		exit
	}

	# install
	log_info "Installing $1"

	pushd "$(mktemp -d)" &>/dev/null || die "pushd failed"

	debug "doInstall: tempFolder: $PWD"
	debug "doInstall: \$1: $package"

	source "$BM_SRC/packages/$package/package.sh"

	pkg_install
	code="$?"

	unset -f pkg_install
	popd &>/dev/null || die "popd failed"
}

main "$@"
