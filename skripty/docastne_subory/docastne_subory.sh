#!/usr/bin/env bash
set -e

mojacesta="$(realpath "$0")"
moj_priecinok="$(dirname "$mojacesta")"
cd "$moj_priecinok"

tmpdir="$(mktemp -d tmpdir.xxxxxx)"
tmpfile_raw="$(mktemp "$tmpdir/tmpfile.xxxxxx")"

cp temp_template.txt "$tmpfile_raw"

awk '{print $1}' "$tmpfile_raw"

rm -rf "$tmpdir"

