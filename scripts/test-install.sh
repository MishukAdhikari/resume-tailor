#!/bin/sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
TEST_ROOT=$(mktemp -d)
trap 'rm -rf "$TEST_ROOT"' EXIT HUP INT TERM

fail() {
  printf 'test failure: %s\n' "$1" >&2
  exit 1
}

assert_link_install() {
  test_home=$1
  for agent_dir in .claude .agents; do
    for skill in "$ROOT"/skills/*; do
      [ -d "$skill" ] || continue
      name=$(basename "$skill")
      dest="$test_home/$agent_dir/skills/$name"
      [ -L "$dest" ] || fail "$dest is not a link"
      [ "$(readlink "$dest")" = "$skill" ] || fail "$dest points to the wrong source"
    done
  done
}

assert_absent() {
  test_home=$1
  for agent_dir in .claude .agents; do
    for skill in "$ROOT"/skills/*; do
      [ -d "$skill" ] || continue
      name=$(basename "$skill")
      dest="$test_home/$agent_dir/skills/$name"
      [ ! -e "$dest" ] && [ ! -L "$dest" ] || fail "$dest was not removed"
    done
  done
}

link_home="$TEST_ROOT/link home"
HOME="$link_home" "$ROOT/install.sh" >/dev/null
assert_link_install "$link_home"
HOME="$link_home" "$ROOT/install.sh" >/dev/null
HOME="$link_home" "$ROOT/install.sh" --uninstall >/dev/null
assert_absent "$link_home"

copy_home="$TEST_ROOT/copy-home"
HOME="$copy_home" "$ROOT/install.sh" --copy >/dev/null
for agent_dir in .claude .agents; do
  for skill in "$ROOT"/skills/*; do
    [ -d "$skill" ] || continue
    name=$(basename "$skill")
    dest="$copy_home/$agent_dir/skills/$name"
    [ -d "$dest" ] || fail "$dest is not a copied directory"
    [ ! -L "$dest" ] || fail "$dest should not be a link"
    [ -f "$dest/.resume-tailor-source" ] || fail "$dest has no ownership marker"
  done
done
HOME="$copy_home" "$ROOT/install.sh" --copy >/dev/null
HOME="$copy_home" "$ROOT/install.sh" --uninstall >/dev/null
assert_absent "$copy_home"

conflict_home="$TEST_ROOT/conflict-home"
conflict="$conflict_home/.agents/skills/resume-bullet"
mkdir -p "$conflict"
printf 'keep me\n' > "$conflict/sentinel"
if HOME="$conflict_home" "$ROOT/install.sh" >/dev/null 2>&1; then
  fail "installer accepted an existing unmanaged destination"
fi
[ "$(sed -n '1p' "$conflict/sentinel")" = 'keep me' ] || fail "installer changed an existing destination"

if HOME="$TEST_ROOT/invalid-home" "$ROOT/install.sh" --unknown >/dev/null 2>&1; then
  fail "installer accepted an unknown option"
fi

printf 'installer tests passed\n'
