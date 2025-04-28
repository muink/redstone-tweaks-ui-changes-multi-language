#!/bin/bash

for f in assets/minecraft/lang/*.json; do
    raw="$(sed -E 's,(\\u(e|f[78])),\\\1,g' "$f")"
    echo "$raw" | jq --sort-keys | sed 's|\\\\|\\|g' > "$f"
done
