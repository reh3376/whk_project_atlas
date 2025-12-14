# Runbook: Development Environment Setup

## Purpose

Set up a reproducible development environment for Project Atlas on a new machine. This runbook supports both Docker-based (recommended) and native Python workflows.

## Preconditions

### Required
- Git installed and configured
- macOS, Linux, or Windows with WSL2
- Internet access for initial dependency download

### For Docker workflow (recommended)
- Docker Desktop installed and running
- At least 4GB RAM available for containers

### For native workflow
- Python 3.12+ installed
- uv package manager installed (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
- C compiler (gcc/clang) for building extensions

## Step-by-step

### Option A: Docker Workflow (Recommended)

#### 1. Clone the repository
```bash
git clone <repository-url> WHK_project_atlas
cd WHK_project_atlas
```

#### 2. Start the development container
```bash
docker-compose up -d
```

Expected output:
```
[+] Running 2/2
 ✔ Volume "atlas-venv"      Created
 ✔ Container atlas-dev      Started
```

#### 3. Enter the development container
```bash
docker-compose exec atlas-dev bash
```

You should now have a shell inside the container at `/app`.

#### 4. Verify the environment
```bash
# Check Python version
python --version
# Expected: Python 3.12.x

# Check installed packages
uv pip list | head -10

# Run linter
ruff check .
```

#### 5. (Optional) Run in background
The container runs in background mode by default. To stop:
```bash
docker-compose down
```

To restart:
```bash
docker-compose up -d
```

---

### Option B: Native Python Workflow

#### 1. Clone the repository
```bash
git clone <repository-url> WHK_project_atlas
cd WHK_project_atlas
```

#### 2. Verify Python version
```bash
python --version
# Must be 3.12 or higher
```

If not installed, use pyenv or your system package manager.

#### 3. Install uv (if not already installed)
```bash
# Check if uv is available
command -v uv || curl -LsSf https://astral.sh/uv/install.sh | sh
```

#### 4. Create virtual environment
```bash
uv venv
```

#### 5. Activate virtual environment

**macOS/Linux:**
```bash
source .venv/bin/activate
```

**Windows (PowerShell):**
```powershell
.venv\Scripts\Activate.ps1
```

#### 6. Install dependencies
```bash
uv pip install -r requirements.txt
```

#### 7. Verify installation
```bash
# Check Python is from venv
which python
# Should show: .../WHK_project_atlas/.venv/bin/python

# Run linter
ruff check .

# Run type checker
mypy .
```

---

## Verification

Run these commands to verify the environment is working correctly:

| Check | Command | Expected Result |
|-------|---------|-----------------|
| Python version | `python --version` | `Python 3.12.x` |
| Virtual env active | `echo $VIRTUAL_ENV` | Path to `.venv` |
| Linter works | `ruff check --version` | Version number |
| Type checker works | `mypy --version` | Version number |
| Tests work | `pytest --version` | Version number |

### Quick validation script
```bash
python -c "
import sys
import pydantic
import structlog
print(f'Python: {sys.version}')
print(f'Pydantic: {pydantic.__version__}')
print(f'Structlog: {structlog.__version__}')
print('Environment OK!')
"
```

## Rollback

### Docker workflow
```bash
# Stop and remove containers
docker-compose down

# Remove volumes (fresh start)
docker-compose down -v

# Rebuild from scratch
docker-compose build --no-cache
docker-compose up -d
```

### Native workflow
```bash
# Remove virtual environment
rm -rf .venv

# Recreate
uv venv
source .venv/bin/activate
uv pip install -r requirements.txt
```

## Troubleshooting

### Issue: Docker build fails with network error
**Cause**: Network connectivity or proxy issues
**Solution**: 
```bash
# Retry with increased timeout
docker-compose build --progress=plain
```

### Issue: "Permission denied" on volume mount
**Cause**: Docker file sharing permissions
**Solution**: Check Docker Desktop settings → Resources → File Sharing

### Issue: uv command not found
**Cause**: uv not in PATH after installation
**Solution**: 
```bash
# Add to shell profile
export PATH="$HOME/.cargo/bin:$PATH"
```

### Issue: Python version mismatch
**Cause**: System Python is older version
**Solution**: Use pyenv to install Python 3.12:
```bash
pyenv install 3.12
pyenv local 3.12
```

### Issue: C extension build fails
**Cause**: Missing C compiler
**Solution**: 
- macOS: `xcode-select --install`
- Ubuntu: `sudo apt-get install build-essential`

## Escalation

If issues persist after following this runbook:

1. Check `OPEN_THREADS.md` for known issues
2. Document the issue with:
   - OS and version
   - Error message (full output)
   - Steps attempted
3. Add to `OPEN_THREADS.md` if new issue

## References

- [Dev Environment Design Doc](dev_environment_design.md)
- [uv Documentation](https://github.com/astral-sh/uv)
- [Docker Compose Reference](https://docs.docker.com/compose/compose-file/)

---

_Last updated: 2025-12-14_

