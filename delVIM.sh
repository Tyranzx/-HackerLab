for path in $(which -a vim | sort -u); do dpkg -S "$path" &>/dev/null || { echo "$path eliminando"; sudo rm "$path"; }; done
