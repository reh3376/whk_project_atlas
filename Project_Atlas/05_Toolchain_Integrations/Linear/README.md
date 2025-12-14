# Linear integration (Project Atlas)

This folder defines a **minimal, durable workflow** for using Linear as the execution layer while keeping
`04_Memory_and_Handoff/PROJECT_STATE.md` as the canonical “where are we?” source of truth.

## Conceptual mapping (Linear → Atlas)

Linear concepts (official) to use: **Initiatives**, **Projects**, **Cycles**, **Issues**, **Milestones**.  
See Linear conceptual model: https://linear.app/docs/conceptual-model

Recommended mapping:

- **1 Initiative**: `Project Atlas — Advanced Software & SDLC Mastery`
  - Long horizon, leadership-level grouping.
- **1 Project per Phase**: `P00 ...`, `P01 ...`, etc.
  - Treat each phase as a time-bounded “epic-like” unit of work.
- **Milestones inside each Project**: `Sprint 00.1`, `Sprint 00.2`, ...
- **Cycles**: use your team’s normal cycle length (default recommendation: 2 weeks).
  - Cycles provide capacity/velocity signals and keep the work “alive”.
- **Issues**: individual work items from sprint briefs and deliverables.

## Setup checklist (manual; no glue-code required)

### A) Create a dedicated Linear Team for Atlas (recommended)
1. In Linear, create a new **Team** (e.g., `ATLAS`).
2. Enable **Cycles** for that team (Team settings → Cycles) and choose cycle length.
3. Optional: enable **Triage** if you want an intake buffer.

Rationale: keeping Atlas work in its own team avoids mixing “learning roadmap execution” with day-job delivery queues.

### B) Create an Initiative for the whole program
1. Go to **Initiatives** (workspace-level).
2. Create: `Project Atlas — Advanced Software & SDLC Mastery`
3. Add a short description and paste a link to the GitHub repo root README.

Note: Initiatives are workspace-visible (not private).

### C) Create a Project per Phase (acts like “Epic per Phase”)
Create these Projects (in the ATLAS team project view, or workspace projects view):

- `P00 — Foundation Setup`
- `P01 — Modular Platform Architecture`
- `P02 — SDLC & DevEx Standardization`
- `P03 — Data Pipeline & Curated Datasets`
- `P04 — MLOps + SME Supervision`
- `P05 — Reliability / Observability / Security`

For each Project:
- assign a **Project lead** (you)
- set a rough **start + target** timeframe (month/quarter is fine)
- add the Project to the Initiative created above
- create Milestones for the phase sprints (e.g., `Sprint 00.1`, `Sprint 00.2`)

### D) Link Linear ↔ GitHub via PROJECT_STATE.md (the synchronization layer)
1. Copy the **Initiative URL** and each **Project URL** from Linear.
2. Paste them into `04_Memory_and_Handoff/PROJECT_STATE.md` under **Linear Links**.
3. In each Linear Project description, add a link back to:
   - `PROJECT_STATE.md` (GitHub file URL)
   - the Phase `Start_Here.md` (GitHub file URL)

This makes navigation bidirectional and robust.

## GitHub integration (optional but strongly recommended)

Linear’s GitHub integration can automatically link PRs/commits to Linear issues and move issue states.  
Docs: https://linear.app/integrations/github

Baseline workflow:
- Create Linear issue → copy **branch name** from Linear → use it for the Git branch.
- Ensure PR title includes the Linear issue ID (e.g., `ATLAS-123`).
- Linear will link the PR and can auto-update issue status as the PR moves and merges.

## Operating rule (non-negotiable)

- `PROJECT_STATE.md` is the canonical “status page”.
- Linear is the canonical “task execution system”.
- If they disagree, **update PROJECT_STATE.md first**, then reconcile Linear.

## Templates

This folder includes copy/paste issue templates you can register in Linear (Settings → Templates).
See `ISSUE_TEMPLATES.md`.
