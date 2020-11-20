installl() {
	name="z"
	version="1.0.0"

	curl -SsLfO https://raw.githubusercontent.com/rupa/z/master/z.sh
	mv z.sh z

	placeBin "$name" "$version"
}
