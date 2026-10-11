# Source for current-07

The [current-07 release](https://github.com/sr-hawk/titanpocket-droidian/releases/tag/titan-pocket-current-07) includes the finished flash images and these source attachments:

- `titan-pocket-current-07-source.tar.gz`: the local modified desktop/game source trees, hardware-control code, VT module and its build source, build settings, release overlays, and image-assembly scripts.
- `titan-pocket-current-07-debian-sources.tar`: cached Debian source packages and their acquisition/checksum manifest.
- `titan-pocket-current-07-droidian-sources.tar`: cached Droidian source snapshots and their acquisition/checksum manifest.
- `SOURCE-SHA256SUMS`: checksums for the three source attachments.

Verify the downloads with `sha256sum -c SOURCE-SHA256SUMS`. Extract the Pocket source archive and read `README-SOURCE.md`. `SOURCE-REVISIONS.json` identifies the source revisions, including working-tree snapshots; `SOURCE-FILES.json` records file hashes. Dependency TARs preserve the original upstream archives and notices.

These are the materials used in the development and assembly workspace. Personal build paths are normalized to `/opt/titan-pocket`; private Git history, SSH keys, device data and development logs are excluded. Historical assembly scripts still refer to intermediate build directories and external toolchains/sysroots. This upload is not a claim that a new one-command clean rebuild has been tested.

The release was assembled from a sanitized Droidian base with 376 package inputs configured offline and the Pocket components installed before packing. Current-07 applies its three Armagetron presentation/build-metadata changes to the working current-06 base. The images require no live desktop conversion.

The kernel and DTB in `boot.img` are retained from stock firmware 2023010520. The included kernel reconstruction was used for the supplementary VT module; it is not asserted to be the exact source of the manufacturer-built kernel. Source files retain their respective licenses; the complete image is not MIT-licensed.
