# Project Atlas

A long-term, phase-based framework for building **advanced software solutions** and the **SDLC machinery** required to ship them reliably.

This repository is designed to be:
- **Obsidian-friendly** (Markdown-first, cross-linked).
- **GitHub-friendly** (text-based diagrams via Mermaid; decisions captured as ADRs).
- **Zip-friendly** (each phase can be packaged into a standalone `.zip`).

## What you're building

1. **A modular backend platform** (core + modules/plugins) in Python, with computationally intensive logic in C (optionally via Cython bindings).
2. **A data pipeline system** to connect to existing sources, add context metadata, and produce **curated datasets** at time intervals for ML training/inference.
3. **SME-supervised narrow AI** to orchestrate ML-heavy process optimization tools (human-in-the-loop, auditability, evaluation harnesses).

Primary output mode: **Architectural leadership**, supported by implementation skill and org-level SDLC practices.

## How to work this repo

- Start with: `04_Memory_and_Handoff/START_HERE_RESUME.md`
- Then execute phases in `Phases/` (Phase 00 first).

Each phase contains:
- `Start_Here.md` — what the phase is, why it matters, and the outputs.
- `Sprints/` — sprint briefs and work items.
- `Deliverables/` — final artifacts intended for re-use.
- `References/` — reading queue, citation index.

## Long-term continuity (critical)

Chat assistants do *not* reliably persist full context across time, chats, or tools.

To make this project resumable after weeks/months:
- Maintain `04_Memory_and_Handoff/PROJECT_STATE.md` as the **single source of truth** for “where we are”.
- Maintain `04_Memory_and_Handoff/DECISION_JOURNAL.md` for “why we did it this way”.
- Generate `04_Memory_and_Handoff/CONTEXT_PACKET.md` using `Tools/make_context_packet.py` and paste it into a new chat to resume quickly.
- Use `04_Memory_and_Handoff/AI_PROMPT.md` as your standard “kickoff prompt” for any new assistant/session.

> Rule of thumb: if it matters in 3 months, it belongs in a file, not in a chat.


## Toolchain integrations

- Linear + GitHub workflow notes live in `05_Toolchain_Integrations/`.
- Canonical status lives in `04_Memory_and_Handoff/PROJECT_STATE.md` (keep its Linear links current).

## Source policy (truth firewall)

See `03_Source_Policy/source_tiers.md` and `03_Source_Policy/citation_rules.md`.

Default rule: prefer **peer-reviewed** sources. Standards/specifications are allowed but labeled. Blogs are allowed only with an explicit **non-peer-reviewed** warning.

## Build a phase zip

Run:

```bash
python Tools/build_phase_zip.py Phases/Phase_00_Foundation_Setup
```

This creates a standalone zip under `dist/`.

---

_Last updated: 2025-12-14_
