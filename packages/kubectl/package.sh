function pkg_install() {
	# TODO: pgp, shasum
	name="kubectl"
	version="1.19.0"

	get https://storage.googleapis.com/kubernetes-release/release/v$version/bin/linux/amd64/kubectl
	chmod +x kubectl

	place_bin "$name" "$version"
}
