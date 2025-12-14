# Project Atlas Makefile
# Common commands for development workflow
#
# Usage: make <target>
# Run 'make help' to see all available commands

.PHONY: help up down restart shell build rebuild logs status \
        lint format typecheck test test-cov \
        check state log context \
        commit push sync \
        clean clean-all

# Docker compose file location
COMPOSE := docker-compose -f docker/docker-compose.yml

# Default target
.DEFAULT_GOAL := help

# Colors for output
BLUE := \033[34m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
RESET := \033[0m

#==============================================================================
# HELP
#==============================================================================

help: ## Show this help message
	@echo ""
	@echo "$(BLUE)Project Atlas - Development Commands$(RESET)"
	@echo ""
	@echo "$(GREEN)Container Management:$(RESET)"
	@grep -E '^(up|down|restart|shell|build|rebuild|logs|status):.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)Code Quality:$(RESET)"
	@grep -E '^(lint|format|typecheck|test|test-cov|check):.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)Project State:$(RESET)"
	@grep -E '^(state|log|context):.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)Git Workflow:$(RESET)"
	@grep -E '^(commit|push|sync):.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)Cleanup:$(RESET)"
	@grep -E '^(clean|clean-all):.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(RESET) %s\n", $$1, $$2}'
	@echo ""

#==============================================================================
# CONTAINER MANAGEMENT
#==============================================================================

up: ## Start development container in background
	@echo "$(GREEN)Starting development container...$(RESET)"
	$(COMPOSE) up -d
	@echo "$(GREEN)Container started. Run 'make shell' to enter.$(RESET)"

down: ## Stop development container
	@echo "$(YELLOW)Stopping development container...$(RESET)"
	$(COMPOSE) down

restart: ## Restart development container
	@echo "$(YELLOW)Restarting development container...$(RESET)"
	$(COMPOSE) restart

shell: ## Enter development container shell
	@echo "$(GREEN)Entering container shell...$(RESET)"
	$(COMPOSE) exec atlas-dev bash

build: ## Build development container
	@echo "$(GREEN)Building development container...$(RESET)"
	$(COMPOSE) build

rebuild: ## Rebuild container from scratch (no cache)
	@echo "$(YELLOW)Rebuilding container from scratch...$(RESET)"
	$(COMPOSE) down -v
	$(COMPOSE) build --no-cache
	$(COMPOSE) up -d
	@echo "$(GREEN)Container rebuilt and started.$(RESET)"

logs: ## Follow container logs
	$(COMPOSE) logs -f atlas-dev

status: ## Show container status
	@echo "$(BLUE)Container Status:$(RESET)"
	@$(COMPOSE) ps
	@echo ""
	@echo "$(BLUE)Health Check:$(RESET)"
	@$(COMPOSE) exec atlas-dev python --version 2>/dev/null || echo "$(RED)Container not running$(RESET)"

#==============================================================================
# CODE QUALITY (runs inside container)
#==============================================================================

lint: ## Run linter (ruff check)
	@echo "$(GREEN)Running linter...$(RESET)"
	$(COMPOSE) exec atlas-dev ruff check .

format: ## Format code (ruff format)
	@echo "$(GREEN)Formatting code...$(RESET)"
	$(COMPOSE) exec atlas-dev ruff format .

typecheck: ## Run type checker (mypy)
	@echo "$(GREEN)Running type checker...$(RESET)"
	$(COMPOSE) exec atlas-dev mypy .

test: ## Run tests
	@echo "$(GREEN)Running tests...$(RESET)"
	$(COMPOSE) exec atlas-dev pytest

test-cov: ## Run tests with coverage
	@echo "$(GREEN)Running tests with coverage...$(RESET)"
	$(COMPOSE) exec atlas-dev pytest --cov

check: ## Run all checks (lint + typecheck + test)
	@echo "$(GREEN)Running all checks...$(RESET)"
	@echo ""
	@echo "$(BLUE)=== Linting ===$(RESET)"
	$(COMPOSE) exec atlas-dev ruff check . || true
	@echo ""
	@echo "$(BLUE)=== Type Checking ===$(RESET)"
	$(COMPOSE) exec atlas-dev mypy . || true
	@echo ""
	@echo "$(BLUE)=== Tests ===$(RESET)"
	$(COMPOSE) exec atlas-dev pytest || true
	@echo ""
	@echo "$(GREEN)All checks complete.$(RESET)"

#==============================================================================
# PROJECT STATE
#==============================================================================

state: ## Show current project state
	@echo "$(BLUE)═══════════════════════════════════════════════════════════$(RESET)"
	@echo "$(BLUE)                    PROJECT STATE$(RESET)"
	@echo "$(BLUE)═══════════════════════════════════════════════════════════$(RESET)"
	@cat docs/04_Memory_and_Handoff/PROJECT_STATE.md | head -50
	@echo ""
	@echo "$(YELLOW)... (truncated, see full file for more)$(RESET)"

log: ## Show recent work log entries
	@echo "$(BLUE)═══════════════════════════════════════════════════════════$(RESET)"
	@echo "$(BLUE)                    RECENT WORK LOG$(RESET)"
	@echo "$(BLUE)═══════════════════════════════════════════════════════════$(RESET)"
	@cat docs/04_Memory_and_Handoff/WORK_LOG.md | head -60
	@echo ""
	@echo "$(YELLOW)... (truncated, see full file for more)$(RESET)"

context: ## Copy context packet to clipboard (macOS)
	@echo "$(GREEN)Copying CONTEXT_PACKET.md to clipboard...$(RESET)"
	@cat docs/04_Memory_and_Handoff/CONTEXT_PACKET.md | pbcopy
	@echo "$(GREEN)Done! Paste into new AI chat to restore context.$(RESET)"

#==============================================================================
# GIT WORKFLOW
#==============================================================================

commit: ## Interactive git add and commit
	@echo "$(BLUE)Staged files:$(RESET)"
	@git status --short
	@echo ""
	@read -p "Commit message (type: description): " msg; \
	git add -A && git commit -m "$$msg"
	@echo "$(GREEN)Committed. Run 'make push' to push to remote.$(RESET)"

push: ## Push to remote
	@echo "$(GREEN)Pushing to remote...$(RESET)"
	git push

sync: ## Pull latest, commit all changes, and push
	@echo "$(GREEN)Syncing with remote...$(RESET)"
	git pull origin main
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "$(YELLOW)Uncommitted changes found. Committing...$(RESET)"; \
		git add -A; \
		git commit -m "chore: Sync changes"; \
	fi
	git push
	@echo "$(GREEN)Sync complete.$(RESET)"

#==============================================================================
# CLEANUP
#==============================================================================

clean: ## Clean Python cache files
	@echo "$(YELLOW)Cleaning Python cache files...$(RESET)"
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete 2>/dev/null || true
	find . -type f -name "*.pyo" -delete 2>/dev/null || true
	find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".mypy_cache" -exec rm -rf {} + 2>/dev/null || true
	find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null || true
	@echo "$(GREEN)Clean complete.$(RESET)"

clean-all: clean ## Clean everything including Docker volumes
	@echo "$(RED)Stopping containers and removing volumes...$(RESET)"
	$(COMPOSE) down -v
	@echo "$(GREEN)Full cleanup complete.$(RESET)"

#==============================================================================
# QUICK ALIASES (shortest possible)
#==============================================================================

# Shortest aliases
u: up          ## Alias for 'up'
d: down        ## Alias for 'down'
s: shell       ## Alias for 'shell'
l: lint        ## Alias for 'lint'
t: test        ## Alias for 'test'
c: check       ## Alias for 'check'
st: state      ## Alias for 'state'

