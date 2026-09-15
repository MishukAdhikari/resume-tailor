# AGENTS.md

Repository conventions for Codex and any agent working in this repo.

## What this repo is

Five agent skills for writing and reviewing resumes. The skills are the product. Everything
else supports them.

## Layout

```
skills/                       canonical skills, one directory per skill
  <skill-name>/SKILL.md       YAML frontmatter (name, description) + instructions
.agents/skills -> ../skills   symlink, so Codex discovers repo-level skills
.claude/skills -> ../skills   symlink, so Claude Code discovers the same files
```

There is exactly one copy of every skill. The two dotfile directories are symlinks, not
duplicates. Never resolve a symlink into a real directory: the copies will drift.

## Rules when editing skills

- **Frontmatter is `name` and `description` only.** `name` must match the directory name
  and use lowercase and hyphens. `description` states what the skill does *and* when to
  use it, because that is the only text an agent sees when deciding whether to load it.
- **`resume-evidence-gate` outranks every other skill.** If a change to another skill would
  make it easier to ship an unverified claim, the change is wrong.
- **Keep the worked examples.** Specific figures make the instructions concrete. Do not
  generalise them into placeholders.
- **No em-dashes in skill prose.** Commas, periods, parentheses.

## Verifying a change

Before committing:

1. Run `./scripts/validate.sh`. It checks skill structure, frontmatter, discovery symlinks,
   shell syntax, installer idempotency, conflict safety, and owned uninstall behavior.
2. Read every changed skill start to finish and ask whether an agent could follow it without
   already knowing the answer.
