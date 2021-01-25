# shellcheck shell=bash

name="z"
version="latest"
integrity_check="no"
identity_check="no"

pkg_install() {
	# extract
	bm_get https://raw.githubusercontent.com/rupa/z/master/z.sh
	mv z.sh z || bm_die "mv failed"

	# final
	bm_place_bin "$name" "$version"
}
