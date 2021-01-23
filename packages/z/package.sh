function pkg_install() {
	name="z"
	version="1.0.0"

	curl -SsLfO https://raw.githubusercontent.com/rupa/z/master/z.sh
	mv z.sh z

	place_bin "$name" "$version"
}
