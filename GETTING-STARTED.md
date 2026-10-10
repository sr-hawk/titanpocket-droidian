# Welcome to Droidian on the Titan Pocket

Your Pocket runs a Linux desktop adapted for its square touchscreen and physical keyboard. Start with touch, then try the keyboard shortcuts and mouse mode below.

## Let the first setup finish

**First setup takes a few minutes.** The phone expands storage and installs its bundled packages before opening the desktop. Keep it powered and let that finish before restarting. Later boots should be quicker. These setup packages are included in the image and do not need an internet connection.

This experimental build opens the desktop without asking for a password. Default Droidian accounts remain. You can change passwords and screen-lock settings yourself; there is no mandatory password setup wizard. SSH is disabled.

## Find your way around

Press **Home** to open the app overview. Tap an app to launch it or switch to it. Press **Fn + Home** for quick settings, including the brightness and volume controls.

Use the touchscreen whenever an application's keyboard navigation is awkward. Some desktop applications still have windows or dialogs that do not fit the small screen well.

## Use the physical keyboard

| Action | Keys |
| --- | --- |
| App overview | Home |
| Quick settings | Fn + Home |
| Up / left / down / right | Fn + W / A / S / D |
| Control modifier | Sym |
| Escape / back out of a menu | Back |

Back acts as Escape; its effect depends on the application. The keyboard is also a touch surface. Pointer input pauses briefly while you type, and the surface does not report gestures while a physical key is held down. Release keys before swiping.

## Scroll and use the mouse

Press the **red programmable key** to switch between scroll and mouse modes.

- In scroll mode, swipe across the keyboard surface to scroll.
- In mouse mode, swipe to move the pointer and tap to left-click.
- Touch and hold for a right-click.
- To drag, tap once, then touch again and hold while moving.

Home presses during a swipe and briefly afterward are suppressed to reduce accidental app switching. If Home does not respond immediately after a gesture, lift your finger, pause, and press it again.

## Try the included apps

Open the app overview to find the file manager, terminal, and games. The release uses a customized Xfce terminal. Developer demo galleries and redundant settings launchers have been removed or hidden.

**Armagetron Advanced:** use **A / L** to steer, **Space** to brake, and **C** to change camera. Menus use **W / S** to move, **A / L** to adjust a choice, and **Enter** to select. Use **Back** for the game menu. The first-run control preset is named **Pocket**. See the [complete controls](ARMAGETRON-CONTROLS.md).

**Extreme Tux Racer:** the build includes tilt support. Long play sessions and every control path still need testing.

Armagetron uses GPU rendering and reached about 60 FPS on the development phone. Performance, heat, and battery use can vary; that measurement was not taken from the newly flashed test installation.

## Know the current limits

Bluetooth does not work. Calls, SMS, mobile data, and emergency calling are untested. Cameras, microphones, GPS, NFC, suspend/wake, Wi-Fi reconnect, and battery life also need further checks. Treat this as an experimental Linux Pocket, not a dependable everyday phone.

Default passwords and unlocked startup are intentional for this test build. Change them before using it with personal data. If you enable SSH, create fresh host keys and configure your own access locally. Ordinary system updates may replace Pocket adaptations; they are not a verified upgrade method for this build.

See [current status](STATUS.md) for the full feature list and [installation instructions](INSTALL.md) before flashing again.

## Report what you find

Include the build name (**titan-pocket-current-04**), what you tried, what happened, and whether it still happens after a reboot. Remove personal information, keys, network details, and device identifiers from any logs or screenshots before sharing them.
