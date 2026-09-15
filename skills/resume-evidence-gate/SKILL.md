---
name: resume-evidence-gate
description: Check resume claims against supporting sources or explicit candidate confirmation, recording verification limits and withholding unresolved claims. Use when writing or reviewing CV, resume, or LinkedIn copy, adding metrics, checking ownership, or auditing accuracy.
---

# The evidence gate

Every resume claim is a promise that survives an interview. This skill is the check that
runs before a claim ships.

**The prime directive: be real, never inflate, but be engaging.** Honesty and engagement
are both required. They are not a trade-off, and "compelling" is never a reason to loosen
the gate.

## The failure this exists to prevent

Illustrative failure: a candidate's kit rates a billing claim **High confidence**, saying
it "took about 90 seconds of engineer time to close". A source check instead finds
`mergedAt: null`: the PR was open 103 days and closed unmerged. That evidence does not
establish a shipped fix. It also does not establish whether another change later fixed
the defect; check release or production evidence before making either claim.

A confidence rating is not verification. This scenario illustrates the check; it is not
a documented incident or a fact about the current candidate.

## The gate

Run this on every claim before it enters a document.

### 1. Name the source

Use evidence appropriate to the claim and profession. Examples:

- a merged PR, with its merge state actually checked
- a commit, a release tag, a dated ticket
- a dashboard reading with a date
- a document you wrote that still exists
- a work sample, approved report, performance review, or dated project record
- a candidate's specific firsthand account, or a named reference who could confirm it

Record each proposed claim, its source, the candidate's contribution, and any limits in
working notes, not in the resume itself. Use these statuses:

- **Verified**: you inspected a source that supports the claim as worded.
- **Candidate-confirmed**: the candidate explicitly confirmed the fact and scope, but you
  could not independently inspect supporting records. Use only what they confirmed and
  record this limitation; do not claim independent verification.
- **Unresolved**: the claim is inferred, ambiguous, contradicted, or lacks confirmation.
  Ask a focused question and keep it out of final copy until resolved.

A previous AI draft or confidence label is not candidate confirmation. Do not contact
references or upload private employer records without authorization. A source need not
be public to support a claim.

### 2. Check the number at source, not at its rating

A confidence score is someone's past opinion. Re-derive the number from the thing itself.
For a percentage, check the baseline, end value, unit, period, and calculation. Distinguish
percent change from percentage-point change. A claim of 80% growth requires evidence
of a final value 1.8 times the baseline. Check whether the figure describes the candidate's
work, a team result, or company-wide scale, and word the attribution accordingly.

When records are unavailable, retain a number only if the candidate explicitly confirms
its value, scope, period, and basis. Record it as candidate-confirmed. A guessed estimate
or unsupported calculation stays unresolved.

### 3. Classify the number

| Class | Examples | Verdict |
| --- | --- | --- |
| **Outcome** | cost down 20%, latency down 40%, defect rate halved | Ship it, if sourced |
| **Scale** | 100,000+ sites, seven cloud providers, 1,000+ internal users | Ship it, if sourced |
| **Activity** | 857 commits, 742 code reviews, 40 PRs a month | Omit standalone counts; retain only when they establish relevant workload or scope with context |

An activity count alone does not demonstrate impact. Workload can still matter for a
role: a sourced customer caseload or service volume may establish relevant scale. Explain
what the count proves, and do not rename activity as an outcome.

### 4. Check the ownership word

The verb describes the actual contribution; it is not a ladder of seniority.

- **Owns**: accountable for a defined area or outcome. Commit volume alone does not prove it.
- **Ships into**: delivered changes in a system, with delivery status confirmed.
- **Designed**: made substantive design decisions, supported by an artifact or a specific
  confirmed account. A formal ADR is not required for every profession or project.
- **Led**: directed the stated work or coordinated the stated people. Specify scope.
- **Contributed to / Supported**: accurately describes a bounded part of a shared effort;
  name that part rather than inflating it into ownership.

A candidate may have both designed and delivered something. Verify each assertion.
A merged PR establishes integration, not deployment, adoption, or business impact.
Check those separately before claiming them. The same distinction applies to a proposal,
a completed deliverable, its launch, and its measured effect outside software work.

### 5. Ask the interview question

Read the bullet aloud and ask: *what is the first follow-up question, and do I have the
answer?*

If the candidate cannot explain the claim or its basis, mark it unresolved and ask for
clarification. Interview readiness does not replace checking the evidence.

## What to do when a claim fails the gate

Preserve the part the evidence supports. Rewording cannot make an unsupported claim true.

| Failed because | Fix |
| --- | --- |
| The number cannot be sourced | Remove the number only if the qualitative result is supported; otherwise describe the verified contribution. |
| The number is an activity count | Use a supported outcome or relevant workload context; otherwise move it to interview notes. |
| The ownership word overstates | Choose the verb that describes the verified action; do not substitute a different unsupported claim. |
| The whole claim is unverifiable | Withhold it, request evidence, and look for a supported contribution. |

A two-part bullet that is true beats a three-part bullet that is not.

## The one rule that overrides everything

If a formula, template, or piece of advice creates pressure to produce a number, the
pressure loses. **A supported contribution without a metric is acceptable. An invented metric is not.**
