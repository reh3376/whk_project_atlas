# Project Atlas Documentation

This folder contains all project documentation for Project Atlas.

> **Note**: For setup instructions, see [../GETTING_STARTED.md](../GETTING_STARTED.md) in the project root.

## Documentation Structure

```
docs/
├── 00_Project_Charter/        # Goals, scope, success metrics
│   ├── baseline_assessment.md # Your skill ratings
│   ├── goals.md
│   ├── scope.md
│   └── success_metrics.md
│
├── 01_Roadmap/                # Phase planning
│   ├── roadmap.md             # Phase overview
│   ├── phase_map.md           # Deliverables per phase
│   └── dependency_graph.md
│
├── 02_Templates/              # Reusable document templates
│   ├── adr_template.md
│   ├── design_doc_template.md
│   ├── sprint_brief.md
│   └── ...
│
├── 03_Source_Policy/          # Citation and evidence rules
│   ├── source_tiers.md
│   └── citation_rules.md
│
├── 04_Memory_and_Handoff/     # ⭐ KEY: Project state tracking
│   ├── PROJECT_STATE.md       # Where are we? (read first!)
│   ├── CONTEXT_PACKET.md      # Paste into new AI chats
│   ├── WORK_LOG.md            # Daily progress notes
│   ├── DECISION_JOURNAL.md    # Why we decided things
│   └── START_HERE_RESUME.md
│
├── 05_Toolchain_Integrations/ # Linear, GitHub setup
│
└── Phases/                    # Phase-specific work
    ├── Phase_00_Foundation_Setup/
    ├── Phase_01_Modular_Platform_Architecture/
    ├── Phase_02_SDLC_DevEx_Standardization/
    ├── Phase_03_Data_Pipelines_Curation/
    ├── Phase_04_MLOps_SME_Supervision/
    └── Phase_05_Reliability_Observability_Security/
```

## How to Navigate

1. **Check current state**: Start with `04_Memory_and_Handoff/PROJECT_STATE.md`
2. **Resume after break**: Use `04_Memory_and_Handoff/START_HERE_RESUME.md`
3. **AI sessions**: Copy `04_Memory_and_Handoff/CONTEXT_PACKET.md` to clipboard
4. **Phase work**: Go to `Phases/Phase_XX/Start_Here.md`

## Phases Overview

| Phase | Focus | Key Deliverables |
|-------|-------|------------------|
| 00 | Foundation Setup | Cadence, SDLC baseline, dev env, templates |
| 01 | Modular Platform | Core + module contract, prototypes |
| 02 | SDLC & DevEx | CI/CD, testing strategy, release patterns |
| 03 | Data Pipelines | Metadata, lineage, quality checks |
| 04 | MLOps + SME | Orchestrator, evaluation harness |
| 05 | Reliability | SLOs, observability, incident response |

## Source Policy

See `03_Source_Policy/source_tiers.md`:
- **Tier A**: Peer-reviewed (preferred)
- **Tier B**: Standards/specs (allowed, labeled)
- **Tier C**: Vendor docs (allowed, labeled)
- **Tier D**: Blogs (require warning)

## Utility Scripts

Scripts are located in `../scripts/` (project root):

```bash
# From project root:
python scripts/build_phase_zip.py Phases/Phase_00_Foundation_Setup
python scripts/make_context_packet.py
```

---

_Last updated: 2025-12-14_
