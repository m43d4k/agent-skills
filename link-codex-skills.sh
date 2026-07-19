#!/bin/sh

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

mkdir -p "$HOME/.codex/skills"

for skill_dir in skills/*; do
  [ -f "$skill_dir/SKILL.md" ] || continue

  skill_name=${skill_dir##*/}
  destination="$HOME/.codex/skills/$skill_name"

  if [ -e "$destination" ] || [ -L "$destination" ]; then
    echo "skip: $destination already exists"
    continue
  fi

  ln -s "$SCRIPT_DIR/$skill_dir" "$destination"
  echo "linked: $destination -> $SCRIPT_DIR/$skill_dir"
done
