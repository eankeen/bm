function pkg_install() {
        # doesn't work. not single binary
	name="zig"
	version="0.7.1"

        get "https://ziglang.org/download/index.json"
        get "$(jq -r ".\"0.7.1\".\"x86_64-linux\".tarball" index.json)" 
        tar xaf zig-linux-x86_64-$version.tar.xz
        mv "zig-linux-x86_64-$version" "$name"

	place_bin "$name" "$version"
}
