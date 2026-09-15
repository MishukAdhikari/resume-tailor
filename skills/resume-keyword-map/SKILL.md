---
name: resume-keyword-map
description: Extract requirements, tools, and capability keywords from a job posting and map them to verified resume evidence. Use when tailoring a CV to a posting, choosing skills to highlight, or identifying qualification gaps. Does not infer an employer's hidden screening rules or the cause of a rejection.
---

# Mapping a posting to your evidence

Read the posting and the candidate's resume or evidence notes. If the posting is missing,
request it; a general role profile is provisional and must be labelled as such. Before
using any claim, apply [resume-evidence-gate](../resume-evidence-gate/SKILL.md).

ATS products and employer settings differ. Use the posting as evidence of stated needs,
not as proof of automatic rejection rules. Do not promise an ATS score or a response.

For a comparison of an existing CV with concrete improvement points, use
[resume-match](../resume-match/SKILL.md), which builds on this extraction workflow.

## Step 1: Separate requirements from preferences

Extract all three sections, preserving the employer's labels:

1. **Requirements**: make supported must-haves visible and flag gaps explicitly.
2. **Preferred qualifications**: highlight supported differentiators after requirements.
3. **Responsibilities**: use the day-to-day work to select relevant achievements.

Do not silently promote a preference to a requirement. Prioritize technical and hard
skills; demonstrate relevant communication and leadership through concrete examples.

## Step 2: Keep capabilities and explicitly requested tools

Use the posting's language where it accurately describes the candidate's work. A tool
name does not establish a capability, but a generic capability does not replace an
explicit tool requirement either. A concise, truthful skills list is useful alongside
bullets that show how those skills were applied.

| Posting says | Honest coverage, if supported | Avoid |
| --- | --- | --- |
| "PostgreSQL" | PostgreSQL in skills and a relevant data example | Replacing it with only "databases", or an ambiguous acronym |
| "agent orchestration" | Agent orchestration with an example of tool calling or workflow design | Listing frameworks as proof of a capability never demonstrated |
| "AWS provisioning" | AWS plus the actual provisioning work | Replacing AWS with only "multi-cloud" |
| "CI/CD experience" | CI/CD (continuous integration and delivery), with release automation evidence | An unrelated inventory of six CI products |

Use full names and common acronyms naturally where helpful. Do not repeat keywords to
inflate a score, add hidden text, or claim tools the candidate has not used.

### Optional market comparison

For one application, use that posting. If the user requests a broader role profile,
compare relevant postings and report the sample and recurring terms. Do not impose a
fixed sample size or frequency threshold, and do not override the target posting with
terms that happen to be more common elsewhere.

## Step 3: Map each keyword to evidence

Build the table before writing copy. These entries illustrate decisions, not candidate facts:

| Keyword | Posting section / priority | Candidate evidence / source | Verdict and placement |
| --- | --- | --- | --- |
| agent orchestration | Preferred | Production workflow with verified contribution | Relevant bullet; headline only if central to experience |
| Kubernetes | Required | One documented project two years ago | Describe that scope accurately; assess whether it meets the stated requirement |
| Rust | Required | None supplied | Unknown; do not claim; ask for evidence if available |

- **Verified evidence**: include it where relevant, with scope and proficiency matching
  the source. Limited experience can support a narrowly worded project bullet.
- **Candidate-confirmed, not independently verified**: record that status in the evidence
  notes and follow the evidence gate. Do not imply that you checked a source you did not see.
- **Missing evidence**: keep it out of final copy and identify the gap. A draft suggestion
  is not evidence.

## Step 4: Show context as well as competence

Where true, connect experience to the employer's company stage, size or business model,
tools, and industry. If the context differs, explain the transferable result in the
employer's terms without implying experience in their industry that the candidate lacks.

Ask whether each important keyword is backed by an example of doing the work. A skills
list can aid discovery; the bullet supplies the evidence.

## Step 5: Deliver a tailored selection

Return the evidence map, the most relevant achievements to lead with, and outstanding
qualification or evidence gaps. Keep a sourced master document and derive each application
from it. Add newly verified facts to the master before using them in a tailored version.

Select the relevant portion of the candidate's experience, not a literal 10% quota.
Tailoring improves the clarity of the match; it does not guarantee an interview.
