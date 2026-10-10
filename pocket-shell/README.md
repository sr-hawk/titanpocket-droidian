# Pocket physical Home navigation

The Pocket shell hides the home bar. Hiding it alone did not disable the compositor's draggable home surface. This patch sets its drag mode to NONE both at construction and on handle updates. Physical Home still uses the unchanged programmatic state-change path. App scrolling and the capacitive keyboard mouse are separate input paths.

The patch applies to this port's already modified Phosh tree, not pristine upstream. It is GPL-3.0-or-later, subject to Phosh's per-file terms; see ../licenses/GPL-3.0.txt. It is not the complete corresponding source release.

Current-05 also requires successful Pocket first-boot installation before starting Phosh. Installation failures must not silently present a stock desktop. All runtime acceptance tests use full flashes; no live updates are part of release validation.
