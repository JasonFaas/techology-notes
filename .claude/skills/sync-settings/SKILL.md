---
name: sync-settings
description: Scan settings.local.json files across ~/Code repos and suggest moving shared permissions into techology-notes/.claude/settings.json
allowed-tools: Bash(find *), Bash(git -C * ls-files *), Bash(git -C * rev-parse *), Bash(python3 *), Read, Glob, Edit
---

# Sync Settings — Consolidate settings.local.json into Versioned Config

`settings.local.json` is the per-user, non-committed layer of Claude Code project config. Over time these accumulate across repos with overlapping permissions. The goal of this skill is to surface those entries and move shared ones into the versioned `techology-notes/.claude/settings.json`, which is the designated home for personal Claude config that applies across projects.

---

## Step 1: Find all settings.local.json files

```bash
find "$HOME/Code" -maxdepth 4 -name "settings.local.json" -path "*/.claude/*" | sort
```

Read every file found.

Also read the current target:
```
$HOME/Code/1/techology-notes/.claude/settings.json
```

---

## Step 2: Analyze each file

For each `settings.local.json`, note which repo it belongs to and categorize its entries:

- `permissions.allow` — tool/MCP permissions that skip the prompt
- `permissions.deny` — safety guardrails
- `hooks` — automated behaviors
- `extraKnownMarketplaces` / `enabledPlugins` — plugin config
- other top-level keys (e.g. `tui`, `model`)

---

## Step 3: Report and recommend

Print a report with:

**Files found** — list each path.

**For each entry in each file**, recommend one of:

| Destination | When |
|-------------|------|
| **techology-notes `settings.json`** | Permissions that are useful across projects — MCP tools (Jira, Slack, Atlassian), general read/write operations, cross-repo patterns |
| **Keep in `settings.local.json`** | Genuinely machine-specific or per-project-only entries that shouldn't be versioned |

Entries fall into three buckets:

1. **Already in techology-notes** — duplicate, remove from `settings.local.json`
2. **Should move to techology-notes** — cross-project value, move it
3. **Keep in `settings.local.json`** — genuinely machine-specific or repo-specific

Format as a table:

| Entry | Source file | Action | Reason |
|-------|------------|--------|--------|
| `mcp__atlassian__atlassianUserInfo` | `devops/settings.local.json` | Move to techology-notes | Atlassian access useful everywhere, not devops-specific |

**Proposed changes** — show exact JSON for each affected file before touching anything.

---

## Step 4: Apply on confirmation

Ask: "Apply these changes?"

If yes, for each `settings.local.json`:
1. Remove any entries that are already in `techology-notes/.claude/settings.json`
2. Remove any entries being moved to `techology-notes/.claude/settings.json`, then add them there
3. If a `settings.local.json` is now empty (`{}` or only empty `permissions: {}`), delete the file

**Do not commit any changes.** The techology-notes settings changes will be reviewed and committed separately.
