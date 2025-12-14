# Project Atlas

A long-term, phase-based framework for building **advanced software solutions** and the **SDLC machinery** required to ship them reliably.

## Quick Start

```bash
# Start development environment
make up

# Enter container
make shell

# Show all available commands
make help
```

See [GETTING_STARTED.md](GETTING_STARTED.md) for detailed setup instructions.

## Project Structure

```
WHK_project_atlas/
├── README.md              # This file
├── GETTING_STARTED.md     # Quick start guide
├── Makefile               # Development shortcuts
├── requirements.txt       # Python dependencies
│
├── docker/                # Container configuration
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── docs/                  # Project documentation
│   ├── 00_Project_Charter/    # Goals, scope, metrics
│   ├── 01_Roadmap/            # Phase planning
│   ├── 02_Templates/          # Document templates
│   ├── 03_Source_Policy/      # Citation rules
│   ├── 04_Memory_and_Handoff/ # Project state (read first!)
│   ├── 05_Toolchain_Integrations/
│   └── Phases/                # Phase-specific work
│
├── src/                   # Source code (future)
├── tests/                 # Tests (future)
├── scripts/               # Utility scripts
└── archive/               # Archived materials
```

## What You're Building

1. **Modular backend platform** - Python core with plugins/modules, C for compute-heavy logic
2. **Curated data pipelines** - Metadata, lineage, and periodic snapshots for ML
3. **SME-supervised narrow AI** - Human-in-the-loop orchestration for ML optimization tools

## Key Documents

| Document | Purpose |
|----------|---------|
| [GETTING_STARTED.md](GETTING_STARTED.md) | How to set up and work in this repo |
| [docs/04_Memory_and_Handoff/PROJECT_STATE.md](docs/04_Memory_and_Handoff/PROJECT_STATE.md) | Current phase, sprint, next tasks |
| [docs/04_Memory_and_Handoff/CONTEXT_PACKET.md](docs/04_Memory_and_Handoff/CONTEXT_PACKET.md) | Paste into new AI chats |
| [docs/01_Roadmap/roadmap.md](docs/01_Roadmap/roadmap.md) | Phase overview |

## Quick Commands

```bash
make up        # Start dev environment
make shell     # Enter container
make check     # Run all quality checks
make state     # Show project state
make context   # Copy context to clipboard
make help      # Show all commands
```

## Current Status

- **Phase**: Phase 00 — Foundation Setup
- **Sprint**: Sprint 00.1
- **GitHub**: https://github.com/reh3376/whk_project_atlas
- **Linear**: [Project Atlas Initiative](https://linear.app/whiskey-house-eandt/initiative/project-altas-advanced-software-and-sdlc-mastery-8a90f584ec2b/overview)

---

_Last updated: 2025-12-14_

