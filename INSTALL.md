# Installation and major risks

**For experienced Titan Pocket testers with an established stock recovery setup. This image contains the preinstalled Pocket system. The owner reports current-07 works well; follow the checks below on your own phone.**

## Major risks — read first

1. **Complete userdata loss.** This installation replaces both `boot` and `userdata`. Apps, accounts, messages, photos, and other files in userdata are erased. It is not an in-place upgrade.
2. **Loss of baseband/modem data, IMEI, calibration, and factory MAC addresses.** Improper formatting or flashing can overwrite data unique to your phone, including modem identity and radio calibration, and factory Wi-Fi/Bluetooth MAC addresses. The phone may still boot while cellular, Wi-Fi, or Bluetooth no longer works correctly. Never use **Format All + Download**, a separate format operation, or **Firmware Upgrade** with this package. Loss may be permanent without a usable backup from your own phone; recovery is not guaranteed.
3. **An unbootable or hard-bricked phone.** A wrong scatter, wrong device, unexpected partition layout, wrong Download Agent, or accidentally selected bootloader/preloader partition can break recovery as well as normal boot. Recovery is not guaranteed.
4. **Interrupted writes.** A USB disconnect, power failure, or host crash during flashing can leave a partially written phone that will not boot. Use a charged phone, reliable cable, and stable host power.
5. **An experimental, unlocked system.** Cellular and emergency calling are untested, suspend/battery behavior is uncertain, and the desktop starts unlocked. Do not rely on it as your only phone or use it for sensitive personal data.

## Protect your phone’s unique data

Before flashing, use your established backup procedure to save the phone’s device-specific partitions off the phone and verify that the backups are readable and can be restored with your recovery setup. The supplied scatter includes `nvram`, `nvdata`, `protect1`, `protect2`, `persist`, and `proinfo`; these are examples of partitions this release must **not** write or format. The complete flashing allowlist is **`boot` and `userdata` only**.

A stock firmware archive is not a backup of your phone’s original IMEI, calibration, or factory MAC addresses. Reinstalling stock firmware does not guarantee their recovery. Keep device-specific backups private: do not upload them to GitHub or include them in a shared image. Another phone’s backup is not a substitute for your own. If these data are lost, manufacturer/service assistance may be necessary and may still be unable to restore them.

## Supported starting point

- **Unihertz Titan Pocket only**, stock firmware **2023010520**, kernel **4.14.186-g40b2a1864-dirty**, and an **unlocked bootloader**.
- The original stock partition layout and vendor stack must still be present. Other Titan models, other firmware versions, and repartitioned devices are not validated.
- Backups stored off the phone, matching stock firmware, and a recovery procedure already established for your own phone. Do not assume that a stock archive restores device-specific data.
- SP Flash Tool and a Download Agent already known to work with your Pocket. Unlocking, choosing an initial DA, and recovering an unknown device are outside this guide. Neither SP Flash Tool nor a Download Agent is supplied, mirrored, endorsed, or linked for download by this project.

## Flash the candidate

1. Put `boot.img`, `userdata.img`, `MT6771_Android_scatter.txt`, and `SHA256SUMS` in one folder. Read the manifest to confirm the build name.
2. On Linux, open a terminal in that folder and run:
   ```sh
   sha256sum -c SHA256SUMS
   ```
   Every entry must say `OK`. Stop on any mismatch.
3. Open SP Flash Tool, select your established Download Agent, and load **this release’s scatter**.
4. Choose **Download Only**. Check the partition list yourself: **only `boot` and `userdata` may be selected**, with paths to these two images. Do not select preloader, bootloaders, NVRAM/NVDATA, `super`, or any other partition.
5. Start Download. Connect the powered-off phone using the connection sequence established for your setup. Wait for SP Flash Tool to report successful completion before disconnecting or booting.
6. Boot normally. **First setup takes a few minutes.** First boot expands storage before starting the already-installed Pocket desktop. Keep the phone powered and let setup finish before restarting; later boots should be quicker. No Pocket package installation, custom-binary copying, or desktop conversion runs on the phone.
7. Check touchscreen, typing, Home, Fn + Home, scroll and mouse modes, audio, and brightness. Reboot once more and repeat the basic checks.

**Stop on a partition-layout, authentication, or write error.** Save the error/log, removing personal identifiers before sharing. Do not format, change partition addresses, switch to Firmware Upgrade, select additional partitions, or repeatedly force retries to bypass it.

Once the desktop appears, follow the [Pocket getting-started guide](GETTING-STARTED.md).

## First-boot checks

In a terminal on the phone:

```sh
systemctl status pocket-prepare-home.service --no-pager
journalctl -b -u pocket-prepare-home.service --no-pager
df -h / /home
```

Storage preparation should finish successfully. Root is configured to grow from 8 GiB to **16 GiB**; the outer userdata filesystem starts at **10 GiB** and grows to the existing partition. Home uses the remaining userdata space. The package retains the stock kernel and DTB and does not replace the stock vendor partitions.

SSH is deliberately disabled, including early-boot recovery SSH. The developer’s old connection helpers will not work. If you want SSH later, configure it from the phone with fresh host keys and your own authorized key. Never reuse another person’s key or a shared host identity.

If the desktop does not appear, this guide does not provide a remote recovery shell. Use your previously established stock recovery route. Normal package updates are not a validated upgrade path for this custom kernel/initramfs and modified desktop stack.

## Pocket-specific acceptance checks

After a full flash and completed setup, open an app and swipe upward from the bottom: it must not open Home. Press physical Home: it must open the overview. Check Fn + Home, typing, and keyboard scroll/mouse modes. Open Pocket Tour from the app overview and confirm the generic swipe-up instructions are gone. Reboot and repeat these checks.

The Pocket desktop is already installed and waits for storage preparation. There is no stock desktop fallback. Keep the installation result/log for diagnosis; do not treat a missing desktop as permission to format extra partitions.
