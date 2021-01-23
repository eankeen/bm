# broken
function pkg_install() {
	name="chezmoi"
	version=""

        #get "https://github.com/cli/cli/releases/download/v1.4.0/gh_${version}_linux_amd64.tar.gz"
	#tar xaf gh_${version}_linux-amd64.tar.gz
	#chmod +x "$name"

	place_bin "$name" "$version"
}

function pkg_init() {
        eval "$(chezmoi completion bash)"
}
