# shellcheck shell=bash

show_help() {
	cat <<-EOF
	Usage:
	    bm [subcommand] [...args]

	Commands:
	    install
	        Installs and sources a file
	    list
	        lists all the available packages (with varing functionality)
	    source
	        Sources the aggregated (contatonated) package-specified source fragments

	Examples:
	    bm install kubectl
	    bm remove kubectl
	    bm source
	EOF
}

ensure_files() {
	mkdir -p "$BM_DATA/bin"
	mkdir -p "$BM_DATA/man"
	touch "$BM_DATA/db.txt"
}

ensure_exists() {
	command -v &>/dev/null "$1" || die "$1 not installed. Exiting"
}

ensure_prerequisites() {
	ensure_exists jq
	ensure_exists curl
}
