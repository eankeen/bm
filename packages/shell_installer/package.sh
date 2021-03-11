# shellcheck shell=bash

name="shell_installer"
version="v0.1.1"
integrity_check="no"
identity_check="no"

pkg_install() {
	# extract
	bm_get "https://github.com/eankeen/shell-installer/releases/download/$version/shell_installer"
	chmod +x shell_installer

	# final
	bm_place_bin "$name" "$version"
}
