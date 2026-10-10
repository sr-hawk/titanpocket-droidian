# Before publishing

The updated `titan-pocket-current-03` candidate is staged locally. Nothing has been uploaded.

## Completed

- Current-03 includes Pocket Armagetron controls, native Wayland GPU runtime, and the selected release app cleanup.

- Current custom functionality compared with installed system files on the development phone.
- Updated payloads assembled into a clean image; missing tilt executable and installer manifest fixed.
- Dependency-presence audit, installer preflight regression checks, filesystem and sparse-image verification.
- Privacy cleanup repeated; maintainer SSH keys removed and SSH disabled in both boot stages.
- Simple feature/status guide, installation instructions, major SP Flash Tool risks, component hashes, and image checksums.
- Separate Git history with a neutral project identity; no developer history; the origin now points to the existing project repository.

## Still required before public binary distribution

- Follow up the tester-reported successful current-03 installation/boot with recorded storage expansion, second boot, keyboard/mouse, brightness, audio, and game checks. No detailed results for those checks have been supplied yet.
- Assemble matching corresponding source, local modifications, build instructions, and upstream license notices for the distributed components. This repository currently contains release metadata/documentation, not a complete source release or reproducible build environment. No blanket license is assigned to the combined image. See LICENSING.md for the scoped MIT grant and upstream obligations. Also resolve redistribution permission for embedded vendor/firmware binaries.
- Record the successfully tested SP Flash Tool version, Download Agent provenance/hash, and connection sequence without distributing or linking tool/DA downloads. The install guide currently requires an already established Pocket setup.
- Add the actual download URL only after publication; use the host’s supported attachment size/splitting procedure for the multi-gigabyte userdata image.

## Public file boundary

Only this repository’s tracked files, `boot.img`, `userdata.img`, and the reviewed source/license package should be shared. Images are deliberately excluded from Git. Do not share `.git`, private work folders, old images, debug helpers, SSH files, or logs from the development workspace.

Run `sha256sum -c SHA256SUMS` beside the images and scatter. Checksums identify the candidate; they do not replace a boot test.

## Pending next image

- Install and test the Pocket Tour replacement on the phone. Its sources and release overlay are prepared; current-03 images do not contain it. Rebuild and validate a new candidate before claiming image inclusion.
