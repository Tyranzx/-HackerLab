for path in $(which -a vim | sort -u); do dpkg -S "$path" &>/dev/null || { echo "🗑️ Eliminando $path"; sudo rm "$path"; }; done
