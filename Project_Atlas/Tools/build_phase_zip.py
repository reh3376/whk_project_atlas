#!/usr/bin/env python3
"""Build a standalone zip for a given phase folder.

Usage:
  python Tools/build_phase_zip.py Phases/Phase_00_Foundation_Setup

The zip will be written to:
  dist/<Phase_Folder_Name>.zip
"""

import os
import sys
import zipfile
from pathlib import Path

def main():
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(1)

    phase_path = Path(sys.argv[1]).resolve()
    if not phase_path.exists() or not phase_path.is_dir():
        raise SystemExit(f"Phase path not found or not a directory: {phase_path}")

    repo_root = Path(__file__).resolve().parents[1]
    dist = repo_root / "dist"
    dist.mkdir(exist_ok=True)

    zip_path = dist / f"{phase_path.name}.zip"

    # Include the phase + shared templates + source policy + memory/handoff + roadmap
    include_paths = [
        phase_path,
        repo_root / "02_Templates",
        repo_root / "03_Source_Policy",
        repo_root / "04_Memory_and_Handoff",
        repo_root / "01_Roadmap",
        repo_root / "00_Project_Charter",
        repo_root / "README.md",
    ]

    def add_path(zf, path):
        if path.is_file():
            arc = path.relative_to(repo_root)
            zf.write(path, arcname=str(arc))
        else:
            for p in path.rglob("*"):
                if p.is_file():
                    arc = p.relative_to(repo_root)
                    zf.write(p, arcname=str(arc))

    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
        for p in include_paths:
            if p.exists():
                add_path(zf, p)

    print(f"Wrote: {zip_path}")

if __name__ == "__main__":
    main()
