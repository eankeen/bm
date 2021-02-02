# shellcheck shell=bash

die() {
	log_error "$*"
	exit 1
}

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

ensureArg() {
	: "${2:?"Internal Error: Second arg (Function name) not found"}"
	: "${3:?"Internal Error: Third arg (Parameter number) not found"}"
	: "${4:?"Internal Error: Fourth arg (Parameter description) not found"}"

	# shellcheck disable=SC2206
	local -a originalArgs=($1)
	local index="$3"

	if [[ -z ${originalArgs[index-1]} ]]; then
		log_error "fn $2(arg $3): $4 not found. Exiting"
		exit 1
	fi
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
