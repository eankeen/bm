# shellcheck shell=bash

# steps
# when called, we're in context of temporary folder
bm_get() {
	: "${1:?"Interface Error: bm_get: URL to fetch from not passed"}"
	debug "bm_get: \$1: $1"

	if [[ -v DEBUG ]]; then
		curl --proto '=https' --tlsv1.2 -LfO "$1" || bm_die "Fetch failed"
	else
		curl --proto '=https' --tlsv1.2 -sSLfO "$1" || bm_die "Fetch failed"
	fi
}

bm_get_gh() {
	: "${1:?"Interface Error: bm_get_gh: Repository to fetch from not passed"}"
	: "${2:?"Interface Error: bm_get_gh: File to fetch not specified"}"
	debug "bm_get_gh: \$1: $1"
	debug "bm_get_gh: \$2: $2"

	bm_get "https://github.com/$1/releases/download/$2"
}

bm_extract() {
	: "${1:?"Interface Error: bm_extract: file to extract not passed"}"
	debug "bm_extract: \$1: $1"

	case "$1" in
	*.zip)
		unzip "$1" || bm_die "Extraction (zip) failed" ;;
	*)
		tar xaf "$1" || bm_die "Extraction (tar) failed" ;;
	esac
}

bm_integrity() {
	: "${1:?"Interface Error: bm_integrity: shasum reference file not passed"}"
	debug "bm_integrity: \$1: $1"

	shasum -a 256 --ignore-missing -c "$1" >/dev/null || bm_die "Checksum verification failed"
}

bm_identity() {
	# gpg --import hashicorp.asc
	# gpg --verify "${name}_${version}_SHA256SUMS.sig" "${name}_${version}_SHA256SUMS"
	:
}

bm_place_bin() {
	: "${1:?"Interface Error: bm_place_bin: Binary name not found"}"
	: "${2:?"Interface Error: bm_place_bin: Version not found"}"
	debug "bm_get_gh: \$1: $1"
	debug "bm_get_gh: \$2: $2"

	cp "$1" "$BM_DATA/bin" || bm_die "Copy failed"
}

bm_place_man() {
	: "${1:?"Interface Error: bm_place_bin: Binary name not found"}"
	: "${2:?"Interface Error: bm_place_bin: Version not found"}"
}

# util
bm_die() {
	log_error "$*. Exiting"
	exit 1
}
