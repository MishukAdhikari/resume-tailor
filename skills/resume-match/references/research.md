# Research behind resume-match

Reviewed 2026-09-16. This is a focused comparison of three relevant community skills,
not an exhaustive ranking or a benchmark of hiring outcomes. Source instructions were
inspected; third-party scripts were not executed. The new skill is original prose.

## Community skills evaluated

| Skill and source | Useful approach | Limits found in the source | Decision for this repository |
| --- | --- | --- | --- |
| [ComposioHQ: tailored-resume-generator](https://github.com/ComposioHQ/awesome-claude-skills/blob/master/tailored-resume-generator/SKILL.md) | Broad workflow covering requirement extraction, experience mapping, tailoring, and recommendations | Its sample output introduces SQL query counts, savings, and ROI figures absent from its sample candidate input, despite a rule against fabrication | Strongest general-purpose discovery candidate among those inspected, but not suitable to import unchanged under our evidence rule |
| [pfallonjensen: resume-tailor](https://github.com/pfallonjensen/resume-tailor/blob/main/skill/skill.md) | Section-specific gaps and small before-and-after edits linked to a candidate corpus | Personal absolute paths, fixed character bands, and a rule that every new word must already occur in the corpus. Word presence cannot establish that a new claim is true | Use the idea of traceable edits, with claim-level evidence rather than a vocabulary whitelist |
| [keananwongso: repo-to-resume](https://github.com/keananwongso/repo-to-resume/blob/main/SKILL.md) | Repository evidence, keyword coverage, and a repeatable edit-and-recheck loop | Software/LaTeX focus; contribution percentages and infrastructure files can be overinterpreted as ownership or deployment | Useful specialist reference; confirm contribution and delivery separately and support non-software CVs |

The [skills.sh listing](https://www.skills.sh/composiohq/awesome-claude-skills/tailored-resume-generator)
showed about 9.3K installs for Composio's skill. GitHub API checks showed 75,085 stars for
its collection and 0 each for the two smaller repositories on the review date. These are
adoption signals, not evidence that the skills produce accurate matches. The smaller two
are design references, not broadly validated installation recommendations.

The skills.sh website and GitHub source files were used for discovery. The local
`npx skills find resume` command could not run because the installed Node executable was
missing an ICU shared library. No third-party skill was installed.

## Primary documentation and implications

[Greenhouse Talent Filtering](https://support.greenhouse.io/hc/en-us/articles/27104809835291-Talent-Filtering)
describes exact keyword matching and configurable AND/OR search terms. This supports
keeping exact wording separate from evidence of equivalent capabilities. It does not
establish that every employer uses those filters or that a candidate-side score predicts
an interview. Its search labels also do not replace the priorities stated in a posting.

[Greenhouse keyword suggestions](https://support.greenhouse.io/hc/en-us/articles/41476323569563-Keyword-suggestions)
describes suggestions derived from job content that recruiters can select as filters.
The posting is a useful starting point, but the recruiter's selected terms are not known.

[Harvard's resume guidance](https://careerservices.fas.harvard.edu/resources/create-a-strong-resume/)
recommends specific, factual writing and tailoring to the position. It supports selecting
relevant evidence and clear wording, not inventing accomplishments to fill a keyword gap.

## Why add a fifth skill?

`resume-keyword-map` extracts requirements and maps candidate evidence before drafting.
`resume-match` examines an existing CV and delivers a traceable requirement matrix,
classifies the gaps, and specifies changes at particular locations. `resume-review`
checks overall document quality. Keeping these boundaries explicit avoids running a full
CV comparison when the user only asks to extract a posting's keywords.

The distinction between wording, qualification coverage, and evidence status is our design
choice based on these limitations. It has not been validated against proprietary ATS
ranking systems. Candidate confirmation supports a claim without becoming independent
verification. Missing information stays unknown until clarified.
