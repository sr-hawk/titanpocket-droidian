# Privacy audit

The `titan-pocket-current-07` candidate was prepared October 10, 2026 using a sanitized filesystem with packages and the recovered personal Pocket components installed during assembly. It is not a dump of a phone’s live user data.

## Removed or reset

- SSH authorized keys and embedded SSH host private keys in both the initramfs and Linux filesystem, including inherited initramfs keys.
- An inherited TLS test private key and certificate.
- Existing machine IDs, logs, and root cache/local state.
- Personal build-directory prefixes in custom binaries, including the new GTK4 and game payloads. GTK cross-build locale/data lookups were corrected to target paths. Installer checksums were regenerated after these changes.

SSH startup is disabled in both boot stages. Linux SSH services and sockets are masked. A tester must explicitly configure their own server, generate fresh host keys, and enroll their own public key to enable access. No shared replacement login key is supplied.

The current functionality update was assembled from local system payloads. No live home directory, credentials, account state, or personal game settings were copied from the phone.

## Checks completed

- Removed SSH payloads are absent from the decompressed boot image.
- The entire cleaned 8 GiB Linux filesystem was checked against 14 known credential and identity patterns, with no matches. Sensitive small files were overwritten before removal, the journal was recreated, and free blocks were discarded before building a fresh outer filesystem.
- All nine regular home-directory files, including the account picture, match pristine Droidian. Account and password databases also match pristine Droidian.
- Saved Wi-Fi and Bluetooth state was empty. The usual Linux fingerprint-enrollment, modem-state, and AccountsService user/icon locations were absent or empty. The new outer filesystem has an empty Android data directory.
- The hostname is generic. The vendor property overlay contains no serial number, IMEI, or IMSI value.
- Remaining home-path examples in upstream documentation match pristine files or their unmodified upstream package archives; they are not project-specific build paths.
- Boot-container and unsigned AVB hash checks passed. The stock kernel and DTB are unchanged. Filesystem consistency, sparse expansion, and byte-for-byte nested-root verification passed.

## Scope and limitations

This audit covers the identified candidate images and the allowlisted public repository files. It does not cover other development images, source checkouts, or private working folders. Git history is new and uses a neutral project identity; no development history, credentials, private keys, personal contact details, or workstation paths were copied into it.

The owner reported a successful full flash and boot of current-06 on October 10, 2026. The owner now reports current-07 works well. Individual hardware tests are not implied by that report. It still starts Phosh unlocked and retains default Droidian accounts. Privacy cleanup is not a claim that the image is hardened for sensitive data or everyday phone use.

## Final review of the exact current-07 release

Repeated October 10, 2026 after the owner reported the build working well. **No personal credentials or user data were found.** The boot, userdata and scatter checksums match the release manifest. The public userdata attachment was independently decoded; its nested root hash matches the audited filesystem. Neither image was changed.

The full 8 GiB root and the boot image/decompressed initramfs were scanned against 15 known credential/identity patterns, with no matches. Broader scans for private-key blocks, SSH public-key lines, GitHub/Slack tokens and AWS-shaped access-key IDs were also reviewed. Twenty-six generic matches resolve to unchanged upstream files: 14 GnuTLS self-test key occurrences, seven OpenVPN sample-key occurrences, and five pattern matches in upstream binaries. Git’s sample netrc also matches its original package. These are upstream test/example material, not the owner’s credentials.

The actual outer userdata contains only the expected files, pristine default home and an empty Android-data directory. Root’s two regular startup files and home’s nine regular files match pristine Droidian. Account databases are unchanged, machine IDs are blank, SSH is disabled in both boot stages, and checked network, fingerprint, account and modem state locations are empty or absent. The nested Android system image also matches pristine Droidian. Public files and Git history passed review.

See [the checksum-bound final report](FINAL-PRIVACY-REVIEW.json). Default Droidian accounts and the intentionally unlocked desktop remain; the images are unchanged by this review.
