# Current status

Updated October 9, 2026 for `titan-pocket-current-04`.

The current local custom binaries/configuration were compared with the running development phone before packaging. The release uses a clean, pristine-rootfs-based filesystem, not a clone of personal phone data. **A tester reported successful installation and boot of the preceding current-03 on October 9, 2026. First setup takes a few minutes.** This is a user-reported smoke test, not an instrumented verification of every feature.

| Area | Current state |
| --- | --- |
| Boot, display, touchscreen, typing | Working on the development phone. Full 720 × 720 desktop at scale 1. |
| Capacitive keyboard | Scroll and pointer modes; tap-click, long-press right-click, tap/hold dragging, typing guard, and Home suppression after swipes. |
| Keyboard navigation | Home overview, Fn + Home quick settings, Fn navigation, Sym as Ctrl, Back as Escape. Current XKB/compositor fixes included. |
| Desktop and applications | Current Phosh, Phoc, wlroots, GTK3/GDK3, GTK4, libhandy, libadwaita, and libdroid builds included. Pocket text/control sizes and shell layout fixes included. |
| Fingerprint | Unlock has worked on the development phone; stock-identity integration included. This candidate still starts unlocked and includes no personal enrollment. |
| Audio | Speaker/volume keys working on the development phone; smart-amplifier permissions and PulseAudio changes included. Other routes untested. |
| Brightness | Commit-pulse workaround included. Slider curve/range still needs tuning. |
| Sensors and games | Accelerometer startup, tilt service, and game-triggered GPU boost included. Extreme Tux Racer with GLES/Wayland and tilt work included. Armagetron now launches after installing its missing GLU library. Desktop-entry launch, clean-profile first-run setup, and local-match rendering were verified on the development phone. Long sessions and multiplayer remain untested. |
| Terminal and app selection | Custom Xfce terminal included. Development galleries removed. Extra Console, terminal settings, Thunar preferences, and Bulk Rename launchers hidden; in-app functionality retained. |
| Battery and CPU | Reporting works; VT and USB CPU-spin fixes retained. Game boost can increase heat and power use. Suspend, wake, and idle drain need testing. |
| Wi-Fi | Scanning observed previously; connection, sustained transfer, and suspend/reconnect need confirmation. |
| Bluetooth | Not working. |
| Cellular | Calls, SMS, mobile data, and emergency calling untested. |
| Other hardware | Camera, microphones/headsets, NFC, GPS, FM, IR, microSD, vibration, keyboard backlight, and notification LED are not all validated. Driver presence is not proof of working hardware. |
| Access and updates | SSH disabled; default Droidian accounts retained; desktop starts unlocked. Kernel/initramfs and desktop upgrades are not integrated into a tested upgrade path. |

## What changed from privacy-01

The previous image lacked later toolkit, shell, compositor, brightness, accelerometer, and game work. This candidate incorporates the current saved functionality. Packaging fixes add the missing tilt executable, remove malformed native-install records, validate native payloads before package installation, reject unlisted packages, and refresh checksums. Six stale offline packages were removed so the install set matches its manifest. Game libraries are bundled, including the missing GLU dependency. Embedded workstation paths are removed; cross-build GTK locale/data paths are corrected to their target locations.

## Validation boundary

- Before packaging: read-only comparison with the development phone. A tester reported that the preceding current-03 image works. Current-04 adds Pocket Tour and has not yet been flashed.
- Native payload inventory, ELF dependency-presence audit, offline package dependency/conflict checks, installer validation, image file/link/mode readback, ext4 checks, sparse expansion, and nested-root verification.
- Privacy checks repeated after updates; SSH remains disabled in both boot stages.
- Current-03 installation/boot success is user-reported. Current-04 still needs a fresh flash/boot test, storage-growth and second-boot checks, and individual hardware/game checks.

`COMPONENTS.json` records the bundled custom payload hashes. `MANIFEST.json` and `SHA256SUMS` identify the image pair. See [RELEASE-CHECKLIST.md](RELEASE-CHECKLIST.md) before publication.

## Included in current-04

[Pocket Armagetron controls](ARMAGETRON-CONTROLS.md) and [native Wayland GPU acceleration](ARMAGETRON-PERFORMANCE.md) are now included. The development phone measured a median 60.0 FPS with GPU rendering at 720 × 720, compared with 35.5 FPS in software. These are development-phone measurements, not results from a fresh flash of this image.

The [experimental release profile](release-profile/README.md) keeps unlocked startup and pristine default accounts, omits both development galleries, and hides redundant launchers. No first-boot password wizard is added. SSH remains disabled.

## Pocket Tour

Current-04 replaces the generic phone tour launcher and first-run command with a Pocket-specific, nine-page welcome tour. It covers keyboard navigation, scroll/mouse modes, first setup, games, and limitations. Host layout checks passed; physical-phone validation is pending.
