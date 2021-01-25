# shellcheck shell=bash

name="gh"
version="1.4.0"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "cli/cli" "v$version/gh_${version}_linux_amd64.tar.gz"
	bm_extract gh_${version}_linux-amd64.tar.gz
	chmod +x "$name"

	# integrity
	bm_get_gh "cli/cli" "v$version/gh_${version}_checksums.txt"
	bm_integrity "gh_${version}_checksums.txt"

	# final
	bm_place_bin "$name" "$version"
}
