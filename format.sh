#!/bin/bash

for f in assets/minecraft/{lang,lang_rpo}/*.{json,rpo}; do
    if [ -f "$f" ]; then
        raw="$(sed -E 's,(\\u(e|f[78])),\\\1,g' "$f")"
        echo "$raw" | jq --sort-keys | sed 's|\\\\|\\|g' > "$f"
    fi
done
