# Context packet (copy/paste into a new AI chat)

> This file is designed to be pasted into a chat assistant to restore context.
> Regenerate it with `python Tools/make_context_packet.py` whenever you want it fresh.
> 
> **Last regenerated: 2025-12-14**

## 1) Project intent (high level)

Project Atlas is a long-term program to build frameworks and roadmaps for:
- Modular backend platforms (core + modules/plugins)
- Curated data pipelines (metadata + lineage + periodic snapshots for ML)
- SME-supervised narrow AI orchestration for ML-heavy process optimization tools

Primary output mode: architectural leadership, supported by implementation and SDLC.

Execution tracking: Linear (projects per phase). Canonical status: `PROJECT_STATE.md`.

Tech stack:
- Backend: Python (Cython optional) + C libraries for compute-heavy code
- Frontend: Next.js / JS/TS
- Deployment: container-first, on-prem/intranet preferred

Evidence policy:
- Prefer peer-reviewed sources (Tier A)
- Standards/specs allowed but labeled (Tier B)
- Vendor docs labeled (Tier C)
- Blogs require warning (Tier D)

## 2) Current state

**Phase**: Phase 00 — Foundation Setup
**Sprint**: Sprint 00.1
**Objective**: Establish foundation - baseline assessment, sprint brief, dev environment, Linear integration

**Completed (2025-12-14):**
- Baseline assessment template created (awaiting user skill ratings)
- Sprint 00.1 brief completed
- Development environment specification (design doc)
- Docker-based dev environment (Dockerfile, docker-compose.yml, requirements.txt)
- Dev environment runbook (Docker + native workflows)
- Engineering cadence document
- SDLC baseline document
- Metrics plan (DORA + leading indicators)
- Linear setup guide

**Next 3 tasks:**
1. User: Complete baseline self-assessment ratings in `00_Project_Charter/baseline_assessment.md`
2. User: Set up Linear workspace per `Phases/Phase_00_Foundation_Setup/Deliverables/linear_setup_guide.md`
3. Validate dev environment (`docker-compose up`)

**Pending Sprint 00.1:**
- ADRs for key decisions (container-first, uv, branching)
- Sprint 00.1 retro (end of sprint)

## 3) What I want from the assistant in this session
- (Fill in your specific goals for this session)

## 4) Non-negotiables
- Output must produce tangible deliverables (docs/code/checklists).
- No un-cited claims presented as fact; label non-peer-reviewed material.
- User verification required before marking anything as complete.

## 5) Where the files are
- Roadmap: `01_Roadmap/`
- Templates: `02_Templates/`
- Phase work: `Phases/`
- Handoff/memory: `04_Memory_and_Handoff/`
- Phase 00 Deliverables: `Phases/Phase_00_Foundation_Setup/Deliverables/`
- Dev environment files: workspace root (`Dockerfile`, `docker-compose.yml`, `requirements.txt`)

## 6) Key documents for this phase

| Document | Path |
|----------|------|
| Sprint Brief | `Phases/Phase_00_Foundation_Setup/Sprints/Sprint_1/Sprint_00_1_Brief.md` |
| Dev Environment Design | `Phases/Phase_00_Foundation_Setup/Deliverables/dev_environment_design.md` |
| Dev Environment Runbook | `Phases/Phase_00_Foundation_Setup/Deliverables/dev_environment_runbook.md` |
| Engineering Cadence | `Phases/Phase_00_Foundation_Setup/Deliverables/engineering_cadence.md` |
| SDLC Baseline | `Phases/Phase_00_Foundation_Setup/Deliverables/sdlc_baseline.md` |
| Metrics Plan | `Phases/Phase_00_Foundation_Setup/Deliverables/metrics_plan.md` |
| Linear Setup | `Phases/Phase_00_Foundation_Setup/Deliverables/linear_setup_guide.md` |
