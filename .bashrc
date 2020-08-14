# shellcheck disable=SC2148
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PATH=${PATH}:${DIR}/bin
#shellcheck disable=SC2231 disable=SC1090
for file in ${DIR}/.bashrc.d/*; do source "$file"; done
