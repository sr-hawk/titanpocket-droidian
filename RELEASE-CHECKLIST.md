# Before publishing

The owner reports `titan-pocket-current-07` works well. Final review of the exact images found no personal credentials or user data; see FINAL-PRIVACY-REVIEW.json. Nothing has been uploaded.

## Completed

- Current-07 includes Pocket Armagetron controls, native Wayland GPU runtime, and the selected release app cleanup.

- Current custom files compared with saved hashes of the personal phone and later game-deployment records.
- Updated payloads assembled into a clean image; Pocket components installed at their final runtime paths.
- Dependency-presence audit, completed offline package installation and package-state checks, filesystem and sparse-image verification.
- Privacy cleanup repeated; maintainer SSH keys removed and SSH disabled in both boot stages.
- Simple feature/status guide, installation instructions, major SP Flash Tool risks, component hashes, and image checksums.
- Separate Git history with a neutral project identity; no developer history; the origin now points to the existing project repository.

## Still required before public binary distribution

- Record detailed first-boot, storage-expansion, second-boot, keyboard/mouse, brightness, audio, game and Pocket Tour checks; the general current-07 success report does not claim all individual tests. The owner reports a working full flash of current-06. Check the repaired Armagetron icon, both welcome messages, menu help and in-game controls tips in current-07.
- Assemble matching corresponding source, local modifications, build instructions, and upstream license notices for the distributed components. This repository currently contains release metadata/documentation, not a complete source release or reproducible build environment. No blanket license is assigned to the combined image. See LICENSING.md for the scoped MIT grant and upstream obligations. Also resolve redistribution permission for embedded vendor/firmware binaries.
- Record the successfully tested SP Flash Tool version, Download Agent provenance/hash, and connection sequence without distributing or linking tool/DA downloads. The install guide currently requires an already established Pocket setup.
- Add the actual download URL only after publication; use the host’s supported attachment size/splitting procedure for the multi-gigabyte userdata image.

## Public file boundary

Only this repository’s tracked files, `boot.img`, `userdata.img`, and the reviewed source/license package should be shared. Images are deliberately excluded from Git. Do not share `.git`, private work folders, old images, debug helpers, SSH files, or logs from the development workspace.

Run `sha256sum -c SHA256SUMS` beside the images and scatter. Checksums identify the candidate; they do not replace a boot test.

## Pocket Tour included

- The replacement tour, content, launcher, and first-run service override are included in current-07. Host layout checks passed; physical-phone testing remains pending.

## Required full-flash regression checks

- App-screen bottom swipe does not open Home; physical Home still does.
- Pocket Tour replaces the old tour in the app grid and first-run flow.
- Storage expansion succeeds; Pocket files are already installed and no stock desktop fallback exists.
- Repeat after a second boot, plus existing keyboard, mouse, audio, brightness, and game checks.
