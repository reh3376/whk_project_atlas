#!/usr/bin/env python3
"""Lightweight citation linting helper (optional).

This does NOT verify correctness of citations.
It simply flags Markdown docs that contain:
- strong claims without any 'References' section
- references to 'blog'/'medium' without a warning label

Usage:
  python Tools/citation_lint.py
"""

from pathlib import Path

def main():
    repo_root = Path(__file__).resolve().parents[1]
    issues = []

    for md in repo_root.rglob("*.md"):
        text = md.read_text(encoding="utf-8", errors="ignore").lower()

        if "references" not in text and "doi" not in text and "http" not in text:
            # Only flag deliverable-like docs
            if "design" in md.name.lower() or "adr" in md.name.lower():
                issues.append((md, "No obvious references/doi/links found"))

        if "medium.com" in text or "blog" in text:
            if "warning: non-peer-reviewed" not in text:
                issues.append((md, "Mentions blogs but missing explicit non-peer-reviewed warning"))

    if issues:
        print("Citation lint issues:")
        for md, msg in issues:
            print(f"- {md.relative_to(repo_root)}: {msg}")
        raise SystemExit(1)

    print("No citation lint issues found.")

if __name__ == "__main__":
    main()
