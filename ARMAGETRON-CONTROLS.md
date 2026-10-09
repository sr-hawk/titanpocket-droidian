# Armagetron on the Titan Pocket

These controls are installed and tested on the development phone and saved in the game sources and staged payload. **They are not yet in the current-02 flash image. Rebuild the image before advertising these as included.**

| Key | Action |
| --- | --- |
| A / L | Turn left / right |
| Space | Brake |
| C | Change camera |
| Q / O | Look left / right |
| W | Look behind |
| P | Pause |
| S | Scores |
| T | Chat |
| Back / Escape | Game menu / go back |

In menus, use W/S to move, A/L to change a choice, and Enter to select. Text fields still accept letters normally. Fn arrow navigation remains available.

A fresh profile selects **Pocket** during first-run setup. The defaults no longer force WASD on every launch, so later control edits remain saved. Existing profiles retain their controls unless explicitly changed in Player Setup; the development phone received a one-time migration of game key bindings.

The patch alongside this guide applies to the previously modified Pocket Armagetron source tree. It adds menu navigation, the first-run preset, default configuration, and preset installation rules. It is an incremental patch, not the complete corresponding source or a standalone installer. Rebuild the client and stage its configuration files together.

Verified on the development phone: menu navigation, text entry, local-match rendering and camera change, fresh-profile preset selection, and saved A/L, Space, and C bindings for both fresh and existing profiles. Physical two-thumb comfort, sustained play, and multiplayer still need testing. The capacitive pointer is unchanged; default mouse-camera movement is disabled in the Pocket preset.
