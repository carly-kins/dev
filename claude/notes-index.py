#!/usr/bin/env python3
"""Regenerate notes/index.html — a findable, grouped table of contents for the
project's out-of-repo notes dir. No renaming; pure links. Re-run any time:

    python3 ~/.claude/notes-index.py "$(pwd)"
"""
import sys, os, re, html, datetime

def notes_dir(cwd):
    san = re.sub(r'[^A-Za-z0-9]', '-', cwd)
    return os.path.expanduser(f'~/.claude/projects/{san}/notes')

# filename keyword -> (group label, sort order)
GROUPS = [
    ('parking-lot', 'Parking lot'),
    ('dashboard',   'Dashboards'),
    ('plan',        'Plans'),
    ('reviewplan',  'Plans'),          # retired type, folded into Plans
    ('spec',        'Specs'),
    ('proposal',    'Proposals'),
    ('example',     'Reference & examples'),
    ('comparison',  'Reference & examples'),
    ('overview',    'Share & process'),
    ('standardization', 'Share & process'),
    ('code-review', 'Reviews'),
    ('pipeline',    'Reference & examples'),
]
ORDER = ['Parking lot', 'Dashboards', 'Plans', 'Specs', 'Proposals',
         'Share & process', 'Reviews', 'Reference & examples', 'Other']

def classify(name):
    low = name.lower()
    for kw, label in GROUPS:
        if kw in low:
            return label
    return 'Other'

def pretty(name):
    base = re.sub(r'\.(html|md)$', '', name)
    base = re.sub(r'^\d{4}-\d{2}-\d{2}-', '', base)          # strip date prefix
    for kw, _ in GROUPS:
        base = re.sub(rf'\b{kw}\b[-_]?', '', base, flags=re.I)  # strip type word
    base = base.replace('-', ' ').replace('_', ' ').strip()
    return base or name

def file_date(path, name):
    m = re.match(r'(\d{4})-(\d{2})-(\d{2})', name)
    if m:
        return f'{m.group(1)}-{m.group(2)}-{m.group(3)}'
    return datetime.date.fromtimestamp(os.path.getmtime(path)).isoformat()

def main():
    cwd = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    nd = notes_dir(cwd)
    if not os.path.isdir(nd):
        print(f'no notes dir at {nd}'); return
    files = [f for f in os.listdir(nd)
             if (f.endswith('.html') or f.endswith('.md')) and f != 'index.html']
    # Group a .md + .html of the same base name onto one entry (source + reading copy).
    pairs = {}
    for f in files:
        base = re.sub(r'\.(html|md)$', '', f)
        ext = 'html' if f.endswith('.html') else 'md'
        pairs.setdefault(base, {})[ext] = f
    buckets = {}
    for base, fmts in pairs.items():
        anyfile = fmts.get('html') or fmts.get('md')
        p = os.path.join(nd, anyfile)
        buckets.setdefault(classify(base), []).append((file_date(p, base), base, fmts))
    today = datetime.date.today().isoformat()
    total = len(files)

    parts = ['''<!DOCTYPE html><html lang="en"><head><meta charset="utf-8">
<title>Notes index</title>
<link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>%F0%9F%93%93</text></svg>">
<style>
 :root{--ink:#1c2238;--muted:#5b6577;--line:#e3e7ef;--brand:#2f3f7a;--bg:#f6f7fb;}
 body{font-family:-apple-system,sans-serif;max-width:820px;margin:2rem auto;padding:0 1.2rem;color:var(--ink);background:var(--bg);}
 h1{font-size:1.4rem;margin:0 0 .2rem;} .sub{color:var(--muted);font-size:.85rem;margin:0 0 1.6rem;}
 h2{font-size:.82rem;text-transform:uppercase;letter-spacing:.06em;color:var(--brand);margin:1.6rem 0 .5rem;border-bottom:1px solid var(--line);padding-bottom:.25rem;}
 ul{list-style:none;margin:0;padding:0;} li{display:flex;align-items:baseline;gap:.6rem;padding:.32rem .5rem;border-radius:6px;}
 li:hover{background:#fff;} a{color:var(--brand);text-decoration:none;font-weight:600;font-size:.98rem;} a:hover{text-decoration:underline;}
 .date{color:var(--muted);font-size:.8rem;font-variant-numeric:tabular-nums;min-width:5.2rem;}
 .fmts{margin-left:.5rem;} .fmt{font-size:.72rem;font-weight:600;color:var(--muted);border:1px solid var(--line);border-radius:4px;padding:.02rem .3rem;text-decoration:none;} .fmt:hover{background:#fff;color:var(--brand);}
</style></head><body>''']
    parts.append(f'<h1>📓 Notes index</h1><p class="sub">{total} files · regenerated {today} · <code>python3 ~/.claude/notes-index.py "$(pwd)"</code> to refresh</p>')

    for label in ORDER:
        items = buckets.get(label)
        if not items:
            continue
        items.sort(reverse=True)  # newest first
        parts.append(f'<h2>{html.escape(label)}</h2><ul>')
        for date, base, fmts in items:
            # primary link = the reading copy (html) if present, else the md
            primary = fmts.get('html') or fmts.get('md')
            links = [f'<a href="{html.escape(primary)}" target="_blank" rel="noopener">{html.escape(pretty(base))}</a>']
            # secondary format links on the same line
            fmt_links = []
            if fmts.get('html'):
                fmt_links.append(f'<a class="fmt" href="{html.escape(fmts["html"])}" target="_blank" rel="noopener">html</a>')
            if fmts.get('md'):
                fmt_links.append(f'<a class="fmt" href="{html.escape(fmts["md"])}" target="_blank" rel="noopener">md</a>')
            badge = f'<span class="fmts">{" · ".join(fmt_links)}</span>' if len(fmt_links) > 1 else ''
            parts.append(f'<li><span class="date">{date}</span>{"".join(links)}{badge}</li>')
        parts.append('</ul>')
    parts.append('</body></html>')

    out = os.path.join(nd, 'index.html')
    with open(out, 'w') as fh:
        fh.write('\n'.join(parts))
    print(f'wrote {out} ({len(files)} files)')

if __name__ == '__main__':
    main()
