# Success metrics

This project is only successful if it changes shipping outcomes.

## Architectural leadership

- **Decision quality**: % of major architectural decisions captured as ADRs with:
  - alternatives considered
  - explicit constraints
  - measurable acceptance criteria
- **Design cycle time**: time from “idea” → “approved design” without repeated churn.
- **Boundary health** (platform): number of cross-module dependency violations detected by tooling.

## SDLC / Delivery

- **Lead time** (idea → production).
- **Deployment frequency** (per team / service).
- **Change failure rate** (deployments causing incidents/rollbacks).
- **MTTR** (mean time to restore).

## Dev environment consistency

- % of repos that can be built and tested with a single standard command.
- % of builds that are reproducible across dev machines and CI.

## Data pipeline quality

- Data lineage/provenance coverage (% datasets with complete provenance metadata).
- Data quality checks coverage (schema + constraints + freshness).
- Auditability: ability to answer “where did this training row come from?” within X minutes.

## Human-in-the-loop / SME supervision

- Offline evaluation reproducibility (same inputs → same report).
- Decision logging: % of orchestrator actions attributable to a policy/config version.
- Safe failure modes demonstrated in drills (e.g., fallback logic).

## Adoption

- Team compliance with the SDLC baseline (measured via CI checks + repo audits).
- Onboarding time to contribute to a service/module (hours/days).
