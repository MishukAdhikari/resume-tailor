#!/bin/sh
# Install the resume skills into Claude Code and Codex.
#   ./install.sh              symlink (default, edits here apply immediately)
#   ./install.sh --copy       copy instead of symlink
#   ./install.sh --uninstall  remove what this script installed
set -eu

SRC="$(cd "$(dirname "$0")" && pwd)/skills"
TARGETS="$HOME/.claude/skills $HOME/.agents/skills"
MODE="${1:---link}"

for target in $TARGETS; do
  mkdir -p "$target"
  for skill in "$SRC"/*/; do
    name="$(basename "$skill")"
    dest="$target/$name"
    case "$MODE" in
      --uninstall)
        if [ -L "$dest" ] || [ -d "$dest" ]; then
          rm -rf "$dest"
          echo "removed  $dest"
        fi
        ;;
      --copy)
        rm -rf "$dest"
        cp -R "$skill" "$dest"
        echo "copied   $dest"
        ;;
      *)
        rm -rf "$dest"
        ln -s "$skill" "$dest"
        echo "linked   $dest"
        ;;
    esac
  done
done

[ "$MODE" = "--uninstall" ] || echo "
Restart the agent, or start a new session, for it to pick the skills up."
