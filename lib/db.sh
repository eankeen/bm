# shellcheck shell=bash

db_add() {
	cat <<< "$1" >> "$BM_DATA/db.txt"
}

# TODO: remove empty lines
db_remove() {
	newDb="$(grep -v "$1" "$BM_DATA/db.txt")"
	cat <<< "$newDb" > "$BM_DATA/db.txt"
}

# checks if string is already in the database
db_exists() {
	grep -q "$1" "$BM_DATA/db.txt"
}
