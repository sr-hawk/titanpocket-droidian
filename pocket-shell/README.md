# Personal Pocket shell baseline

Current-06 installs the recovered personal Phosh binary directly at `/usr/libexec/phosh` during image assembly, with its package diversion already registered. Its SHA256 is `3552548480d53aad23c12f15f8f580610c639097f3cbb09c5aa1549f489262f8`.

This is the tuned Pocket shell with the original personal controls and layout. The extra current-05 drag-mode patch is not part of this image. Physical Home, Fn + Home, and unwanted bottom-swipe behavior must be checked in the full-flash acceptance test.

No Pocket first-boot installation or desktop-conversion service is shipped. The desktop waits for storage preparation. Phosh retains its upstream GPL terms; the overall image is not MIT. Complete corresponding source/build material is still tracked in LICENSING.md and RELEASE-CHECKLIST.md.
