# shellcheck shell=bash

log_info() {
	printf "\033[0;34m%s\033[0m\n" "INFO: $*"
}

log_warning() {
	printf "\033[0;33m%s\033[0m\n" "ERROR: $*"
}

log_error() {
	printf "\033[0;31m%s\033[0m\n" "ERROR: $*" >&2
}

debug() {
	if [[ -v DEBUG ]]; then echo "$*"; fi
}

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
