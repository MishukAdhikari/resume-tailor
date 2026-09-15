# The skills

Five skills, in the order they are usually needed.

| Skill | Use it when |
| --- | --- |
| [`resume-keyword-map`](resume-keyword-map/SKILL.md) | You need to extract a posting's stated requirements and map evidence |
| [`resume-match`](resume-match/SKILL.md) | You have a CV and posting and want a match report with prioritized improvements |
| [`resume-bullet`](resume-bullet/SKILL.md) | You are writing or rewriting experience bullets |
| [`resume-evidence-gate`](resume-evidence-gate/SKILL.md) | Any claim or number is about to go on the page |
| [`resume-review`](resume-review/SKILL.md) | The document is finished and you want it audited |

`resume-evidence-gate` is not optional and not last. The other four call into it, and it
overrides them wherever they conflict.

## Compare a CV with a posting

```text
Use resume-match with my CV and this job description. Extract the required and preferred
keywords, show where my CV supports each requirement, and prioritize specific improvements.
Give before-and-after edits only where the evidence supports them. List missing evidence
as questions and distinguish it from skills I have confirmed I do not have.
```

Attach or paste both documents. Optionally ask to export the report and keyword matrix as
Markdown and CSV to a specified folder. The report assesses documented coverage, not a
proprietary ATS score. For extraction alone, use `resume-keyword-map`.

## Installing

Both Claude Code and Codex read a skill as a directory containing `SKILL.md` with YAML
frontmatter. The paths differ, which is why this repo ships both as symlinks to one
canonical `skills/` directory.

| Agent | Repo-level | Personal |
| --- | --- | --- |
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `~/.agents/skills/` |

### Use them in this repo

Nothing to do. Open the repo with either agent and the symlinked directories are found.

### Install them globally

```sh
./install.sh
```

Symlinks each skill into `~/.claude/skills/` and `~/.agents/skills/`, so edits here take
effect immediately in both agents with no copying step. Run `./install.sh --copy` instead
if you want independent copies, and `./install.sh --uninstall` to remove them.

### Install by hand

```sh
ln -s "$PWD/skills/resume-bullet" ~/.claude/skills/resume-bullet
ln -s "$PWD/skills/resume-bullet" ~/.agents/skills/resume-bullet
```

## Authoring notes

Frontmatter carries `name` and `description` only. Both agents use `description` to decide
whether to load the skill, so it has to say **what the skill does and when to reach for
it**, in terms a user would actually type. A description that only names the topic will not
fire.
