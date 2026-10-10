# Licensing this release

Droidian is a distribution of separately licensed components. This project does not assign MIT, GPL, or any other single license to the complete flash image.

## Our original materials

The original prose in this repository's Markdown documents and FLASH.txt, and the independent launcher `armagetron-gpu/armagetronad-pocket`, and the original Pocket Tour code, JSON content, compatibility wrapper, launcher, service override, and installer are available under the [MIT license](LICENSE), to the extent the project contributors hold rights in them. Upstream quotations, notices, code excerpts, and other third-party material are excluded. Future source files are not automatically covered: record their provenance and license when adding them.

## Third-party code and modifications

Keep existing copyright notices and the applicable upstream license. Changes to an upstream program must comply with that program's license; an MIT label on this repository does not replace it.

| Material checked | Applicable licensing / action |
| --- | --- |
| Armagetron controls patch | GPL-2.0-or-later, following the modified Armagetron source headers. [GPL version 2 text](licenses/GPL-2.0.txt). Supply the matching source and build material with the binary release. |
| Private SDL 1.2 compatibility patch/runtime | zlib license; retain [SDL notice](armagetron-gpu/SDL12-COMPAT-LICENSE) and identify the altered version. |
| GL4ES runtime | MIT; retain [upstream notice](armagetron-gpu/GL4ES-LICENSE). |
| Phosh modifications | Main source is GPL-3.0-or-later; its copyright inventory also lists exceptions and differently licensed files. Keep the per-file terms. |
| GTK and related libraries | LGPL and other per-file licenses; check each exact source version, notices, and applicable source/relinking obligations. |
| Linux kernel in boot.img | Linux is GPL-2.0-only with the syscall exception; matching kernel source/build material and component notices require review. A stock binary is not exempt merely because we did not modify it. |
| Debian/Droidian packages | Each package has its own copyright/license record, normally under `/usr/share/doc/<package>/copyright`, with common license texts under `/usr/share/common-licenses`. |
| Android/vendor/firmware binaries | Do not assume MIT or GPL permission. Identify what is actually embedded in our images and establish redistribution rights. Components left on the owner's stock partitions are distinct from binaries we distribute. |
| Scatter and desktop override files | Not covered by our MIT grant pending provenance review; preserve any applicable original terms. |

This is an initial licensing review, not a complete inventory of the image. Choosing GPL for the repository would not resolve missing source or permission for proprietary binaries.

## Before distributing binaries

Record every distributed component's exact version, origin, license, and local modifications. Preserve required notices. Provide the corresponding source and build/install material required by each applicable license, including local patches; a generic upstream homepage or a partial patch collection does not establish compliance. Review the kernel and bundled Android/vendor files as well as userspace. Independent MIT materials may coexist with GPL components, but combined or derivative programs still follow the applicable upstream requirements.

SP Flash Tool and Download Agent binaries are not included, mirrored, or linked for download. The guide only documents our release files and required settings. Tool version/hash information used to reproduce a test is identification, not a download endorsement.

## References

- [Droidian image project](https://github.com/droidian-images/droidian) describes the distribution and its Debian/Mobian base.
- [GNU GPL FAQ: aggregation](https://www.gnu.org/licenses/gpl-faq.en.html#MereAggregation) explains separately licensed programs distributed together.
- [Linux kernel licensing rules](https://docs.kernel.org/process/license-rules.html).
- [Debian copyright documentation requirements](https://www.debian.org/doc/debian-policy/ch-docs.html#copyright-information).

The checked source-tree evidence includes Phosh's `debian/copyright`, GTK3's `debian/copyright`, Armagetron's `src/ui/uMenu.cpp` and `COPYING`, and the GL4ES/SDL notices included here.
