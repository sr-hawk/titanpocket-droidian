#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
"""Register the two original tour paths in the Pocket native installer bundle.

Run after merging release-profile/overlay into a staged root, before packaging.
"""
from pathlib import Path
import hashlib
import shutil
import sys

def stage(root):
    root = Path(root)
    native = root / 'usr/lib/titan-pocket/native'
    manifest = native / 'FILES'
    records = manifest.read_text()
    for line in (root / 'usr/lib/titan-pocket/tour-diversions/FILES').read_text().splitlines():
        mode, target = line.split()
        assert target in ('/usr/bin/phosh-tour', '/usr/share/applications/mobi.phosh.PhoshTour.desktop')
        source = root / target.lstrip('/')
        dest = native / target.lstrip('/')
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, dest)
        dest.chmod(int(mode, 8))
        if line + '\n' not in records:
            records += line + '\n'
    manifest.write_text(records)
    checksums = []
    for f in sorted(native.rglob('*')):
        if f.is_file() and not f.is_symlink() and f.name != 'SHA256SUMS':
            checksums.append(hashlib.sha256(f.read_bytes()).hexdigest() + '  ' + str(f.relative_to(native)))
    (native / 'SHA256SUMS').write_text('\n'.join(checksums) + '\n')

if __name__ == '__main__':
    stage(sys.argv[1])
