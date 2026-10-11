#!/usr/bin/env bash
#
# Prints the GitHub release notes for a version: its dist/CHANGELOG entry as
# a Markdown list, followed by the install instructions in install.md.
#
# Usage: release-notes.sh VERSION [REPOSITORY]
#   REPOSITORY defaults to $GITHUB_REPOSITORY (owner/name)
#
# Fails if dist/CHANGELOG has no entry for VERSION.

set -euo pipefail

version=${1:?Usage: $0 VERSION [REPOSITORY]}
repo=${2:-${GITHUB_REPOSITORY:?REPOSITORY not given and GITHUB_REPOSITORY not set}}
here=$(cd "$(dirname "$0")" && pwd)
root=$(cd "$here/../.." && pwd)

# CHANGELOG entries look like:
#   1.14.1 (2026-10-11):
#       * BUGFIX: Some text that may continue
#                 on the next lines
# Turn the entry for $version into "- item" lines, joining continuations.
changes=$(awk -v ver="$version" '
	BEGIN { hdr = "^" ver " \\(" ; gsub(/\./, "\\.", hdr) }
	!found && $0 ~ hdr { found = 1 ; next }
	!found { next }
	/^[0-9]+\.[0-9]+/ { exit }                # next version header
	/^[[:space:]]*\*[[:space:]]/ {            # new item
		if (item != "") print item
		sub(/^[[:space:]]*\*[[:space:]]+/, "")
		item = "- " $0
		next
	}
	/^[[:space:]]+[^[:space:]]/ {             # continuation of the item
		sub(/^[[:space:]]+/, "")
		item = item " " $0
	}
	END {
		if (item != "") print item
		if (!found) exit 1
	}
' "$root/dist/CHANGELOG") || {
	echo "error: no entry for $version in dist/CHANGELOG" >&2
	exit 1
}
if [[ -z $changes ]]; then
	echo "error: the dist/CHANGELOG entry for $version is empty" >&2
	exit 1
fi

cat <<EOF
## Changes
$changes

Full changelog: [dist/CHANGELOG](https://github.com/$repo/blob/v$version/dist/CHANGELOG)

EOF
sed -e "s|@VERSION@|$version|g" -e "s|@REPOSITORY@|$repo|g" "$here/install.md"
