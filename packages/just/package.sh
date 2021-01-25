# shellcheck shell=bash

name="just"
version="0.8.3"
integrity_check="no"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "casey/just" "v$version/just-v$version-x86_64-unknown-linux-musl.tar.gz"
	bm_extract "just-v$version-x86_64-unknown-linux-musl.tar.gz"

	# final
	bm_place_bin "$name" "$version"
	bm_place_man "$name.1" "$version"
}
