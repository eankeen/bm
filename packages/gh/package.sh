# shellcheck shell=bash

name="gh"
version="1.4.0"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "cli/cli" "v$version/gh_${version}_linux_amd64.tar.gz"
	bm_extract "gh_${version}_linux_amd64.tar.gz"
	mv "gh_${version}_linux_amd64" "gh" || bm_die "mv failed"
	chmod +x "gh" || bm_die "chmod failed"

	# integrity
	bm_get_gh "cli/cli" "v$version/gh_${version}_checksums.txt"
	bm_integrity "gh_${version}_checksums.txt"

	# final
	bm_place_bin "$name/bin/gh" "$version"
	for file in "$name"/man/man1/*; do
		bm_place_man "$file" "$version"
	done
}
