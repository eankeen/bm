#!/usr/bin/env sh

get() {
	if [[ -v DEBUG ]]; then
		curl --proto '=https' --tlsv1.2 -LfO "$@"
		return
	fi

	curl --proto '=https' --tlsv1.2 -sSLfO "$@"
}

# when called, we're in context of temporary folder
place_bin() {
	: ${1:?"Interface Error: place_bin: First arg (binName) not found"}
	: ${2:?"Interface Error: place_bin: Second arg (version) not found"}

	local -r binName="$1"
	local -r version="$2"

	log_info "Info: place_bin: $binName: Copying $version"
	cp "$binName" "$BM_DATA/bin"
}

# when called, we're in context of temporary folder
place_man() {
	log_error "Error: Not Implemented"
}

# when called, we're in context of temporary folder
place_source() {
	log_error "Error: Not implemented"
}
