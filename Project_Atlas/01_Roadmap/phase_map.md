# Phase map

Each phase has:
- A clear goal (skill + artifact)
- 1–3 learning sprints
- Deliverables designed to be re-used by teams

## Phase 00 — Foundation Setup
Deliverables:
- Engineering cadence + roles (meeting plan)
- SDLC baseline (branching, PR rules, CI gates)
- Standard dev environment (container-first)
- Repo templates (service skeleton, module skeleton)
- Metrics plan (what we measure and why)

## Phase 01 — Modular Platform Architecture
Deliverables:
- Platform architecture design doc (core + module contract)
- ADR set for key tradeoffs (sync/async, boundaries, data ownership, versioning)
- Prototype: module registry + loader + lifecycle hooks
- Prototype: Python↔C boundary pattern (minimal but real)
- Security/threat model draft for module execution

## Phase 02 — SDLC & DevEx Standardization
Deliverables:
- Standard CI pipeline template
- Testing strategy playbook (unit/integration/contract/perf)
- Release strategy playbook (feature flags, canary, rollback)
- Code style & formatting standard + enforcement
- Repository “golden path” skeleton

## Phase 03 — Data Pipelines & Curation
Deliverables:
- Metadata model (schemas + semantics + provenance)
- Snapshotting strategy (intervals, idempotency, partitioning)
- Data quality checks framework
- Prototype pipeline: source → transform → curated snapshots
- Dataset documentation template (datasheet/model card analogs)

## Phase 04 — MLOps + SME Supervision
Deliverables:
- Orchestrator design (human-in-the-loop control system)
- Evaluation harness (offline metrics + reproducibility)
- Monitoring plan (drift, anomalies, feedback loop health)
- Audit log spec + replay capability
- “When NOT to use ML” decision rubric

## Phase 05 — Reliability / Observability / Security
Deliverables:
- SLO/SLI definitions for platform + pipelines
- Observability baseline integrated into reference system
- Incident response playbook + runbooks
- Threat model updates + secure SDLC checklist
