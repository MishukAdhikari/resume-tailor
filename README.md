# resume-tailor

Agent skills for tailoring a resume to a job posting without inventing anything.

The skills live in [`skills/`](skills/). They work in both Claude Code and Codex and
cover the full resume workflow: read the posting, map it to evidence, rewrite the
bullets, keep every claim honest, and review the finished document.

## The skills

| Skill | Use it when |
| --- | --- |
| [`resume-keyword-map`](skills/resume-keyword-map/SKILL.md) | You need to extract a posting's stated requirements and map evidence |
| [`resume-match`](skills/resume-match/SKILL.md) | You have a CV and posting and want a match report with prioritized improvements |
| [`resume-bullet`](skills/resume-bullet/SKILL.md) | You are writing or rewriting experience bullets |
| [`resume-evidence-gate`](skills/resume-evidence-gate/SKILL.md) | Any claim or number is about to go on the page |
| [`resume-review`](skills/resume-review/SKILL.md) | The document is finished and you want it audited |

`resume-evidence-gate` is not optional and not last. The other skills call into it, and
it overrides them wherever a change would make an unverified claim easier to ship.

## How they fit together

1. Supply the target posting, current resume, and evidence or confirmed notes about your work.
2. Run `resume-keyword-map` for requirement extraction, or `resume-match` for a full CV
   comparison and prioritized improvement report.
3. Run `resume-bullet` to draft or revise the strongest relevant contributions.
4. Use `resume-evidence-gate` throughout, then `resume-review` on the final document.

Keep evidence notes separate from the resume, and resolve missing facts before using them.

## Example: compare a CV with a posting

```text
Use resume-match with my CV and this job description. Extract the required and preferred
keywords, show where my CV supports each requirement, and prioritize specific improvements.
Give before-and-after edits only where the evidence supports them. List missing evidence
as questions and distinguish it from skills I have confirmed I do not have.
```

Attach or paste both documents. Optionally ask to export the report and keyword matrix as
Markdown and CSV to a specified folder. For extraction alone, use `resume-keyword-map`.

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
git clone https://github.com/MishukAdhikari/resume-tailor.git
cd resume-tailor
./install.sh
```

Symlinks each skill into `~/.claude/skills/` and `~/.agents/skills/`, so edits here take
effect immediately in both agents with no copying step. Run `./install.sh --copy` instead
if you want independent copies, and `./install.sh --uninstall` to remove them.

The installer is non-destructive: it never overwrites an existing file, directory, or
link. Uninstall removes only links that point to this checkout and copies carrying this
installer's ownership marker. Set `CLAUDE_SKILLS_DIR` or `CODEX_SKILLS_DIR` to override a
destination.

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

Run `./scripts/validate.sh` before committing. It checks the discovery symlinks,
frontmatter, naming, prose rules, shell syntax, idempotent installs, safe conflict handling,
and uninstall ownership. GitHub Actions runs the same validation on pushes and pull requests.

Codex paths and symlink support follow the current
[official skill documentation](https://developers.openai.com/codex/skills/).
