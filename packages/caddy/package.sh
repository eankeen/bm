# shellcheck shell=bash

name="caddy"
version="2.2.1"
integrity_check="yes"
identity_check="no"

pkg_install() {
	# extract
	bm_get_gh "caddyserver/caddy" "v$version/caddy_${version}_linux_amd64.tar.gz"
	bm_extract "caddy_${version}_linux_amd64.tar.gz"

	# integrity
	bm_get_gh "caddyserver/caddy" "v$version/caddy_${version}_checksums.txt"
	bm_integrity "caddy_${version}_checksums.txt"

	# final
	bm_place_bin "$name" "$version"
}
