# shellcheck shell=bash

name="doctl"
version="1.54.0"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "digitalocean/doctl" "v$version/doctl-$version-linux-amd64.tar.gz"
	bm_extract "doctl-$version-linux-amd64.tar.gz"

	# integrity
	bm_get_gh "digitalocean/doctl" "v$version/doctl-$version-checksums.sha256"
	bm_integrity "doctl-$version-checksums.sha256"

	# final
	bm_place_bin "$name" "$version"
}
