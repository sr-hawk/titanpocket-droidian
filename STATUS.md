# Titan Pocket Droidian status

Updated October 9, 2026. This repository describes the experimental `titan-pocket-privacy-01` image candidate and the broader development status. The privacy-cleaned candidate passes offline checks but has not been boot-tested.

## Current candidate

The candidate derives from boot 15 + userdata 09. It retains the stock kernel and DTB for firmware 2023010520. Only boot and userdata are flashed; the existing stock vendor partitions are retained.

The image includes native Phosh, Phoc, wlroots, GTK3/GDK3, and libhandy builds, the Pocket input service and keyboard layout, fingerprint integration, volume controls, and development tools. It is configured for a 720 × 720 desktop at scale 1. First boot installs the bundled packages and expands storage.

SSH is disabled by default in the initramfs and Linux system. Shared SSH identities and authorization have been removed. Phosh still starts unlocked. Default Droidian accounts remain.

## Development hardware status

| Area | Status |
| --- | --- |
| Boot, touchscreen, physical keyboard | Working on the development phone. |
| Capacitive keyboard | Working scrolling and pointer modes, including click, right-click, and drag. |
| Hardware navigation | Home overview, Fn + Home quick settings, Fn navigation, Sym as Ctrl, Back as Escape. |
| Display | Full 720 × 720 workspace with Pocket sizing changes. |
| Fingerprint | Unlock reported working on the development phone. The candidate retains unlocked development startup. |
| Audio | Speaker and volume keys working; microphone, earpiece, and headset routes need testing. |
| Battery and CPU | Battery reporting works; VT and USB CPU-spin fixes recorded. Suspend, wake, and idle drain need testing. |
| Wi-Fi | Scanning observed; connection, sustained transfer, and suspend/reconnect need confirmation. |
| Bluetooth | Not working. |
| Cellular | Calls, SMS, and mobile data untested. |
| Other hardware | Camera, NFC, FM, IR, microSD, GPS, sensors, vibration, keyboard backlight, and notification LED are not all validated. Driver or HAL presence alone does not establish working hardware. |

## Work ahead of this image

The development phone has later GTK4, libadwaita, compositor, shell, and brightness changes. Those changes are not all in this saved candidate. In particular, the later native GTK4/libadwaita/libdroid replacements and brightness workaround are absent from its build inventory.

Successful earlier installations and live deployments do not establish that this exact privacy-cleaned image pair has passed a fresh installation test. See [the release checklist](RELEASE-CHECKLIST.md) for the remaining publication work.
