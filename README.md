# Droidian for the Unihertz Titan Pocket

A Linux phone experiment built around the Pocket’s physical keyboard and square screen. The capacitive keyboard works as a scroll pad **and an actual mouse**, with clicking, right-clicking, and dragging.

**Build: `titan-pocket-current-02` — experimental release candidate.** The custom components were compared with the running development phone. This newly assembled, privacy-cleaned image has passed offline checks but **has not had a fresh flash/boot test**.

> **Flashing erases the phone’s userdata. Incorrect SP Flash Tool settings can destroy device-specific modem data or leave the phone unbootable, possibly beyond ordinary recovery. Read [installation and major risks](INSTALL.md) before using it.**

## What it can do

- Boot Droidian/Phosh with touchscreen and physical keyboard input.
- Use the keyboard surface to scroll, move the pointer, click, and drag.
- Use the full 720 × 720 display, with larger text and controls in GTK3, GTK4, libhandy, and libadwaita applications.
- Open overview with Home and quick settings with Fn + Home.
- Use the speaker, volume keys, battery reporting, and a brightness workaround.
- Use the included accelerometer/tilt support and experimental game builds.

Fingerprint unlock has worked on the development phone, but this lab build **starts the desktop unlocked**. SSH is disabled and maintainer keys are removed. Default Droidian accounts remain; this is not a hardened personal phone image.

## What it cannot promise yet

Bluetooth is not working. Calls, SMS, and mobile data are untested. Suspend/wake, battery life, Wi-Fi reconnect, cameras, microphones, headset routing, GPS, NFC, and other hardware need more testing. Ordinary system updates may overwrite adaptations or fail to update the custom boot image.

See [STATUS.md](STATUS.md) for the feature list and testing limits, [INSTALL.md](INSTALL.md) for installation, and [PRIVACY-REPORT.md](PRIVACY-REPORT.md) for cleanup details.

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

Images are local release attachments, excluded from Git. No download has been published yet. See [RELEASE-CHECKLIST.md](RELEASE-CHECKLIST.md) for remaining publication work.
