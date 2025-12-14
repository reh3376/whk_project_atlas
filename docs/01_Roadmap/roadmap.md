# Roadmap

This is a long-term program. The pacing can be tuned, but the sequencing is deliberate:

1. **Phase 00 — Foundation Setup**
   Make the delivery machine real: templates, cadence, CI standards, dev env parity.

2. **Phase 01 — Modular Platform Architecture**
   Define boundaries and contracts. Build a small reference implementation.

3. **Phase 02 — SDLC & DevEx Standardization**
   Convert SDLC intent into enforceable gates and repeatable workflows.

4. **Phase 03 — Data Pipelines & Curation**
   Build the curated dataset system: metadata, intervals, lineage, quality checks.

5. **Phase 04 — MLOps + SME Supervision**
   Build the orchestration layer as an auditable, testable control system.

6. **Phase 05 — Reliability / Observability / Security**
   Make it operable, measurable, and safe. Bake in incident response, threat modeling.

## Suggested cadence (given 40–60 hrs/week)

- Use **2-week learning sprints**.
- Each phase is 1–3 sprints depending on depth and current gaps.
- Each sprint should ship tangible artifacts (design docs, ADRs, runnable prototypes, checklists).

## “Capstone” thread

Across phases, evolve one reference system: **Atlas Platform**:
- Phase 01: core + module contract + sample modules
- Phase 02: CI, tests, releases, environment standardization
- Phase 03: pipeline module(s) + curated datasets + metadata
- Phase 04: orchestrator module + evaluation harness + supervision UX hooks
- Phase 05: SLOs, observability, security hardening, incident drills
