# shellcheck shell=bash

name="pack"
version="0.15.1"
integrity_check="no"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "buildpacks/pack" "v$version/pack-v$version-linux.tgz"
	bm_extract "pack-v$version-linux.tgz"
	chmod +x "$name" || bm_die "chmod failed"

	# final
	bm_place_bin "$name" "$version"
}
