# Current status

Updated October 10, 2026 for `titan-pocket-current-06`.

The recovered October 9 personal component baseline is used, with the approved privacy cleanup, gallery/launcher cleanup and Pocket Tour replacement. The original personal Phosh is retained. Packages and custom components are installed at their active paths during assembly. First boot only adds storage expansion to normal Droidian startup. This exact image has not yet passed a full-flash test.

| Area | Development-phone evidence and included functionality |
| --- | --- |
| Boot, display, touchscreen, typing | Previously working on the development phone. Full 720 × 720 desktop at scale 1. |
| Capacitive keyboard | Scroll and pointer modes; tap-click, long-press right-click, tap/hold dragging, typing guard, and Home suppression after swipes. |
| Keyboard navigation | Home overview, Fn + Home quick settings, Fn navigation, Sym as Ctrl, Back as Escape. Current XKB/compositor fixes included. |
| Desktop and applications | Current Phosh, Phoc, wlroots, GTK3/GDK3, GTK4, libhandy, libadwaita, and libdroid builds included. Pocket text/control sizes and shell layout fixes included. |
| Fingerprint | Unlock has worked on the development phone; stock-identity integration included. This candidate still starts unlocked and includes no personal enrollment. |
| Audio | Speaker/volume keys previously working on the development phone; smart-amplifier permissions and PulseAudio changes included. Other routes untested. |
| Brightness | Commit-pulse workaround included. Slider curve/range still needs tuning. |
| Sensors and games | Accelerometer startup, tilt service, and game-triggered GPU boost included. Extreme Tux Racer with GLES/Wayland and tilt work included. Armagetron includes its required GLU library. Desktop-entry launch, clean-profile first-run setup, and local-match rendering were verified on the development phone. Long sessions and multiplayer remain untested. |
| Terminal and app selection | Custom Xfce terminal included. Development galleries removed. Extra Console, terminal settings, Thunar preferences, and Bulk Rename launchers hidden; in-app functionality retained. |
| Battery and CPU | Reporting works; VT and USB CPU-spin fixes retained. Game boost can increase heat and power use. Suspend, wake, and idle drain need testing. |
| Wi-Fi | Scanning observed previously; connection, sustained transfer, and suspend/reconnect need confirmation. |
| Bluetooth | Not working. |
| Cellular | Calls, SMS, mobile data, and emergency calling untested. |
| Other hardware | Camera, microphones/headsets, NFC, GPS, FM, IR, microSD, vibration, keyboard backlight, and notification LED are not all validated. Driver presence is not proof of working hardware. |
| Access and updates | SSH disabled; default Droidian accounts retained; desktop starts unlocked. Kernel/initramfs and desktop upgrades are not integrated into a tested upgrade path. |

## Image assembly

The 376 bundled packages are installed and configured on the build computer under an ARM userspace environment. The recovered Pocket binaries are then installed at their active paths, with package diversions already registered. Default home is prepared in the image. Temporary installation tools, package bundles, and the Pocket first-boot installer are removed before packaging.

## Validation boundary

- The saved October 9 phone hashes and later game-deployment records identify the recovered personal baseline. This is an offline comparison, not a new test of the phone.
- Native payload inventory, ELF dependency-presence audit, offline package dependency/conflict checks, completed offline installation and package-state validation, image file/link/mode readback, ext4 checks, sparse expansion, and nested-root verification.
- Privacy checks repeated after updates; SSH remains disabled in both boot stages.
- Current-03 installation/boot success is user-reported. Current-06 still needs a fresh flash/boot test, storage-growth and second-boot checks, and individual hardware/game checks.

`COMPONENTS.json` records the active custom-file hashes. `MANIFEST.json` and `SHA256SUMS` identify the image pair. See [RELEASE-CHECKLIST.md](RELEASE-CHECKLIST.md) before publication.

## Included in current-06

The recovered personal Pocket shell, compositor, toolkits, keyboard/pad controls, brightness/audio integration, and later Armagetron controls/GPU runtime are installed before flashing. The desktop remains unlocked at startup, with default Droidian user accounts and disabled SSH. Development galleries are omitted and redundant launchers hidden.

Pocket Tour replaces the original executable, application launcher, and first-run command; installed package diversions protect those paths. Its setup page describes storage expansion only. No Pocket first-boot package installer, activation dependency, or conversion bundle remains in the image.

The previous current-05 failed to reach the desktop in the owner's full-flash test. It is superseded. Current-06 restores the personal Phosh binary rather than the additional current-05 drag-mode patch. Physical Home and unwanted swipe behavior must be checked during the full-flash test; source comparison alone cannot certify them.
