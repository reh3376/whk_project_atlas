# Project Atlas Development Container
# Build: docker build -t atlas-dev .
# Run: docker-compose up (preferred)

FROM python:3.12-slim-bookworm

LABEL maintainer="Project Atlas"
LABEL description="Development environment for Project Atlas"

# Prevent Python from writing pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    # C toolchain for building extensions
    build-essential \
    gcc \
    make \
    # Git for version control operations
    git \
    # curl for health checks and downloads
    curl \
    # Clean up apt cache
    && rm -rf /var/lib/apt/lists/*

# Install uv (fast Python package installer)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.cargo/bin:$PATH"

# Copy dependency files first (for layer caching)
COPY requirements.txt .
COPY .python-version .

# Create virtual environment and install dependencies
RUN uv venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
ENV VIRTUAL_ENV="/app/.venv"

RUN uv pip install -r requirements.txt

# Copy the rest of the application
# In development, this is overridden by volume mount
COPY . .

# Default command: open a shell
CMD ["/bin/bash"]

