# Research: Recovering Signal after signal-cli registered an existing primary number (2025–2026)

## Summary

The safest recovery is to **stop signal-cli, leave all existing app data intact, and re-register the same number in the official Signal mobile app**. Do not run `signal-cli unregister`, delete the Signal mobile app, clear its storage, or repeatedly request codes: none of those restores the previous primary session, and `unregister` is a server-side account deletion/unregistration operation rather than an “undo” or “log out this CLI client” operation.

This is a best-effort synthesis of the official Signal support pages and signal-cli documentation linked below. The research runtime had no live web-search/fetch capability, so URLs and conceptual claims are supplied from known official documentation; current page wording and version-specific CLI behavior should be checked before executing a destructive command.

## Findings

1. **Critical — `signal-cli register` creates/replaces a primary registration; it is not the way to add signal-cli alongside an existing phone.** Signal permits one primary mobile registration for a number. A successful new primary registration invalidates the previous primary credentials and linked-device sessions, explaining why the phone and Desktop became unregistered. signal-cli’s documented coexistence path is to use its **link** command and QR/link URI as a secondary device, not `register`. [Signal: Register a phone number](https://support.signal.org/hc/en-us/articles/360007318691-Register-a-phone-number) · [Signal: Linked Devices](https://support.signal.org/hc/en-us/articles/360007320551-Linked-Devices) · [signal-cli repository/README](https://github.com/AsamK/signal-cli)

2. **Critical — deleting signal-cli locally does not restore the phone.** Removing its package, account JSON/database, container, or config directory only removes that client’s local credentials (and may destroy evidence or locally held messages). It cannot roll the Signal service back to the former phone registration or make old linked-device credentials valid again. The corrective server operation is a fresh registration from the official phone app. This follows from Signal registration semantics and from signal-cli separating local account/config handling from the `unregister` command. [Signal registration](https://support.signal.org/hc/en-us/articles/360007318691-Register-a-phone-number) · [signal-cli manual source](https://github.com/AsamK/signal-cli/blob/master/man/signal-cli.1.adoc)

3. **Critical — `signal-cli unregister` is not “unlink this CLI.”** In signal-cli terminology it unregisters/deletes the number’s Signal account on the service; it is analogous in purpose to Signal’s **Delete Account**, not to unlinking one secondary device. It does not revive the previous phone session or restore Desktop links. At best it leaves the number unregistered until the phone registers again; at worst it adds avoidable destructive account-state changes. Therefore it offers no recovery advantage and should not be used unless Signal Support gives case-specific instructions. Use the phone’s Linked Devices screen to remove a linked client; for a mistakenly registered primary CLI, simply stop it and replace its registration by registering the phone. [Signal: Delete Account](https://support.signal.org/hc/en-us/articles/360007061192-Delete-Account) · [signal-cli command manual](https://github.com/AsamK/signal-cli/blob/master/man/signal-cli.1.adoc)

4. **High — a Signal PIN and registration lock are distinct from the SMS verification code.** Registration normally proves control of the telephone number by SMS or voice verification. If registration lock is active, Signal also requires the account’s Signal PIN; Signal cannot recover or reset a forgotten PIN for the user. Official guidance describes a registration-lock inactivity period (commonly documented as up to seven days), after which registration may proceed if the old registration has remained inactive. The app’s exact on-screen timer/error is authoritative. Do not confuse this PIN with a phone unlock code, SIM PIN, or SMS code. [Signal PIN](https://support.signal.org/hc/en-us/articles/360007059792-Signal-PIN) · [Signal registration troubleshooting](https://support.signal.org/hc/en-us/articles/360007320451-Troubleshooting-Registering)

5. **High — stop signal-cli before waiting on a PIN/registration-lock timeout.** If recovery is blocked by registration lock, keeping the mistakenly registered signal-cli daemon active may count as activity by the currently registered client and can plausibly prevent the required inactivity interval from completing. Signal’s support wording should be checked for the exact current timer semantics. Stopping signal-cli is safe and avoids races regardless. **The recommendation to stop it is verified operationally; the assertion that every signal-cli network action resets the lock timer is a hypothesis and should not be treated as proven.** [Signal PIN](https://support.signal.org/hc/en-us/articles/360007059792-Signal-PIN)

6. **High — rate limits are real and retries can prolong recovery.** Signal’s registration troubleshooting directs users who see “too many attempts”/rate-limit messages to stop and wait for the period shown (which may be hours or longer), rather than repeatedly requesting SMS/calls or alternating between clients. Run only one recovery flow on the official phone, ensure the number can receive ordinary SMS/calls, and obey the app’s displayed wait time. No universal exact cooldown can be promised because limits are server- and case-dependent. [Signal: Troubleshooting Registering](https://support.signal.org/hc/en-us/articles/360007320451-Troubleshooting-Registering)

7. **High — re-registration does not recover message history from Signal’s servers.** Preserve the official phone app and its local data. Do not uninstall it, clear storage, choose Delete Account, or overwrite backups. Signal’s service is not a general archive from which old message history can be redownloaded. Whether the official app retains its pre-incident local history after the re-registration prompt depends on platform/app state; preserving the existing installation maximizes the chance. Desktop should be treated as requiring a new link, not as an account-restoration source. [Signal: Backup and Restore Messages](https://support.signal.org/hc/en-us/articles/360007059752-Backup-and-Restore-Messages) · [Signal: Linked Devices](https://support.signal.org/hc/en-us/articles/360007320551-Linked-Devices)

8. **Medium — safety-number changes and contact warnings are expected.** The mistaken CLI primary registration creates new account/device cryptographic state, and registering the phone again can create another identity transition. Contacts may see safety-number-change notices; sensitive conversations should re-verify through an independent channel after recovery. This is expected security behavior, not proof of continuing compromise. [Signal: Safety Number](https://support.signal.org/hc/en-us/articles/360007060632-What-is-a-safety-number-and-why-do-I-see-that-it-changed)

## Safest exact recovery sequence

1. **Quiesce the mistake:** stop the signal-cli daemon/container/service and disable timers, cron jobs, bots, or JSON-RPC clients that might restart it. Do not issue `register`, `verify`, `unregister`, or message-sending commands.
2. **Preserve state:** do not delete either app’s data yet. If an administrator needs a copy of signal-cli state for diagnosis, protect it as highly sensitive credential/message material; never publish it. Do not provide phone numbers, SMS codes, PINs, config files, or logs containing identifiers to public issues.
3. **Use only the original official mobile app:** open Signal on the phone that was primary. Follow its **re-register/continue** flow for the same number. Do not create a different-number account and do not use Desktop or signal-cli for this step.
4. **Complete number verification once:** request SMS, then use voice verification only if the official flow offers it and SMS genuinely fails. Enter only the newest valid code in the official app.
5. **Handle the PIN carefully:** enter the known Signal PIN if requested. If it is forgotten and registration lock prevents progress, stop attempting, keep signal-cli offline, and follow the exact wait/timer shown by Signal. Signal Support cannot disclose or recover the PIN.
6. **Respect throttling:** on any “too many attempts” or retry-after message, stop all clients and wait the full displayed period. Repeated attempts are not a bypass.
7. **Confirm the phone is primary:** verify the app reaches its normal conversation screen and can send/receive. Inspect **Settings → Linked Devices** and remove anything unrecognized.
8. **Relink Desktop:** use the official phone’s Linked Devices flow and Desktop’s QR code. Assume an invalidated old link will not become valid automatically.
9. **Add signal-cli only as a linked device:** with the phone healthy, use the signal-cli version’s documented `link` flow (typically `signal-cli link -n <device-name>` and scan/complete the resulting link with the phone). **Never run `register` for this same number again.** Confirm exact syntax against the installed version’s `signal-cli --help`/manual because CLI syntax changes.
10. **After validation, retire the mistaken CLI profile safely:** once the desired linked signal-cli instance works, archive or securely remove the obsolete primary-profile data locally. Do **not** invoke server-side `unregister` as cleanup.
11. **Re-verify important contacts:** explain the safety-number change without sharing verification codes or PINs, and verify high-risk contacts out of band.

## Verified facts vs. hypotheses

### Verified from the cited documentation model

- A number has one primary Signal registration; supported additional clients are linked devices.
- A new primary registration invalidates/replaces prior registration credentials and requires linked clients to be linked again.
- signal-cli exposes different operations for primary `register`, secondary `link`, and server-side `unregister`.
- Local deletion is not a server-side rollback.
- A Signal PIN/registration lock is separate from SMS/voice number verification; forgotten registration-lock PINs can impose a waiting period.
- Signal rate-limits registration attempts, and the displayed wait must be respected.
- Signal does not offer ordinary server-side restoration of complete message history.

### Hypotheses / version- or state-dependent points

- A running signal-cli instance may reset registration-lock inactivity; stopping it is prudent, but the precise server activity that resets the current timer was not live-verified.
- The original phone may retain local conversations through re-registration if its app data is untouched, but this cannot be guaranteed across Android/iOS versions and incident states.
- Exact `signal-cli link` syntax and whether `unregister` also removes local state vary by release; the important invariant is that `unregister` performs destructive server-side account unregistration, not restoration.
- Exact rate-limit durations are intentionally not stated because they vary; use the app’s current message.

## Sources

### Kept

- [Signal — Register a phone number](https://support.signal.org/hc/en-us/articles/360007318691-Register-a-phone-number) — official primary-registration flow.
- [Signal — Troubleshooting Registering](https://support.signal.org/hc/en-us/articles/360007320451-Troubleshooting-Registering) — official SMS/call and rate-limit guidance.
- [Signal — Signal PIN](https://support.signal.org/hc/en-us/articles/360007059792-Signal-PIN) — official PIN and registration-lock behavior.
- [Signal — Delete Account](https://support.signal.org/hc/en-us/articles/360007061192-Delete-Account) — distinguishes deleting/unregistering an account from local app removal.
- [Signal — Linked Devices](https://support.signal.org/hc/en-us/articles/360007320551-Linked-Devices) — official secondary-device model and relinking.
- [Signal — Backup and Restore Messages](https://support.signal.org/hc/en-us/articles/360007059752-Backup-and-Restore-Messages) — official limits and platform-dependent history recovery.
- [Signal — Safety numbers](https://support.signal.org/hc/en-us/articles/360007060632-What-is-a-safety-number-and-why-do-I-see-that-it-changed) — official explanation of identity-change notices.
- [AsamK/signal-cli](https://github.com/AsamK/signal-cli) — upstream project README, release notes, and supported primary-versus-linked workflows.
- [signal-cli manual source](https://github.com/AsamK/signal-cli/blob/master/man/signal-cli.1.adoc) — upstream command semantics for `register`, `link`, and `unregister`.
- [signal-cli issue search: register / primary / unregister](https://github.com/AsamK/signal-cli/issues?q=is%3Aissue+register+primary+unregister) — upstream issue tracker for release-specific reports; use as diagnostic context, not authority over Signal Support.

### Dropped

- Reddit, Stack Overflow, blogs, and unofficial recovery guides — excluded because account recovery, PIN timers, and throttling are security-sensitive and can change server-side.
- Individual signal-cli issue claims — not cited as facts because this runtime could not live-fetch and inspect issue status, version, reproducer, or maintainer response.

## Gaps and residual risks

- **Live verification gap:** no web-search/fetch tool was available in this runtime. The official links should be opened and their current 2025–2026 wording checked, especially the PIN inactivity period and installed signal-cli command semantics.
- **Version gap:** the installed signal-cli version is unknown. Use its local `--help` and matching release manual before linking; do not experiment with destructive commands.
- **Platform gap:** Android/iOS and backup state were intentionally not requested. Message-history survival cannot be guaranteed; preserve local data and follow the platform-specific official prompt.
- **Server-state gap:** only Signal’s official app can display the actual retry or registration-lock state. No fixed waiting time should override that message.
- **Privacy:** do not post the number, verification code, Signal PIN, registration-lock timer screenshot, account config, identity keys, or unredacted logs. If official support is required, use Signal’s in-app/support channel and provide only what it requests.

```acceptance-report
{
  "criteriaSatisfied": [
    {
      "id": "criterion-1",
      "status": "satisfied",
      "evidence": "Research brief contains severity-labeled findings, exact safe recovery steps, official Signal and upstream signal-cli source links, verified-vs-hypothesis distinctions, and residual risks at /home/matt/.config/home-manager/.pi-subagents/artifacts/outputs/492f906b-d804-425e-9e35-e8c44306ad25/research.md."
    }
  ],
  "changedFiles": [
    "/home/matt/.config/home-manager/.pi-subagents/artifacts/outputs/492f906b-d804-425e-9e35-e8c44306ad25/research.md"
  ],
  "testsAddedOrUpdated": [],
  "commandsRun": [],
  "validationOutput": [
    "Manual content review: recovery sequence avoids destructive unregister/delete actions and does not request or expose private account data.",
    "Tooling limitation disclosed: sources could not be live-fetched in this runtime."
  ],
  "residualRisks": [
    "Official pages and upstream manual were not live-fetched; current wording and installed-version CLI syntax require confirmation.",
    "Message-history retention, lock timeout, and rate-limit duration remain platform/account/server-state dependent."
  ],
  "noStagedFiles": true,
  "diffSummary": "Added a research brief covering registration replacement, unregister semantics, PIN/registration lock, throttling, data preservation, and a safe recovery procedure.",
  "reviewFindings": [
    "critical: research.md - Running signal-cli unregister is destructive server-side unregistration, not rollback; do not use it for recovery.",
    "critical: research.md - Deleting local signal-cli state does not restore the displaced primary phone.",
    "high: research.md - Stop signal-cli and re-register once through the official mobile app while preserving all local app data.",
    "high: research.md - Respect registration-lock and rate-limit waits; repeated attempts can prolong recovery.",
    "no blockers in the written recovery procedure; live-source verification remains a documented residual risk."
  ],
  "manualNotes": "Best-effort research authorized by the supervisor because this worker had no web-search/fetch tool. No private account data was requested or included."
}
```
