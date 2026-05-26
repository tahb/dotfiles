<!-- rtk-instructions v2 -->
# RTK

Prefix all commands with `rtk` — always safe, passes through if no filter. Use in `&&` chains: `rtk cmd1 && rtk cmd2`.

Non-obvious: `rtk err <cmd>` (errors only), `rtk log <file>` (deduped), `rtk summary <cmd>`, `rtk gain` (stats), `rtk proxy <cmd>` (bypass filter).
<!-- /rtk-instructions -->
