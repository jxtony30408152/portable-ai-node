# 03 · The Six Abilities (the governance core)

Every piece of automation the Node ships must meet all six. This is the original
acceptance standard — governance built in, not bolted on.

    可备份  Backup-able    — any state can be captured and stored.
    可恢复  Recoverable    — you can actually restore from that backup (and have tested it).
    可审计  Auditable      — who changed / deleted what, when, is queryable.
    可校准  Calibratable   — thresholds and rules can be tuned, with the reason logged.
    可进可出 Reversible     — every automation can be added AND removed; no lock-in.
    可迭代  Iterable       — the tools themselves can improve and stay versioned.

## Two hard rules
1. **No automation ships without an off-switch.** "可进可出" is non-negotiable —
   if you can't cleanly turn it off, it doesn't go live.
2. **Untested recovery is only an assumption.** "可恢复" is not green until you have
   actually restored from a backup at least once, for real.

## How to use it
Before any new automation goes live, self-check against all six. Anything not met is
either fixed or **honestly marked as a gap** — never faked green. A system that
self-reports its own gaps is more trustworthy than one that pretends to be complete.
