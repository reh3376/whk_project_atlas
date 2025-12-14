# Getting Started with Project Atlas

_Last updated: 2025-12-14_

This guide will help you get up and running with Project Atlas development.

---

## Table of Contents

1. [Quick Start (5 minutes)](#quick-start-5-minutes)
2. [Development Environment](#development-environment)
3. [Project Structure](#project-structure)
4. [Daily Workflow](#daily-workflow)
5. [Terminal Command Reference](#terminal-command-reference)
6. [Working with Documentation](#working-with-documentation)
7. [Git Workflow](#git-workflow)
8. [Linear Integration](#linear-integration)
9. [Resuming After a Break](#resuming-after-a-break)

---

## Quick Start (5 minutes)

### Prerequisites

- Docker Desktop installed and running
- Git configured
- Terminal access

### 1. Clone and Enter the Project

```bash
cd /Users/reh3376/WHK_project_atlas
```

### 2. Start the Development Environment

```bash
docker-compose up -d
```

### 3. Enter the Container

```bash
docker-compose exec atlas-dev bash
```

You're now inside the development container with Python 3.12 and all tools ready.

### 4. Verify Everything Works

```bash
python --version    # Should show Python 3.12.x
ruff --version      # Should show ruff version
pytest --version    # Should show pytest version
```

### 5. Exit When Done

```bash
exit                    # Exit container
docker-compose down     # Stop container (optional)
```

---

## Development Environment

### Container Overview

| Component | Description |
|-----------|-------------|
| **Base Image** | Python 3.12 (Debian Bookworm slim) |
| **Package Manager** | uv (fast Python package installer) |
| **Linter** | ruff |
| **Type Checker** | mypy |
| **Testing** | pytest |
| **C Toolchain** | gcc, make (for building extensions) |

### Starting the Environment

```bash
# Start container in background
docker-compose up -d

# Check container status
docker-compose ps

# View container logs
docker-compose logs -f atlas-dev
```

### Entering the Container

```bash
# Interactive bash shell
docker-compose exec atlas-dev bash

# Run a single command
docker-compose exec atlas-dev python --version
docker-compose exec atlas-dev ruff check .
```

### Stopping the Environment

```bash
# Stop container (keeps volumes)
docker-compose down

# Stop and remove volumes (fresh start)
docker-compose down -v

# Rebuild after Dockerfile changes
docker-compose build --no-cache
docker-compose up -d
```

### Native Python Alternative (No Docker)

If Docker is unavailable:

```bash
# Install uv if needed
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create virtual environment
uv venv

# Activate
source .venv/bin/activate   # macOS/Linux
.venv\Scripts\activate      # Windows

# Install dependencies
uv pip install -r requirements.txt

# Verify
python --version
ruff check .
```

---

## Project Structure

```
WHK_project_atlas/
├── .python-version          # Python version specification
├── Dockerfile               # Dev container definition
├── docker-compose.yml       # Container orchestration
├── requirements.txt         # Python dependencies
├── GETTING_STARTED.md       # This file
│
└── Project_Atlas/           # Main documentation and framework
    ├── README.md            # Project overview
    │
    ├── 00_Project_Charter/  # Goals, scope, success metrics
    │   ├── baseline_assessment.md  # Your skill ratings
    │   ├── goals.md
    │   ├── scope.md
    │   └── success_metrics.md
    │
    ├── 01_Roadmap/          # Phase planning
    │   ├── roadmap.md       # Phase overview
    │   ├── phase_map.md     # Deliverables per phase
    │   └── dependency_graph.md
    │
    ├── 02_Templates/        # Reusable document templates
    │   ├── adr_template.md
    │   ├── design_doc_template.md
    │   ├── sprint_brief.md
    │   └── ...
    │
    ├── 03_Source_Policy/    # Citation and evidence rules
    │   ├── source_tiers.md
    │   └── citation_rules.md
    │
    ├── 04_Memory_and_Handoff/  # ⭐ KEY: Project state tracking
    │   ├── PROJECT_STATE.md    # Where are we? (read first!)
    │   ├── CONTEXT_PACKET.md   # Paste into new AI chats
    │   ├── WORK_LOG.md         # Daily progress notes
    │   ├── DECISION_JOURNAL.md # Why we decided things
    │   ├── OPEN_THREADS.md     # Unresolved questions
    │   └── START_HERE_RESUME.md
    │
    ├── 05_Toolchain_Integrations/
    │   ├── Linear/          # Task tracking setup
    │   └── GitHub/          # PR templates
    │
    └── Phases/              # Phase-specific work
        ├── Phase_00_Foundation_Setup/
        │   ├── Start_Here.md
        │   ├── Deliverables/   # Output artifacts
        │   ├── Sprints/        # Sprint briefs
        │   └── References/     # Reading materials
        │
        ├── Phase_01_Modular_Platform_Architecture/
        ├── Phase_02_SDLC_DevEx_Standardization/
        ├── Phase_03_Data_Pipelines_Curation/
        ├── Phase_04_MLOps_SME_Supervision/
        └── Phase_05_Reliability_Observability_Security/
```

### Key Files to Know

| File | Purpose | When to Use |
|------|---------|-------------|
| `PROJECT_STATE.md` | Current phase, sprint, next tasks | Check daily |
| `CONTEXT_PACKET.md` | AI chat context restoration | Paste into new AI sessions |
| `WORK_LOG.md` | Progress journal | Update daily/weekly |
| `baseline_assessment.md` | Your skill ratings | Review quarterly |

---

## Daily Workflow

### Morning Routine

1. **Check current state**
   ```bash
   cat Project_Atlas/04_Memory_and_Handoff/PROJECT_STATE.md
   ```

2. **Start dev environment**
   ```bash
   docker-compose up -d
   docker-compose exec atlas-dev bash
   ```

3. **Pull latest changes** (if applicable)
   ```bash
   git pull origin main
   ```

### During Development

4. **Work inside the container**
   ```bash
   # Run linter
   ruff check .
   
   # Run type checker
   mypy .
   
   # Run tests
   pytest tests/
   ```

5. **Track progress**
   - Update Linear issues as you work
   - Add notes to `WORK_LOG.md`

### End of Session

6. **Commit your work**
   ```bash
   git add -A
   git commit -m "feat: Description of what you did"
   git push
   ```

7. **Update PROJECT_STATE.md**
   - What was completed
   - Next 3 tasks

8. **Stop container** (optional)
   ```bash
   exit
   docker-compose down
   ```

---

## Terminal Command Reference

### Docker Commands

```bash
# === CONTAINER LIFECYCLE ===
docker-compose up -d              # Start in background
docker-compose down               # Stop containers
docker-compose down -v            # Stop and remove volumes
docker-compose restart            # Restart containers
docker-compose ps                 # List running containers
docker-compose logs -f atlas-dev  # Follow container logs

# === ENTERING CONTAINER ===
docker-compose exec atlas-dev bash           # Interactive shell
docker-compose exec atlas-dev python         # Python REPL
docker-compose exec atlas-dev <command>      # Run single command

# === BUILDING ===
docker-compose build              # Build images
docker-compose build --no-cache   # Rebuild from scratch
```

### Python Development (Inside Container)

```bash
# === LINTING & FORMATTING ===
ruff check .                 # Check for linting errors
ruff check --fix .           # Auto-fix linting errors
ruff format .                # Format code

# === TYPE CHECKING ===
mypy .                       # Run type checker
mypy src/                    # Check specific directory

# === TESTING ===
pytest                       # Run all tests
pytest tests/unit/           # Run specific directory
pytest -v                    # Verbose output
pytest --cov                 # With coverage report
pytest -k "test_name"        # Run specific test

# === DEPENDENCY MANAGEMENT ===
uv pip install <package>     # Install a package
uv pip install -r requirements.txt  # Install all deps
uv pip list                  # List installed packages
uv pip freeze                # Output requirements format
```

### Git Commands

```bash
# === BASIC WORKFLOW ===
git status                   # Check what's changed
git add -A                   # Stage all changes
git commit -m "message"      # Commit with message
git push                     # Push to remote

# === BRANCHING ===
git checkout -b feature/name # Create and switch to branch
git checkout main            # Switch to main
git merge feature/name       # Merge branch into current

# === HISTORY ===
git log --oneline -10        # Last 10 commits
git diff                     # Show unstaged changes
git diff --staged            # Show staged changes
```

### Navigation

```bash
# === PROJECT PATHS ===
cd /Users/reh3376/WHK_project_atlas                    # Project root
cd Project_Atlas                                        # Documentation
cd Project_Atlas/04_Memory_and_Handoff                  # State tracking
cd Project_Atlas/Phases/Phase_00_Foundation_Setup       # Current phase

# === USEFUL SHORTCUTS ===
cat PROJECT_STATE.md         # View current state
head -50 WORK_LOG.md         # View recent log entries
grep -r "TODO" .             # Find TODOs in files
```

---

## Working with Documentation

### Creating New Documents

1. **Use templates** from `02_Templates/`
   ```bash
   cp Project_Atlas/02_Templates/design_doc_template.md \
      Project_Atlas/Phases/Phase_00_Foundation_Setup/Deliverables/my_design.md
   ```

2. **Fill in the template** with your content

3. **Link it** in the phase's `Deliverables/README.md`

### ADR (Architecture Decision Record)

When you make an architectural decision:

1. Copy the ADR template:
   ```bash
   cp Project_Atlas/02_Templates/adr_template.md \
      Project_Atlas/Phases/Phase_00_Foundation_Setup/Deliverables/ADR-001-decision-name.md
   ```

2. Fill in:
   - Context (why this decision needed)
   - Decision (what you decided)
   - Alternatives (what else you considered)
   - Consequences (good and bad)

3. Add to `DECISION_JOURNAL.md`

### Updating Project State

After completing work:

```markdown
## What was completed since last update
- [Add what you did]

## Next 3 tasks (do these next)
1. [Most important]
2. [Second priority]
3. [Third priority]
```

---

## Git Workflow

### Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <short description>

[optional body]
```

Types:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation only
- `refactor:` - Code restructuring
- `test:` - Adding tests
- `chore:` - Build, config, tooling

Examples:
```bash
git commit -m "feat: Add plugin loader implementation"
git commit -m "fix: Correct uv binary path in Dockerfile"
git commit -m "docs: Complete baseline self-assessment"
```

### Branch Strategy (GitHub Flow)

```bash
# Create feature branch
git checkout -b feature/ATLAS-123-add-plugin-loader

# Work and commit
git add -A
git commit -m "feat: Add plugin loader"

# Push branch
git push -u origin feature/ATLAS-123-add-plugin-loader

# After PR approval, merge and clean up
git checkout main
git pull
git branch -d feature/ATLAS-123-add-plugin-loader
```

---

## Linear Integration

### Quick Access Links

- **Initiative**: [Project Atlas](https://linear.app/whiskey-house-eandt/initiative/project-altas-advanced-software-and-sdlc-mastery-8a90f584ec2b/overview)
- **P00 Project**: [Foundation Setup](https://linear.app/whiskey-house-eandt/project/p00-foundation-setup-906714c1a5d9/overview)

### Creating Issues

1. Press `Cmd + K` in Linear
2. Type "Create issue"
3. Select ATLAS team
4. Link to the appropriate project (P00-P05)

### Syncing with Git

Include Linear issue ID in branch names and commits:
```bash
git checkout -b atlas-123-add-feature
git commit -m "ATLAS-123: Add feature implementation"
```

---

## Resuming After a Break

When returning to the project after days/weeks:

### 1. Read PROJECT_STATE.md
```bash
cat Project_Atlas/04_Memory_and_Handoff/PROJECT_STATE.md
```

### 2. Review WORK_LOG.md
```bash
head -100 Project_Atlas/04_Memory_and_Handoff/WORK_LOG.md
```

### 3. Check Linear
Open the current phase project to see in-progress issues.

### 4. For AI Sessions

Copy `CONTEXT_PACKET.md` content and paste into new AI chat:
```bash
cat Project_Atlas/04_Memory_and_Handoff/CONTEXT_PACKET.md | pbcopy
```
(This copies to clipboard on macOS)

### 5. Start Development
```bash
docker-compose up -d
docker-compose exec atlas-dev bash
```

---

## Troubleshooting

### Docker Won't Start

```bash
# Check if Docker Desktop is running
docker ps

# If not, open Docker Desktop app, then:
docker-compose up -d
```

### Container Build Fails

```bash
# Rebuild from scratch
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d
```

### Permission Issues

```bash
# If files have wrong permissions
sudo chown -R $(whoami) .
```

### Python Package Not Found

```bash
# Inside container
uv pip install -r requirements.txt
```

---

## Quick Reference Card

```
╔════════════════════════════════════════════════════════════════╗
║                    PROJECT ATLAS QUICK REFERENCE               ║
╠════════════════════════════════════════════════════════════════╣
║ START DEV ENV:     docker-compose up -d                        ║
║ ENTER CONTAINER:   docker-compose exec atlas-dev bash          ║
║ STOP ENV:          docker-compose down                         ║
║                                                                ║
║ RUN LINTER:        ruff check .                                ║
║ RUN TESTS:         pytest                                      ║
║ TYPE CHECK:        mypy .                                      ║
║                                                                ║
║ CHECK STATE:       cat Project_Atlas/04_Memory_and_Handoff/    ║
║                    PROJECT_STATE.md                            ║
║                                                                ║
║ COMMIT:            git add -A && git commit -m "type: message" ║
║ PUSH:              git push                                    ║
║                                                                ║
║ LINEAR:            Cmd+K → Create issue                        ║
╚════════════════════════════════════════════════════════════════╝
```

---

_For detailed phase documentation, see `Project_Atlas/Phases/Phase_XX/Start_Here.md`_

