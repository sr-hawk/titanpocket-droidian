# Before publishing

The updated `titan-pocket-current-02` candidate is staged locally. Nothing has been uploaded.

## Completed

- Current custom functionality compared with installed system files on the development phone.
- Updated payloads assembled into a clean image; missing tilt executable and installer manifest fixed.
- Dependency-presence audit, installer preflight regression checks, filesystem and sparse-image verification.
- Privacy cleanup repeated; maintainer SSH keys removed and SSH disabled in both boot stages.
- Simple feature/status guide, installation instructions, major SP Flash Tool risks, component hashes, and image checksums.
- Separate Git history with a neutral project identity; no remote or developer history.

## Still required before public binary distribution

- Incorporate the staged [Pocket Armagetron controls](ARMAGETRON-CONTROLS.md) and [GPU runtime](ARMAGETRON-PERFORMANCE.md), plus the [release app selection](release-profile/README.md), into the next image and refresh component hashes, image checksums, and validation. The current-02 image predates these controls.

- Fresh-install **this exact image pair** on the supported baseline and record first boot, storage expansion, second boot, keyboard/mouse, brightness, audio, and games. The existing phone has not been reflashed during preparation.
- Assemble matching corresponding source, local modifications, build instructions, and upstream license notices for the distributed components. This repository currently contains release metadata/documentation, not a complete source release or reproducible build environment. No blanket license is assigned to the combined image.
- Record the successfully tested SP Flash Tool version, Download Agent provenance/hash, and connection sequence. The install guide currently requires an already established Pocket setup.
- Add the actual download URL only after publication; use the host’s supported attachment size/splitting procedure for the multi-gigabyte userdata image.

## Public file boundary

Only this repository’s tracked files, `boot.img`, `userdata.img`, and the reviewed source/license package should be shared. Images are deliberately excluded from Git. Do not share `.git`, private work folders, old images, debug helpers, SSH files, or logs from the development workspace.

Run `sha256sum -c SHA256SUMS` beside the images and scatter. Checksums identify the candidate; they do not replace a boot test.
