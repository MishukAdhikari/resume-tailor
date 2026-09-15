#!/bin/sh
# Install the resume skills into Claude Code and Codex.
#   ./install.sh              symlink (default, edits here apply immediately)
#   ./install.sh --link       same as the default
#   ./install.sh --copy       install independent copies
#   ./install.sh --uninstall  remove only installations created by this repo
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
SRC="$ROOT/skills"
CLAUDE_TARGET="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
CODEX_TARGET="${CODEX_SKILLS_DIR:-$HOME/.agents/skills}"
MODE=link
FAILED=0

usage() {
  cat <<'EOF'
Usage: ./install.sh [--link|--copy|--uninstall|--help]

  --link       symlink each skill into both agents (default)
  --copy       copy each skill into both agents
  --uninstall  remove only links or marked copies installed by this repo
  --help       show this help

Set CLAUDE_SKILLS_DIR or CODEX_SKILLS_DIR to override either destination.
Existing files, directories, and links are never overwritten.
EOF
}

if [ "$#" -gt 1 ]; then
  usage >&2
  exit 2
fi

case "${1:-}" in
  ""|--link) MODE=link ;;
  --copy) MODE=copy ;;
  --uninstall) MODE=uninstall ;;
  --help|-h)
    usage
    exit 0
    ;;
  *)
    printf 'Unknown option: %s\n\n' "$1" >&2
    usage >&2
    exit 2
    ;;
esac

same_link() {
  [ -L "$1" ] && [ "$(readlink "$1")" = "$2" ]
}

managed_copy() {
  marker="$1/.resume-tailor-source"
  [ -f "$marker" ] && [ "$(sed -n '1p' "$marker")" = "MishukAdhikari/resume-tailor:$2" ]
}

install_target() {
  target=$1
  mkdir -p "$target"

  for skill in "$SRC"/*; do
    [ -d "$skill" ] || continue
    name=$(basename "$skill")
    dest="$target/$name"

    case "$MODE" in
      uninstall)
        if same_link "$dest" "$skill"; then
          rm "$dest"
          printf 'removed  %s\n' "$dest"
        elif [ -L "$dest" ]; then
          printf 'skipped  %s (link belongs to another source)\n' "$dest" >&2
          FAILED=1
        elif managed_copy "$dest" "$name"; then
          rm -r "$dest"
          printf 'removed  %s\n' "$dest"
        elif [ -e "$dest" ]; then
          printf 'skipped  %s (not installed by this repo)\n' "$dest" >&2
          FAILED=1
        fi
        ;;
      link)
        if same_link "$dest" "$skill"; then
          printf 'exists   %s\n' "$dest"
        elif [ -e "$dest" ] || [ -L "$dest" ]; then
          printf 'conflict %s (left unchanged)\n' "$dest" >&2
          FAILED=1
        else
          if ln -s "$skill" "$dest"; then
            printf 'linked   %s\n' "$dest"
          else
            printf 'failed   %s\n' "$dest" >&2
            FAILED=1
          fi
        fi
        ;;
      copy)
        if managed_copy "$dest" "$name"; then
          printf 'exists   %s\n' "$dest"
        elif [ -e "$dest" ] || [ -L "$dest" ]; then
          printf 'conflict %s (left unchanged)\n' "$dest" >&2
          FAILED=1
        else
          if mkdir "$dest" 2>/dev/null; then
            if cp -R "$skill/." "$dest/" && printf 'MishukAdhikari/resume-tailor:%s\n' "$name" > "$dest/.resume-tailor-source"; then
              printf 'copied   %s\n' "$dest"
            else
              rm -r "$dest"
              printf 'failed   %s\n' "$dest" >&2
              FAILED=1
            fi
          else
            printf 'conflict %s (left unchanged)\n' "$dest" >&2
            FAILED=1
          fi
        fi
        ;;
    esac
  done
}

install_target "$CLAUDE_TARGET"
install_target "$CODEX_TARGET"

if [ "$MODE" != uninstall ]; then
  printf '\nRestart the agent, or start a new session, for it to pick the skills up.\n'
fi

exit "$FAILED"
