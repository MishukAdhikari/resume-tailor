#!/bin/sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
FAILED=0

fail() {
  printf 'error: %s\n' "$1" >&2
  FAILED=1
}

for link in .agents/skills .claude/skills; do
  path="$ROOT/$link"
  if [ ! -L "$path" ]; then
    fail "$link must be a symlink"
  elif [ "$(readlink "$path")" != ../skills ]; then
    fail "$link must point to ../skills"
  fi
done

for skill_dir in "$ROOT"/skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    fail "$skill_name is missing SKILL.md"
    continue
  fi

  first_line=$(sed -n '1p' "$skill_file")
  [ "$first_line" = --- ] || fail "$skill_name frontmatter must start on line 1"

  parsed_name=$(sed -n '2,/^---$/s/^name:[[:space:]]*//p' "$skill_file")
  description=$(sed -n '2,/^---$/s/^description:[[:space:]]*//p' "$skill_file")
  frontmatter_end=$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$skill_file")

  [ "$parsed_name" = "$skill_name" ] || fail "$skill_name frontmatter name does not match its directory"
  [ -n "$description" ] || fail "$skill_name is missing a frontmatter description"
  [ -n "$frontmatter_end" ] || fail "$skill_name frontmatter is not closed"

  extra_keys=$(sed -n '2,/^---$/p' "$skill_file" | sed '1d;$d' | sed -n '/^[A-Za-z0-9_-][A-Za-z0-9_-]*:/p' | sed '/^name:/d;/^description:/d')
  [ -z "$extra_keys" ] || fail "$skill_name frontmatter contains unsupported keys"

  if grep -n '—' "$skill_file" >/dev/null; then
    fail "$skill_name contains an em dash"
  fi
done

sh -n "$ROOT/install.sh"
sh -n "$ROOT/scripts/test-install.sh"

if [ "$FAILED" -ne 0 ]; then
  exit "$FAILED"
fi

"$ROOT/scripts/test-install.sh"
printf 'validation passed\n'
