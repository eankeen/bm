# shellcheck shell=bash

do_install() {
	ensureArg "$@" do_install 1 "Package name"
	local -r pkg="$1"

	# if already installed, exiting
	db_exists "$pkg" && {
		log_info "Info: do_install: Package '$pkg' already installed. Exiting"
		exit
	}

	# install
	log_info "Installing $1"

	pushd "$(mktemp -d)" &>/dev/null || die "pushd failed"
	debug "doInstall: tempFolder: $PWD"

	source "$BM_SRC/packages/common.sh"
	source "$BM_SRC/packages/$pkg/package.sh"

	pkg_install
	code="$?"
	[[ $code -eq 0 ]] && {
		db_add "$pkg"
	}

	unset -f pkg_install
	popd &>/dev/null || die "popd failed"
}

## TODO: remove completely
do_uninstall() {
	ensureArg "$*" do_uninstall 1 "Package name"
	local -r pkg="$1"

	rm "$BM_DATA/bin/$pkg"
	db_remove "$pkg"
}

do_show() {
	ensureArg "$*" do_show 1 "Package name"
	local -r pkg="$1"

	name="?"
	version="?"
	integrity_check="?"
	identity_check="?"
	source "$BM_SRC/packages/$pkg/package.sh"
	echo "name: $name"
	echo "  version: $version"
	echo "  integrity: $integrity_check"
	echo "  identity: $identity_check"
}

do_list() {
	local -a pkgs=()
	# iterate over packages listed in db.txt
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
}

do_reshim() {
	log_error "Not implemented"
}

do_any() {
	log_error "No matching subcommand found. Exiting"
	show_help
	exit 1
}
