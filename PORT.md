# GitHub sandbox port

This draft targets `jacob-vincent-mink/omarchy-github:main`, not the original repository. It depends on [the independent Rust sandbox runtime](https://github.com/jacob-vincent-mink/omarchy/pull/3).

## Plugin changes

`manifest.json` adds sandbox requests for fourteen exact own-settings read/write keys, browser/webapp links, and eleven selectable `/usr/bin/gh` command-tree leaves. The tree spells out the original helper's sign-in check, REST endpoints, exact GraphQL documents and bounded variables. The two notification-write leaves are separately selectable from reads.

`omarchy-github-fetch` selects the literal argv prefix `/bootstrap --exec gh` when running in the worker, including its parallel Actions jobs. Standalone execution still calls `gh` directly. A declined sign-in selection produces an actionable message. This snapshot check is for feedback only; the broker owns authorization. There is no `gh` shim, PATH override, replacement API client or plugin-specific Rust provider. The original queries, pagination, aggregation, filters and notification-boundary logic remain in the original helper. Plugin QML is unchanged.

The manifest requests access; user selection approves an exact revision, executable digest and command leaves. The worker has neither real credentials nor direct network access. Approved host-side `gh` jobs use the user's normal CLI authentication and network access. Exec is delegated host authority: argument matching does not sandbox the CLI's application semantics, dependencies, configuration or delegated effects. A future CLI byte change requires reapproval.

## Evidence

The original helper, panel-source and service-source test suites pass. A private integration experiment ran this helper in the actual worker and the installed `gh` in supervised host jobs, with fake credentials, an account-free local API and an empty Internet namespace. Three ten-case runs passed after adopting direct bootstrap calls: ordinary access, read-only selection and declined sign-in. These exercise repository/notification/Actions pagination, filters, authored PR rollups, scan modes and limits, single/bulk writes and rejected extra authority. Read-only selection produced no API writes; declined sign-in produced no API calls. Logged-out, partial-error and rate-limit cases passed earlier through the same broker with the since-removed forwarding shim and need a current-port rerun.

Private-display preparation also rendered the original dashboard with fixture data and exercised original settings controls. The current fourteen-key settings contract passed a complete six-control save/reopen/full-host-restart trial on 2026-09-09. A second run selected only reads: attempted edits visibly rolled back, the bounded notice named the unwritable setting, and unchanged defaults survived restart. The original QML and manifest were copied byte-for-byte, real pointer/keyboard input operated the controls, and the original shell writer preserved unselected settings and unrelated configuration. Saved, reopened, restored and declined render states were inspected. All settings-helper and IPC routes pointed to a disposable host; no live settings or real inbox state was changed. These experiments do not claim real-account or full original-panel acceptance.

## Remaining work

Finish current-port keyboard/filter/link and bulk-confirmation UI verification, both browser modes, real host bar placement and popup coordination, and the authorized desktop demonstration. Experiments and fake account fixtures are intentionally not committed. This draft demonstrates the permission model and source delta; it is not a feature-parity or release-security claim.
