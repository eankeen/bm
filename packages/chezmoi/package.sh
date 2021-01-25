# shellcheck shell=bash

name="chezmoi"
version="1.8.10"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "twpayne/chezmoi" "v$version/chezmoi_${version}_linux_amd64.tar.gz"
	bm_extract "chezmoi_${version}_linux_amd64.tar.gz"
	chmod +x "$name" || bm_die "chmod failed"

	# integrity
	bm_get_gh "twpayne/chezmoi" "v$version/chezmoi_${version}_checksums.txt"
	bm_integrity "chezmoi_${version}_checksums.txt"

	# final
	bm_place_bin "$name" "$version"
}
