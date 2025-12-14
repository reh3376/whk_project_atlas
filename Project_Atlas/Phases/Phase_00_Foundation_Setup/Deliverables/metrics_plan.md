# Metrics Plan

_Last updated: 2025-12-14_

This document defines what we measure, how, and why for Project Atlas.

## Philosophy

> "Measure what matters, not what's easy."

Metrics serve to:
1. Validate that changes improve outcomes
2. Identify problems early
3. Enable data-driven decisions

Metrics should NOT be used to:
- Gamify performance
- Create artificial pressure
- Replace judgment with numbers

---

## Core Metrics: DORA Four

The DORA (DevOps Research and Assessment) metrics are the industry standard for measuring software delivery performance.

### 1. Lead Time for Changes

**Definition**: Time from code commit to production deployment.

**Why it matters**: Measures how quickly value reaches users.

**Measurement**:
- Start: PR merged to main
- End: Deployed to production (or "done" for learning project)

**Current target**: Not yet measured
**Future target**: < 1 week for small changes

**Collection method**: Manual for now; GitHub Actions timestamps in Phase 02

---

### 2. Deployment Frequency

**Definition**: How often code is deployed to production.

**Why it matters**: Frequent small deployments reduce risk.

**Measurement**:
- Count deployments/releases per time period
- For learning project: count "sprint deliverables shipped"

**Current target**: Not yet measured
**Future target**: At least 1 per sprint (bi-weekly)

**Collection method**: Count git tags / release notes

---

### 3. Change Failure Rate

**Definition**: Percentage of deployments causing failures requiring remediation.

**Why it matters**: Measures quality of changes.

**Measurement**:
- Failures: rollbacks, hotfixes, incidents
- Rate: failures / total deployments

**Current target**: Not yet measured
**Future target**: < 15%

**Collection method**: Track in WORK_LOG.md; Linear issue labels

---

### 4. Mean Time to Restore (MTTR)

**Definition**: Time from failure detection to restoration of service.

**Why it matters**: Measures recovery capability.

**Measurement**:
- Start: Issue reported / detected
- End: Fix deployed and verified

**Current target**: Not yet measured
**Future target**: < 24 hours for critical issues

**Collection method**: Linear issue timestamps

---

## Leading Indicators

These metrics predict future problems before they manifest:

### 1. Work in Progress (WIP)

**Definition**: Number of items in "In Progress" state.

**Why it matters**: High WIP = context switching = slower delivery.

**Target**: ≤ 3 items in progress at any time

**Collection**: Linear board state

---

### 2. Cycle Time

**Definition**: Time from work started to work completed.

**Why it matters**: Identifies bottlenecks in the workflow.

**Target**: < 1 week for typical tasks

**Collection**: Linear issue lifecycle timestamps

---

### 3. PR Review Time

**Definition**: Time from PR opened to first review.

**Why it matters**: Long review times block flow.

**Target**: < 24 hours for first review

**Collection**: GitHub PR timestamps (when applicable)

---

### 4. Test Coverage

**Definition**: Percentage of code covered by automated tests.

**Why it matters**: Low coverage increases change failure risk.

**Target**: ≥ 80% for core modules

**Collection**: pytest-cov reports

---

### 5. Linter Violations Trend

**Definition**: Number of linter warnings/errors over time.

**Why it matters**: Rising violations indicate technical debt accumulation.

**Target**: 0 errors, decreasing warnings

**Collection**: ruff check output in CI

---

## Project-Specific Metrics

### Baseline Assessment Progress

**Definition**: Self-assessment score improvement over time.

**Why it matters**: Validates that the learning program is effective.

**Measurement**: Compare baseline_assessment.md scores quarterly

**Target**: Measurable improvement each quarter

---

### Deliverable Completion Rate

**Definition**: Sprint deliverables completed / planned.

**Why it matters**: Measures planning accuracy and execution.

**Target**: ≥ 80% completion rate

**Collection**: Sprint brief acceptance criteria tracking

---

### Decision Documentation Rate

**Definition**: Percentage of significant decisions captured as ADRs.

**Why it matters**: Ensures institutional knowledge is preserved.

**Target**: 100% of architectural decisions documented

**Collection**: Count ADRs / count decisions in DECISION_JOURNAL.md

---

## Metrics Dashboard (Future)

When metrics collection is automated, display:

```
┌─────────────────────────────────────────────────────────────┐
│                    Project Atlas Metrics                     │
├─────────────────┬────────────┬────────────┬─────────────────┤
│ Lead Time       │ Deploy Freq│ Failure %  │ MTTR            │
│ 3.2 days        │ 2/sprint   │ 8%         │ 4 hours         │
│ ▼ improving     │ ▲ stable   │ ▼ improved │ ▲ stable        │
├─────────────────┴────────────┴────────────┴─────────────────┤
│ WIP: 2/3  │  Coverage: 84%  │  PR Review: 12h avg          │
└─────────────────────────────────────────────────────────────┘
```

---

## Collection Schedule

| Metric | Collection Frequency | Owner | Location |
|--------|---------------------|-------|----------|
| DORA metrics | Monthly | Project Lead | PROJECT_STATE.md |
| WIP | Weekly | Project Lead | Linear board |
| Test coverage | Per PR | CI | Test reports |
| Linter status | Per PR | CI | CI logs |
| Baseline assessment | Quarterly | Project Lead | baseline_assessment.md |

---

## Reporting

### Weekly (Delivery Review)
- WIP count
- Blockers
- Cycle time for completed items

### Sprint (Sprint Review)
- Deliverable completion rate
- Test coverage delta
- Any incidents/failures

### Monthly (Platform Governance)
- DORA metrics snapshot
- Trend analysis
- Process improvement recommendations

---

## Anti-patterns to Avoid

| Anti-pattern | Problem | Alternative |
|--------------|---------|-------------|
| Lines of code | Incentivizes verbose code | Measure outcomes, not output |
| Commit count | Incentivizes small commits | Measure lead time |
| Bug count | Incentivizes hiding bugs | Measure MTTR |
| Story points | Inflation over time | Measure cycle time |

---

## References

### Tier A (Peer-reviewed)
- Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution Press.
- DORA Research Program: https://dora.dev/research/

### Tier B (Standards)
- DORA Quick Check: https://dora.dev/quickcheck/

---

_Created: 2025-12-14_

