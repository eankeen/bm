function pkg_install() {
	# TODO: pgp, shasum
	name="hugo"
	version="0.79.1"

	get "https://github.com/gohugoio/hugo/releases/download/v$version/hugo_${version}_Linux-64bit.tar.gz"
	tar xaf hugo_${version}_Linux-64bit.tar.gz
	chmod +x "$name"

	place_bin "$name" "$version"
}
