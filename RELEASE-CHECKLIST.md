# Public release checklist

The privacy-cleaned candidate and documentation are staged locally. No remote repository or public release has been created.

## Completed

- Separate repository with new history and a neutral project identity.
- Public file allowlist; images excluded from Git history.
- Image privacy cleanup, offline validation, manifest, and checksums.
- Installation notes, hardware status, and privacy report.

## Before publishing the binaries

- Test this exact image pair from a fresh installation on the supported firmware baseline. Record first boot, storage expansion, second boot, display, keyboard, pointer/scroll modes, and intended access setup.
- Assemble the matching source, patches, build instructions, and upstream license notices for the distributed components. This release repository does not yet contain a complete corresponding-source package or reproducible build environment. Upstream components retain their respective licenses; no blanket license is assigned to the combined firmware image.
- Record the tested SP Flash Tool version, Download Agent identity and provenance, and connection sequence. Current installation instructions assume an established working setup.
- Keep the untested hardware and unlocked desktop clearly disclosed.
- Add the actual download URL after publication. Check the chosen host’s current attachment-size limits and document reassembly if the image package must be split.

## Files to distribute

Distribute only the two cleaned images, their scatter, manifest, checksums, flashing notes, guide, status, privacy report, release checklist, and the matching source/license material when assembled. Do not distribute `.git`, private working folders, or unrelated historical builds.

From a directory containing the images and scatter, verify:

```sh
sha256sum -c SHA256SUMS
```

The Git-tracked checksum file covers those three payloads. A checksum match identifies the audited candidate; it does not replace a boot test.
