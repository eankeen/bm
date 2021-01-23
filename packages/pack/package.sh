function pkg_install() {
	# TODO: pgp, shasum
	name="pack"
	version="0.15.1"
	
	get https://github.com/buildpacks/pack/releases/download/v$version/pack-v$version-linux.tgz
	tar xaf pack-v$version-linux.tgz
	chmod +x "$name"

	place_bin "$name" "$version"
}

pkg_init() {
        source "$(pack completion)"
}
