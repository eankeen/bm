# shellcheck shell=bash

name="kubectl"
version="1.19.0"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get "https://dl.k8s.io/release/v$version/bin/linux/amd64/kubectl"
	chmod +x kubectl || bm_die "chmod failed"

	# integrity
	bm_get "https://dl.k8s.io/v$version/bin/linux/amd64/kubectl.sha256"
	bm_integrity <(echo "$(< kubectl.sha256)  kubectl")

	# final
	bm_place_bin "$name" "$version"
}
