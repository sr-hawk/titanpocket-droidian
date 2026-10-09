# Droidian for the Unihertz Titan Pocket

A working Droidian port with a Linux desktop tuned for the Titan Pocket’s square screen and physical keyboard. The capacitive keyboard doubles as a touchpad: use it to scroll, or press the red key to switch to mouse mode.

Droidian is running on a development Titan Pocket. This project shares the work so other Pocket owners can experiment, improve it, and help test the hardware.

**Experimental developer build.** This is a work in progress, not a fully tested everyday phone replacement. Calls, SMS, and mobile data have not been tested.

## What works

On the development phone:

- Droidian boots into Phosh with touchscreen and physical keyboard input.
- The keyboard surface supports scrolling and mouse movement, clicking, right-clicking, and dragging.
- Home opens the overview; Fn + Home opens quick settings.
- The desktop uses the full 720 × 720 display at native scale.
- GTK3, GTK4, libhandy, and libadwaita have Pocket sizing changes for readable text and usable controls.
- Fingerprint unlock, speaker output, volume keys, battery reporting, and USB debugging work.
- Brightness control works through a workaround; its slider range still needs tuning.

The live system is ahead of the existing image. See [current status](STATUS.md) for the exact package contents and remaining hardware work.

## Before installing

This port was developed against **Titan Pocket stock firmware 2023010520**, kernel **4.14.186-g40b2a1864-dirty**, with an **unlocked bootloader**. Other firmware versions and other Titan models are not validated.

**Installing replaces userdata and erases your files.** Back up anything you need. Have matching stock firmware and a recovery procedure that you have already established for your own phone.

You need SP Flash Tool and a Download Agent known to work with your Pocket. This guide assumes those are already set up; it does not cover unlocking or initial Download Agent setup.

## Build identity and privacy

The current image candidate is `titan-pocket-privacy-01`, a privacy-cleaned derivative of the saved boot 15 + userdata 09 package. It does not incorporate the newer live-phone improvements. Read [the privacy report](PRIVACY-REPORT.md) for the checks and changes.

SSH is disabled by default in both early boot and the Linux system. No maintainer login key or shared SSH host identity should be used. The developer’s connection helpers will not connect to this build. Testers who want SSH must configure it locally with their own authorized key and newly generated host keys.

The original development behavior of starting Phosh unlocked is retained. Use this as a lab image; do not put personal accounts or sensitive data on it. The privacy-cleaned image has not been flashed or boot-tested.

## Installation

These steps describe the existing two-image installation route. This derivative still requires a maintainer fresh-install test before general distribution.

1. Back up the phone and confirm the supported stock baseline and unlocked bootloader.
2. Download and extract the complete release. Keep `boot.img`, `userdata.img`, and `MT6771_Android_scatter.txt` together.
3. Verify the supplied checksums. On Linux, run `sha256sum -c SHA256SUMS` from that directory. Stop if any check fails.
4. Open SP Flash Tool, select your known-working Download Agent, and load the release’s scatter file.
5. Select **Download Only**. Confirm that **only boot and userdata** are selected, pointing to the release’s two images.
6. Start Download and connect the powered-off phone using the connection procedure that works with your established SP Flash Tool setup. Wait for successful completion, then boot normally.
7. Allow the first boot to finish. Storage expands and bundled packages install before the desktop starts, so this takes longer than later boots.

Do not use **Format All** or **Firmware Upgrade** with this package. If SP Flash Tool reports a partition-layout mismatch, stop and save the error and log; do not change the layout to force the flash.

The image initially contains a 10 GiB userdata filesystem and an 8 GiB root filesystem. First boot is configured to expand userdata to the existing partition and root to 16 GiB. The package retains the stock kernel and DTB and does not flash `super` or vendor partitions.

## Keyboard and touchpad controls

| Action | Control |
| --- | --- |
| Switch scroll and mouse modes | Red programmable key |
| Scroll | Swipe across the keyboard in scroll mode |
| Move the pointer | Swipe across the keyboard in mouse mode |
| Left click | Tap the keyboard surface in mouse mode |
| Right click | Long press the keyboard surface in mouse mode |
| Drag | Tap, then touch and hold while moving in mouse mode |
| App overview | Home |
| Quick settings | Fn + Home |
| Arrow keys | Fn + W/A/S/D |
| Escape | Back |
| Control modifier | Sym |

Touchpad input briefly pauses after typing to avoid accidental movement. Home presses during and just after a swipe are suppressed. The pad does not report gestures while a physical keyboard key is held down.

## Known limitations

Bluetooth is not working. Suspend and battery drain need testing. Cameras, microphones, headset routing, NFC, GPS, and other hardware are not all validated. This derivative still starts Phosh unlocked. Debugging access is disabled; fingerprint support does not make an unlocked lab image secure.

Kernel and initramfs updates are not yet integrated into the normal package upgrade flow. Keep a recovery path available when experimenting with system updates.

## Help test

Useful reports include the build name, original firmware version, steps to reproduce, expected and actual behavior, and whether the problem persists after reboot. Screenshots and relevant logs help; remove passwords, private keys, personal data, and device identifiers before posting.

Particularly useful areas are suspend and wake, battery drain, Wi-Fi reconnect, audio routes, camera support, Bluetooth, and application layouts on the square screen.

## Credits

Built on Droidian, the Ubuntu Touch supplemental VT module work, Phosh, Phoc, wlroots, and the GTK ecosystem, with the stock Unihertz kernel and vendor stack. This is an unofficial community experiment. Upstream components retain their respective licenses.

## Repository and release files

Git tracks the guide, status, privacy report, release checklist, manifest, scatter, flashing notes, and checksums. The two image files are release attachments, kept alongside these files locally and deliberately excluded from Git history.

For a downloadable package, include `boot.img`, `userdata.img`, `MT6771_Android_scatter.txt`, `MANIFEST.json`, `SHA256SUMS`, `FLASH.txt`, `README.md`, `STATUS.md`, `PRIVACY-REPORT.md`, and `RELEASE-CHECKLIST.md`. Do not include `.git` or unrelated working files.

This repository has no published download URL yet. Read [the release checklist](RELEASE-CHECKLIST.md) before publishing the candidate. The manifest identifies the exact image pair; the checksums cover the two images and scatter.
