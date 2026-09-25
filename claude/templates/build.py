#!/usr/bin/env python3
"""Inline theme.css into plan-doc.html / session-dashboard.html between their
BEGIN/END SHARED THEME markers. Run after editing theme.css:

    python3 ~/dev/claude/templates/build.py

The templates stay single, self-contained HTML files (no <link> to theme.css) so
they're still safe to copy elsewhere or hand to someone else — theme.css is a build
input only, never referenced at runtime.
"""
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
THEME = HERE / "theme.css"
TARGETS = ["session-dashboard.html", "plan-doc.html"]

BEGIN = "/* ==== BEGIN SHARED THEME (generated from theme.css by build.py — do not hand-edit; edit theme.css and re-run) ==== */"
END = "/* ==== END SHARED THEME ==== */"


def main():
    theme_css = THEME.read_text()
    # Drop theme.css's own leading comment block (the templates carry their own marker instead).
    theme_body = re.sub(r"^/\*.*?\*/\n\n?", "", theme_css, count=1, flags=re.S)

    pattern = re.compile(
        re.escape(BEGIN) + r".*?" + re.escape(END), re.S
    )
    replacement = BEGIN + "\n" + theme_body.rstrip("\n") + "\n" + END

    changed = []
    for name in TARGETS:
        path = HERE / name
        text = path.read_text()
        if BEGIN not in text or END not in text:
            print(f"skip {name}: no BEGIN/END SHARED THEME markers found", file=sys.stderr)
            continue
        new_text, n = pattern.subn(replacement, text)
        if n != 1:
            print(f"skip {name}: expected exactly 1 marker block, found {n}", file=sys.stderr)
            continue
        if new_text != text:
            path.write_text(new_text)
            changed.append(name)

    if changed:
        print(f"updated: {', '.join(changed)}")
    else:
        print("up to date — no changes")


if __name__ == "__main__":
    main()
