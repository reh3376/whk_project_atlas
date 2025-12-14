#!/usr/bin/env python3
"""Check Markdown relative links for obvious breakage.

This is intentionally simple: it catches the common "moved file" problems.

Usage:
  python scripts/link_check.py
"""

import re
from pathlib import Path

MD_LINK_RE = re.compile(r"\]\(([^)]+)\)")

def main():
    repo_root = Path(__file__).resolve().parents[1]
    broken = []

    for md in repo_root.rglob("*.md"):
        text = md.read_text(encoding="utf-8", errors="ignore")
        for target in MD_LINK_RE.findall(text):
            if target.startswith("http://") or target.startswith("https://") or target.startswith("#"):
                continue
            # ignore mailto and other schemes
            if ":" in target.split("/")[0]:
                continue
            resolved = (md.parent / target).resolve()
            if not resolved.exists():
                broken.append((md, target))

    if broken:
        print("Broken links:")
        for md, target in broken:
            print(f"- {md.relative_to(repo_root)} -> {target}")
        raise SystemExit(1)

    print("No broken relative markdown links found.")

if __name__ == "__main__":
    main()
