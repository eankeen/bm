function pkg_install() {
	local -r name="caddy"
	local -r version="2.2.1"

	get https://github.com/caddyserver/caddy/releases/download/v$version/caddy_${version}_linux_amd64.tar.gz
	tar xf caddy_${version}_linux_amd64.tar.gz

	place_bin "$name" "$version"
}
