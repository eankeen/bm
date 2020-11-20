#!/usr/bin/env sh

get() {
	if [[ -v DEBUG ]]; then
		curl --proto '=https' --tlsv1.2 -LfO "$@"
		return
	fi

	curl --proto '=https' --tlsv1.2 -sSLfO "$@"
}

# when called, we're in context of temporary folder
placeBin() {
	: ${1:?"Error: placeBin: First arg not found"}
	: ${2:?"Error: placeBin: Second arg not found"}

	binName="$1"
	version="$2"

	echo "placeBin: $binName: Copying $version"
	cp "$binName" "$BM_DATA/bin"
}

# when called, we're in context of temporary folder
placeMan() {
	echo "Error: Not Implemented"
}
