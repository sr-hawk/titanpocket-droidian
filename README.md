# Droidian for the Unihertz Titan Pocket

A Linux phone experiment built around the Pocket’s physical keyboard and square screen. The capacitive keyboard works as a scroll pad **and an actual mouse**, with clicking, right-clicking, and dragging.

**Build: `titan-pocket-current-07` — experimental release candidate.** The Pocket shell, compositor, toolkits, input controls, game updates, and Pocket Tour are installed in the image before flashing. Packages are installed and configured during assembly. The only additional first-boot setup is storage expansion; there is no Pocket package installation on the phone or switch from a stock desktop. **First startup can take a few minutes.** The preceding current-06 passed the owner’s full-flash/boot test. Current-07 fixes Armagetron’s launcher icon and English Pocket introduction/control help; the owner now reports current-07 works well. Individual hardware coverage remains as listed in STATUS.md.

> **Flashing erases the phone’s userdata. Incorrect SP Flash Tool settings can erase baseband/modem identity, IMEI, radio calibration, and factory Wi-Fi/Bluetooth MAC addresses, or brick the phone. A stock firmware download cannot recreate your phone’s unique data; loss may be permanent. Use Download Only with only `boot` and `userdata` selected. Read [installation and major risks](INSTALL.md) before using it.**

> **Compatibility: tested only on a Titan Pocket with TEE/non-EEA stock firmware `2023010520` and UFS storage, kernel `4.14.186-g40b2a1864-dirty`, an unlocked bootloader, and the original partition layout. The supplied `boot.img` retains that baseline's stock kernel/DTB; the scatter targets `g66v71c2k_dfl_tee` and UFS. EEA firmware and other hardware/storage variants are unverified. Do not flash this package if your variant or layout differs or is unknown. See [compatibility checks](INSTALL.md#variant-compatibility).**

## What it can do

- Boot Droidian/Phosh with touchscreen and physical keyboard input.
- Use the keyboard surface to scroll, move the pointer, click, and drag.
- Use the full 720 × 720 display, with larger text and controls in GTK3, GTK4, libhandy, and libadwaita applications.
- Open overview with Home and quick settings with Fn + Home.
- Use the speaker, volume keys, battery reporting, and a brightness workaround.
- Play Extreme Tux Racer with tilt support and Armagetron with Pocket controls and native GPU rendering. Armagetron measured about 60 FPS on the development phone.

Fingerprint unlock has worked on the development phone, but this lab build **starts the desktop unlocked**. The passwordless desktop start and default accounts are intentional for this experimental release; owners may change passwords and screen locking themselves. SSH is disabled and maintainer keys are removed. Default Droidian accounts remain; this is not a hardened personal phone image.

## What it cannot promise yet

Bluetooth is not working. Calls, SMS, and mobile data are untested. Suspend/wake, battery life, Wi-Fi reconnect, cameras, microphones, headset routing, GPS, NFC, and other hardware need more testing. Ordinary system updates may overwrite adaptations or fail to update the custom boot image.

See [STATUS.md](STATUS.md) for the feature list and testing limits, [INSTALL.md](INSTALL.md) for installation, and [PRIVACY-REPORT.md](PRIVACY-REPORT.md) for cleanup details.

New to this build? Read the [Pocket getting-started guide](GETTING-STARTED.md).

## Controls

| Action | Control |
| --- | --- |
| Switch scroll/mouse mode | Red programmable key |
| Scroll / move pointer | Swipe on the keyboard surface |
| Left click | Tap in mouse mode |
| Right click | Long press in mouse mode |
| Drag | Tap, then touch and hold while moving |
| App overview | Home |
| Quick settings | Fn + Home |
| Arrow keys | Fn + W/A/S/D |
| Control / Escape | Sym / Back |

Typing temporarily pauses pad input. Home presses during and shortly after a swipe are suppressed. The pad does not report gestures while a physical key is held down.

## Contributing

Please report the build name, stock firmware version, steps to reproduce, and expected/actual behavior. Remove personal data, keys, and device identifiers from logs before sharing them.

Built on Droidian, Phosh, Phoc, wlroots, GTK, libhandy, libadwaita, and the stock Unihertz kernel/vendor stack, with the Ubuntu Touch supplemental VT module work. This is an unofficial community experiment; components retain their respective licenses.

Download the finished images and source archives from the [current-07 release](https://github.com/sr-hawk/titanpocket-droidian/releases/tag/titan-pocket-current-07). Images are release attachments, excluded from Git. Read `UNPACK.txt` to extract userdata and verify the checksums before following [INSTALL.md](INSTALL.md). See [SOURCES.md](SOURCES.md) for the source attachments and [RELEASE-CHECKLIST.md](RELEASE-CHECKLIST.md) for testing coverage.

Original project documentation and the independent game launcher use MIT. Upstream components and modifications retain their applicable licenses; the image is not MIT-licensed as a whole. See [LICENSING.md](LICENSING.md). SP Flash Tool and Download Agent downloads are not provided or linked.
