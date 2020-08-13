# bash completion for the `wp` command

_wp_complete() {
	local OLD_IFS="$IFS"
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")" # shellcheck disable=SC2155,SC1073

	if [[ "$opts" =~ \<file\>\s* ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) ) # shellcheck disable=SC2207
	elif [[ $opts = "" ]]
	then
		COMPREPLY=( $(compgen -f -- $cur) ) # shellcheck disable=SC2207
	else
		COMPREPLY=( ${opts[*]} ) # shellcheck disable=SC2206
	fi

	IFS="$OLD_IFS"
	return 0
}
complete -o nospace -F _wp_complete wp
