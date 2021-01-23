pkg_install() {
	name="doctl"
	version="1.54.0"

	get "https://github.com/digitalocean/doctl/releases/download/v$version/doctl-$version-linux-amd64.tar.gz"
	tar xaf "doctl-$version-linux-amd64.tar.gz"

	get "https://github.com/digitalocean/doctl/releases/download/v$version/doctl-$version-checksums.sha256"
	sha256sum --ignore-missing -c "doctl-$version-checksums.sha256"

	place_bin "$name" "$version"
}
