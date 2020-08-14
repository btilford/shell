# bash completion for the `wp` command

_wp_complete() {
	local OLD_IFS="$IFS"
	local cur=${COMP_WORDS[COMP_CWORD]}

	IFS=$'\n';  # want to preserve spaces at the end
	# shellcheck disable=SC2155,SC1073
	local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

	if [[ "$opts" =~ \<file\>\s* ]]
	then
	  # shellcheck disable=SC2207 disable=SC2086
		COMPREPLY=( $(compgen -f -- $cur) )
	elif [[ $opts = "" ]]
	then
	  # shellcheck disable=SC2207 disable=SC2086
		COMPREPLY=( $(compgen -f -- $cur) )
	else
	  # shellcheck disable=SC2206
		COMPREPLY=( ${opts[*]} )
	fi

	IFS="$OLD_IFS"
	return 0
}
complete -o nospace -F _wp_complete wp
