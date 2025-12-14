# Sprint Brief: Sprint 00.1

## Sprint ID
- Phase: Phase 00 — Foundation Setup
- Sprint: 00.1
- Dates: 2025-12-14 to 2025-12-28 (2 weeks)
- Owner(s): Project Lead

## Goal (1–2 sentences)

Establish the foundational delivery infrastructure for Project Atlas: standardized development environment, engineering cadence, SDLC baseline, and project tracking integration.

## Why this matters (first principles)

Before building a modular platform, data pipelines, or ML orchestration, we need a reliable "delivery machine." Without:
- **Reproducible dev environments**: onboarding friction and "works on my machine" bugs slow progress
- **SDLC standards**: inconsistent quality, unpredictable releases, technical debt accumulation
- **Engineering cadence**: misalignment, context loss between sessions, decisions not captured
- **Task tracking**: work disappears into chat history; no visibility into progress

This sprint creates the scaffolding that makes all future phases executable.

## Scope

### In:
- Baseline self-assessment completion
- Engineering cadence definition (meeting types, frequency, artifacts)
- SDLC baseline document (branching strategy, PR rules, CI gate requirements)
- Container-first development environment (Dockerfile, docker-compose, Python/uv setup)
- Repository template specifications (service skeleton, module skeleton)
- Metrics plan (what to measure, how, why)
- Linear integration setup documentation

### Out:
- Actual CI/CD pipeline implementation (deferred to Sprint 00.2 or Phase 02)
- Full module skeleton implementation (Phase 01)
- Performance benchmarks (Phase 05)
- ML-specific tooling (Phase 04)

## Inputs

### Primary sources (peer-reviewed preferred):
- Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution Press. [Tier A equivalent - rigorous research]
- Bass, L., Weber, I., & Zhu, L. (2015). *DevOps: A Software Architect's Perspective*. Addison-Wesley. [Tier A]

### Standards/Specifications (Tier B):
- Docker documentation: https://docs.docker.com/
- Python Packaging Authority (PyPA) specifications
- Conventional Commits: https://www.conventionalcommits.org/

### Constraints:
- On-prem/intranet deployment priority (cloud only for temporary scaffolding)
- Python + C stack for backend; Next.js/TS for frontend
- Must work with existing user development rules (uv, ruff, pytest)

## Deliverables (must be tangible)

- [x] Baseline assessment template: `00_Project_Charter/baseline_assessment.md`
- [ ] Design doc: `Deliverables/dev_environment_design.md`
- [ ] ADRs:
  - [ ] ADR-001: Container-first development strategy
  - [ ] ADR-002: Python dependency management with uv
  - [ ] ADR-003: Branching and PR strategy
- [ ] Prototype / code:
  - [ ] `Dockerfile` (workspace root)
  - [ ] `docker-compose.yml` (workspace root)
  - [ ] `requirements.txt` (workspace root)
  - [ ] `.python-version` (workspace root)
- [ ] Checklists / runbooks:
  - [ ] `Deliverables/dev_environment_runbook.md`
  - [ ] `Deliverables/engineering_cadence.md`
  - [ ] `Deliverables/sdlc_baseline.md`
  - [ ] `Deliverables/metrics_plan.md`
- [ ] Linear integration: Setup documentation complete, links in PROJECT_STATE.md
- [ ] Retro: `Sprints/Sprint_1/retro.md` (end of sprint)

## Acceptance criteria

### Environment Setup
- [ ] `docker-compose up` successfully builds and runs the dev container
- [ ] Python environment activates with all dependencies installed
- [ ] `ruff check .` passes with no errors on initial codebase
- [ ] README documents the "one command" setup process

### SDLC Baseline
- [ ] Branching strategy documented with examples
- [ ] PR template created with required sections
- [ ] CI gate requirements listed (even if not yet automated)

### Engineering Cadence
- [ ] Meeting types defined with frequency and expected artifacts
- [ ] Decision capture process documented

### Metrics Plan
- [ ] DORA metrics defined with collection strategy
- [ ] At least 3 leading indicators identified

### "Done means done" definition
- All deliverables exist as files in the repository
- PROJECT_STATE.md updated with sprint completion status
- WORK_LOG.md updated with sprint summary
- User has verified dev environment works on their machine

## Risks & unknowns

| Risk | Mitigation |
|------|------------|
| Docker not available on target machine | Document native Python fallback |
| User skill levels unknown | Baseline assessment captures this; adjust scope in Sprint 00.2 |
| Linear account may not exist | Document setup steps; can proceed without it |
| Time constraints | Prioritize dev environment over documentation polish |

## Work plan (high level)

### Week 1 (Dec 14-20):
- Day 1-2: Complete baseline assessment, sprint brief, initial PROJECT_STATE updates
- Day 3-4: Create dev environment specification and Dockerfile/docker-compose
- Day 5-7: Validate environment setup, create runbook

### Week 2 (Dec 21-28):
- Day 1-2: Engineering cadence document, SDLC baseline
- Day 3-4: Metrics plan, ADRs for key decisions
- Day 5-6: Linear integration documentation, final validation
- Day 7: Sprint retro, handoff document updates

---

_Created: 2025-12-14_

