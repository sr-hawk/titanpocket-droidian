# Pocket welcome tour

A new, original GTK3/PyGObject tour for the Titan Pocket. It replaces the generic Phosh tour entry with nine pages covering first setup, Home, Fn navigation, keyboard scrolling, mouse gestures, games, limitations, and unlocked startup. A/L or arrow keys change pages; W/S or arrow keys scroll; Back/Escape closes. Touch buttons work too. It makes no network requests and changes no user settings.

## Packaging status

Prepared after the tested current-03 image. **Not included in current-03's boot.img or userdata.img, and not yet tested on the physical phone.** Merge the release-profile overlay during the next image build. Do not describe current-03 as containing this tour.

The overlay installs `/usr/local/bin/pocket-tour` and its JSON content. A desktop file with the existing Phosh Tour ID replaces the app-grid entry. A systemd user-service drop-in replaces the absolute first-run command; the existing first-run conditions and completion marker remain in effect. `/usr/local/bin/phosh-tour` handles ordinary PATH-based launches. The original packaged binary remains intact at `/usr/bin/phosh-tour`.

Dependencies already present in current-03: Python 3, PyGObject, and GTK3 typelib/runtime. The app uses GTK3 rather than adding another UI toolkit.

## Install on an existing Pocket

Copy the provided `pocket-tour-update.tar.gz` to the phone and extract it into a new folder. From that folder, run:

```sh
sudo sh pocket-tour/install.sh
```

Then open **Pocket Tour** in the app overview. If the old launcher is cached, reboot. The existing first-run marker is preserved, so an already completed tour does not start automatically again. The installer backs up any previous override files under `/var/backups/pocket-tour.*`; it does not enable SSH or alter passwords.

The installer is for the Pocket, not the workstation. The archive contains only the tour files, installer, documentation, and applicable MIT notice. It does not contain a flash image.

## Edit the tour

Edit `release-profile/overlay/usr/local/share/titan-pocket/tour.json`. The executable is `release-profile/overlay/usr/local/bin/pocket-tour`. Keep each page short; longer pages scroll while navigation stays visible. Host preview checks do not replace a test under the Pocket's custom GTK theme and Phosh session.
