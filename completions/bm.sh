# shellcheck shell=bash

# based on https://tylerthrailkill.com/2019-01-19/writing-bash-completion-script-with-subcommands/

_bm_install() {
	local cur="${COMP_WORDS[COMP_CWORD]}"

	local -r BM_DATA="${BM_DATA:-"${XDG_DATA_HOME:-$HOME/.local/share}/bm"}"

	local -a dirs=()
	while IFS= read -r dir; do
		[[ -z $dir ]] && continue

		dir="$(basename "$dir")"
		dirs+=("${dir/--//}")
	done < "$BM_DATA/db.txt"

	# shellcheck disable=SC2207
	COMPREPLY=($(IFS=' ' compgen -W "${dirs[*]}" -- "$cur"))
}

_bm_uninstall() {
	_bm_install
}

_bm_show() {
	_bm_install
}

_bm() {
	local i=1 cmd

	# iterate over COMP_WORDS (ending at currently completed word)
	# this ensures we bm_get command completion even after passing flags
	while [[ "$i" -lt "$COMP_CWORD" ]]; do
		local s="${COMP_WORDS[i]}"
		case "$s" in
		# if our current word starts with a '-', it is not a subcommand
		-*) ;;
		# we are completing a subcommand, set cmd
		*)
			cmd="$s"
			break
			;;
		esac
		(( i++ ))
	done

	# check if we're completing 'bm'
	if [[ "$i" -eq "$COMP_CWORD" ]]; then
		local cur="${COMP_WORDS[COMP_CWORD]}"
		# shellcheck disable=SC2207
		COMPREPLY=($(compgen -W "install uninstall show list reshim --help" -- "$cur"))
		return
	fi

	# if we're not completing 'bm', then we're completing a subcommand
	case "$cmd" in
		install)
			_bm_install ;;
		uninstall)
			_bm_uninstall ;;
		show)
			_bm_show ;;
		list)
			COMPREPLY=() ;;
		reshim)
			COMPREPLY=() ;;
		*)
			;;
	esac

} && complete -F _bm bm
