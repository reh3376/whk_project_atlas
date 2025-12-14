#!/usr/bin/env python3
"""Generate a copy/paste context packet for resuming the project in a new chat.

Usage:
  python scripts/make_context_packet.py

Writes:
  docs/04_Memory_and_Handoff/CONTEXT_PACKET.md

It stitches together:
- a static header (already in the file)
- the current Project State
- a short index of key links

This keeps the "handoff" always up-to-date.
"""

from pathlib import Path

def main():
    repo_root = Path(__file__).resolve().parents[1]
    packet_path = repo_root / "docs" / "04_Memory_and_Handoff" / "CONTEXT_PACKET.md"
    state_path = repo_root / "docs" / "04_Memory_and_Handoff" / "PROJECT_STATE.md"

    packet = packet_path.read_text(encoding="utf-8")
    state = state_path.read_text(encoding="utf-8")

    marker = "## 2) Current state"
    if marker in packet:
        before, after = packet.split(marker, 1)
        # keep everything after the current-state section header, but replace the body
        # Find next header
        next_hdr = after.find("## 3)")
        if next_hdr != -1:
            tail = after[next_hdr:]
        else:
            tail = ""
        new_packet = before + marker + "\n\n" + "### PROJECT_STATE.md\n\n" + state + "\n\n" + tail
    else:
        new_packet = packet + "\n\n" + "### PROJECT_STATE.md\n\n" + state

    packet_path.write_text(new_packet, encoding="utf-8")
    print(f"Updated: {packet_path}")

if __name__ == "__main__":
    main()
