# Private Armagetron GPU runtime

This is local Titan Pocket integration, not an upstream contribution. The SDL adapter changes and launcher were developed with AI assistance and tested on a development Pocket. Review them before reuse.

GL4ES translates the game's desktop OpenGL calls to GLES2. A private SDL 1.2 compatibility build requests a GLES2 context from SDL2, presenting directly through Wayland. The standard EGL/GLES dispatch libraries reach the Android Mali driver through libhybris. System graphics and SDL libraries are not replaced.

Sources and licenses:

- GL4ES: upstream repository and exact revision in `SOURCES.json`; no local changes. MIT license included.
- sdl12-compat 1.2.68: https://github.com/libsdl-org/sdl12-compat/releases/tag/release-1.2.68 ; apply `sdl12-pocket-gles.patch` at its root. zlib license included.
- Existing Armagetron Pocket build and system SDL2/libhybris remain required. This directory does not complete the whole image's corresponding-source release.

Build both libraries with CMake using the existing arm64 cross toolchain and matching Droidian sysroot. GL4ES options: `-DCMAKE_BUILD_TYPE=Release -DHYBRIS=ON`; SDL options: `-DCMAKE_BUILD_TYPE=Release`. Use `-ffile-prefix-map` for local build paths and check resulting artifacts for personal paths before distribution. The SDL patch adds an opt-in GLES2 context and optional frame-rate diagnostics; other applications need not opt in.

Stage GL4ES's `lib/libGL.so.1` as `/opt/armagetron/lib/gl4es/libGL.so.1`, and the patched SDL `libSDL-1.2.so.1.2.68` as `/opt/armagetron/lib/gl4es/libSDL-1.2.so.0`. Stage the executable launcher at `/opt/armagetron/bin/armagetronad-pocket`. Directories must be mode 755. The desktop entry must use `Exec=/opt/armagetron/bin/armagetronad-pocket -f`. Include both license files with the runtime.

The launcher disables libdecor because its missing-plugin fallback stalled window creation on this phone. It disables GL4ES's initial separate-context probe because SDL owns the native Wayland context. GL4ES therefore reports an unknown renderer; the SDL adapter logs the actual GLES renderer instead. GL4ES uses conservative extension defaults with that probe disabled.

Set `POCKET_FPS=1` when launching to log submitted frames over five-second intervals. This is not a measurement of panel refresh or input latency. Set `POCKET_SOFTWARE_GL=1` when invoking the launcher for the original X11/software path. User control bindings are shared by both paths.

This runtime is included in current-06. Fresh-install, long-session, thermal/battery, and multiplayer validation remain outstanding.
