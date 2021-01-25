# shellcheck shell=bash

name="hugo"
version="0.79.1"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "gohugoio/hugo" "v$version/hugo_${version}_Linux-64bit.tar.gz"
	bm_extract "hugo_${version}_Linux-64bit.tar.gz"
	chmod +x "$name"

	# integrity
	bm_get_gh "gohugoio/hugo" "v$version/hugo_${version}_checksums.txt"
	bm_integrity "hugo_${version}_checksums.txt"

	# final
	bm_place_bin "$name" "$version"
}
