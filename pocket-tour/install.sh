#!/bin/sh
# SPDX-License-Identifier: MIT
set -eu
if [ "$(id -u)" != 0 ]; then
    echo 'Run this installer with sudo on the Pocket.' >&2
    exit 1
fi
base=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
overlay="$base/release-profile/overlay"
/usr/bin/python3 -c 'import gi; gi.require_version("Gtk", "3.0"); from gi.repository import Gtk'
backup=$(mktemp -d /var/backups/pocket-tour.XXXXXXXX)
for path in \
    usr/local/bin/pocket-tour \
    usr/local/bin/phosh-tour \
    usr/bin/phosh-tour \
    usr/share/applications/mobi.phosh.PhoshTour.desktop \
    usr/local/share/titan-pocket/tour.json \
    usr/local/share/applications/mobi.phosh.PhoshTour.desktop \
    usr/lib/systemd/user/phosh-tour.service.d/50-pocket.conf
do
    test -f "$overlay/$path"
    if [ -e "/$path" ] || [ -L "/$path" ]; then
        mkdir -p "$backup/$(dirname "$path")"
        cp -a "/$path" "$backup/$path"
    fi
    case "$path" in
        usr/bin/phosh-tour|usr/share/applications/mobi.phosh.PhoshTour.desktop)
            stock="/usr/lib/titan-pocket/stock/$path"
            existing=$(dpkg-divert --truename "/$path")
            if [ "$existing" != "/$path" ] && [ "$existing" != "$stock" ]; then
                echo "Existing unrelated diversion for /$path; stopping." >&2
                exit 1
            fi
            if [ "$existing" = "/$path" ]; then
                install -d -m 755 "$(dirname "$stock")"
                dpkg-divert --local --rename --divert "$stock" --add "/$path"
            fi
            ;;
    esac
    install -d -m 755 "/$(dirname "$path")"
    mode=644
    case "$path" in usr/local/bin/*|usr/bin/phosh-tour) mode=755 ;; esac
    install -m "$mode" "$overlay/$path" "/$path"
done
printf 'Pocket Tour installed. Previous override files saved in %s\n' "$backup"
printf 'Open Pocket Tour from the app overview. Reboot to refresh first-run service configuration.\n'
