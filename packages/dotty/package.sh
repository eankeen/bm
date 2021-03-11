# shellcheck shell=bash

name="dotty"
version="v0.2.1"
integrity_check="no"
identity_check="no"

pkg_install() {
	# extract
	bm_get "https://github.com/eankeen/dotty/releases/download/$version/dotty"
	chmod +x "$name"

	# final
	bm_place_bin "$name" "$version"
}
