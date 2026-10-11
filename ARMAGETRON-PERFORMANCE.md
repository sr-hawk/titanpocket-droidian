# Armagetron performance on the Pocket

The development phone now uses the Mali GPU through native Wayland instead of CPU software rendering. It keeps the full 720 × 720 resolution and the A/L steering controls.

| Renderer | Measured local-match frame rate |
| --- | --- |
| Original software rendering | 34.6–39.9 FPS; median 35.5 |
| GPU rendering with frame pacing | 59.2–60.1 FPS; median 60.0 |

Measured October 9, 2026 using five-second frame-submission samples, discarding the first three startup/menu intervals. The GPU sample covers 50 seconds and the software sample 55 seconds. These are sequential local-match sessions, not a deterministic replay or input-latency test. No graphics-detail reduction or new clock/voltage tuning was used. An earlier uncapped GPU sample showed 77 FPS; the default now paces rendering to approximately 60 FPS.

The app icon uses the new launcher. Controls remain A/L to steer, Space to brake, C for camera, and Back for the menu. Exit normally using **Exit Game**. One test launch after an interrupted session stalled during audio shutdown; closing that process and relaunching recovered it. Normal menu exit and relaunch were subsequently verified.

Full-screen menus, local gameplay, renderer identity, saved controls, normal exit, and desktop-entry relaunch were checked. Long sessions, heat/battery effects, multiplayer, and fresh-install behavior still need testing.

**This GPU runtime is included in the current-07 flash image.** The measurements above came from the development phone; the preceding current-06 was reported working after a full flash. The owner reports current-07 works well. Its frame rate has not been remeasured after the full flash.

The [runtime sources, patch, licenses, and build notes](armagetron-gpu/README.md) document the integration. [GL4ES](https://github.com/ptitSeb/gl4es) supplies desktop OpenGL compatibility over GLES. Its libraries and the modified SDL adapter are private to Armagetron; system graphics libraries are unchanged.
