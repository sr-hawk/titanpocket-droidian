# Pocket welcome tour

Current-06 includes the Pocket-specific nine-page tour. It explains physical Home, Fn + Home, keyboard navigation, capacitive scroll/mouse modes, games, and current limitations. The setup page describes storage expansion only; the Pocket system and packages are already installed.

Both original tour paths are replaced in the image: `/usr/bin/phosh-tour` launches `/usr/local/bin/pocket-tour`, and the original application entry is replaced. Package diversions are already registered. The existing first-run service uses the Pocket tour and retains its normal completion tracking.

Python 3, PyGObject, and GTK3 are installed dependencies. Host layout checks passed; this image still requires a full-flash phone test. There is no separate live-update step in the release validation workflow.

Original tour code and content use the scoped MIT license described in ../LICENSING.md. The package staging helper remains source material; current-06 applies replacements during image assembly.
