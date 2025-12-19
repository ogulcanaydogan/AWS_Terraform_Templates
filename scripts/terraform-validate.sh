#!/usr/bin/env bash
set -euo pipefail

for dir in templates/*; do
  if [[ -d "$dir" ]]; then
    echo "Validating $dir"
    terraform -chdir="$dir" init -backend=false -input=false -upgrade
    terraform -chdir="$dir" validate
  fi
done
