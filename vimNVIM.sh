for path in $(which -a vim | sort -u); do dpkg -S "$path" &>/dev/null || { echo "$path elimiando"; sudo rm "$path"; }; done
