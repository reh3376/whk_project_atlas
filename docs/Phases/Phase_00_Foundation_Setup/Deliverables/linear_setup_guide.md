# Linear Setup Guide for Project Atlas

_Last updated: 2025-12-14_

This guide walks through setting up Linear for Project Atlas task management.

## Prerequisites

- Linear account (https://linear.app)
- Access to create Teams and Projects in your workspace

## Setup Checklist

### Step 1: Create the ATLAS Team

1. Open Linear
2. Go to **Settings** → **Teams** → **Create Team**
3. Configure:
   - **Name**: `ATLAS`
   - **Identifier**: `ATLAS` (used in issue IDs like ATLAS-123)
   - **Description**: `Project Atlas - Advanced Software & SDLC Mastery`
4. Enable **Cycles**:
   - Team Settings → Cycles → Enable
   - Cycle length: **2 weeks** (matches sprint cadence)
   - Start day: **Monday**
5. (Optional) Enable **Triage** for intake buffer

**After creation, copy the Team URL**: `https://linear.app/<workspace>/team/ATLAS`

---

### Step 2: Create the Initiative

1. Go to **Initiatives** (workspace-level, left sidebar)
2. Click **Create Initiative**
3. Configure:
   - **Name**: `Project Atlas — Advanced Software & SDLC Mastery`
   - **Description**: 
     ```
     Long-term architecture and SDLC mastery program.
     
     Goals:
     - Modular backend platform (Python + C)
     - Curated data pipelines for ML
     - SME-supervised narrow AI orchestration
     
     Repo: [Link to GitHub repo]
     Status: PROJECT_STATE.md
     ```
4. Click **Create**

**After creation, copy the Initiative URL**: `https://linear.app/<workspace>/initiative/<id>`

---

### Step 3: Create Projects (One per Phase)

Create these 6 projects in Linear:

| Project Name | Description | Target Date |
|--------------|-------------|-------------|
| `P00 — Foundation Setup` | Cadence, SDLC baseline, dev environment, templates | Q4 2024 |
| `P01 — Modular Platform Architecture` | Core + module contract, prototypes | Q1 2025 |
| `P02 — SDLC & DevEx Standardization` | CI/CD, testing strategy, release patterns | Q1 2025 |
| `P03 — Data Pipeline & Curated Datasets` | Metadata, lineage, quality checks | Q2 2025 |
| `P04 — MLOps + SME Supervision` | Orchestrator, evaluation harness, audit logs | Q3 2025 |
| `P05 — Reliability / Observability / Security` | SLOs, observability, incident response | Q4 2025 |

For each project:

1. Go to **Projects** in the ATLAS team
2. Click **New Project**
3. Fill in:
   - **Name**: (from table above)
   - **Lead**: Assign yourself
   - **Start date**: Estimated start
   - **Target date**: Estimated completion
   - **Initiative**: Select "Project Atlas — Advanced Software & SDLC Mastery"
4. In the project description, add:
   ```
   Phase documentation: [Link to Phase Start_Here.md]
   Status: [Link to PROJECT_STATE.md]
   ```

**Copy each Project URL** for `PROJECT_STATE.md`

---

### Step 4: Create Milestones (Sprints)

For the current active project (P00), create milestones:

1. Open the Project (P00 — Foundation Setup)
2. Go to **Milestones** tab
3. Create:
   - `Sprint 00.1` - Target: 2025-12-28
   - `Sprint 00.2` - Target: 2026-01-11 (if needed)

Link issues to milestones as you create them.

---

### Step 5: Register Issue Templates

1. Go to **Settings** → **Templates** → **Issue Templates**
2. Create templates based on `05_Toolchain_Integrations/Linear/ISSUE_TEMPLATES.md`:
   - **Atlas Task** (default)
   - **Architecture Decision (ADR)**
   - **Sprint Deliverable**

---

### Step 6: Update PROJECT_STATE.md

After completing setup, update `04_Memory_and_Handoff/PROJECT_STATE.md`:

```markdown
## Linear Links (sync layer)

- Initiative (Project Atlas): https://linear.app/<workspace>/initiative/<id>
- Project (P00 — Foundation Setup): https://linear.app/<workspace>/project/<id>
- Project (P01 — Modular Platform Architecture): https://linear.app/<workspace>/project/<id>
- Project (P02 — SDLC & DevEx Standardization): https://linear.app/<workspace>/project/<id>
- Project (P03 — Data Pipeline & Curated Datasets): https://linear.app/<workspace>/project/<id>
- Project (P04 — MLOps + SME Supervision): https://linear.app/<workspace>/project/<id>
- Project (P05 — Reliability / Observability / Security): https://linear.app/<workspace>/project/<id>
```

---

### Step 7: Create Initial Issues

Create these issues for Sprint 00.1:

| Issue Title | Template | Milestone |
|-------------|----------|-----------|
| Complete baseline self-assessment | Atlas Task | Sprint 00.1 |
| Validate dev environment setup | Atlas Task | Sprint 00.1 |
| ADR: Container-first development | ADR | Sprint 00.1 |
| ADR: Python dependency management with uv | ADR | Sprint 00.1 |
| Sprint 00.1 retro | Atlas Task | Sprint 00.1 |

---

## GitHub Integration (Optional but Recommended)

### Enable the Integration

1. Go to **Settings** → **Integrations** → **GitHub**
2. Connect your GitHub account
3. Select the repository to link

### Workflow

1. Create issue in Linear
2. Copy **branch name** from Linear (e.g., `atlas-123-add-plugin-loader`)
3. Use that branch name in git:
   ```bash
   git checkout -b atlas-123-add-plugin-loader
   ```
4. When PR is created, include issue ID in title:
   ```
   ATLAS-123: Add plugin loader implementation
   ```
5. Linear automatically links and can update status on merge

---

## Operating Rules

### Canonical Sources

| What | Where |
|------|-------|
| Status ("where are we?") | `PROJECT_STATE.md` |
| Execution ("what to do?") | Linear |
| Decisions ("why?") | ADRs + `DECISION_JOURNAL.md` |
| Progress notes | `WORK_LOG.md` |

### Conflict Resolution

If Linear and `PROJECT_STATE.md` disagree:
1. **Update PROJECT_STATE.md first** (it's canonical)
2. Then reconcile Linear to match

### Issue Hygiene

- Update issue status as work progresses
- Add notes to issues with discoveries/blockers
- Close issues only when acceptance criteria are met
- Link related issues and PRs

---

## Quick Reference

### Linear Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `C` | Create new issue |
| `Cmd+K` | Command menu |
| `M` | Assign to me |
| `L` | Set labels |
| `P` | Set project |

### Issue States (Default)

- **Backlog**: Not yet planned
- **Todo**: Planned for current cycle
- **In Progress**: Actively being worked on
- **In Review**: Ready for review
- **Done**: Complete

---

## Verification Checklist

After setup, verify:

- [ ] ATLAS team exists with cycles enabled
- [ ] Initiative created and linked
- [ ] All 6 phase projects created
- [ ] Projects linked to initiative
- [ ] Sprint 00.1 milestone exists in P00
- [ ] Issue templates registered
- [ ] PROJECT_STATE.md updated with Linear links
- [ ] At least one test issue created

---

## References

- [Linear Conceptual Model](https://linear.app/docs/conceptual-model)
- [Linear GitHub Integration](https://linear.app/integrations/github)
- [Project Atlas Linear README](../../../05_Toolchain_Integrations/Linear/README.md)

---

_Created: 2025-12-14_

