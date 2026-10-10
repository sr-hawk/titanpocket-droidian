# Experimental release profile

Keep the current unlocked, passwordless desktop startup and pristine Droidian account/password defaults. Do not add a mandatory first-boot password wizard. Owners can change their passwords and locking preferences themselves. SSH stays disabled, and no maintainer credentials are included.

Exclude both Pocket widget galleries (GTK3 and libadwaita), including their binaries and launchers. Keep their development sources outside the release.

Keep the customized Xfce terminal visible. Hide the extra Console icon, standalone Xfce Terminal Settings, Thunar Preferences, and Bulk Rename icons. Console remains installed, terminal preferences remain available inside the terminal, and file-manager settings/rename functionality remain available through Thunar. Both games and the useful base applications stay included.

`exclude-files.txt` lists exact paths relative to the image root. Apply it to both the assembled overlay and the destination filesystem before packaging, so previously staged galleries cannot survive. Merge `overlay/` into the image. Its system-local desktop entries hide shortcuts without removing package files and remain system-local launcher overrides.

The app-cleanup profile described above is included in current-07. It does not alter the development phone. Verify the app grid after fresh installation.

## Pocket Tour included in current-07

The overlay also contains the [Pocket welcome tour](../pocket-tour/README.md), launcher override, and first-run service drop-in. These are included in current-07; the preceding current-03 image retains the generic tour.
