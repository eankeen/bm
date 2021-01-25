# shellcheck shell=bash
name="poetry"
version="1.1.4"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "python-poetry/poetry" "$version/poetry-$version-linux.tar.gz"
	bm_extract "poetry-$version-linux.tar.gz"

	# integrity
	bm_get_gh "python-poetry/poetry" "$version/poetry-$version-linux.sha256sum"
	bm_extract "$version/poetry-$version-linux.sha256sum"

	# final
	bm_place_bin "$name" "$version"
}
