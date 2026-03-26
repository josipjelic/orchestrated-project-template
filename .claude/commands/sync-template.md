Sync the `.claude/` directory from the upstream orchestrated-project-template repository into this project. Follow these steps exactly:

## Steps

### 1. Fetch the upstream template

Run:
```bash
SYNC_TMP=$(mktemp -d /tmp/template-sync-XXXXXX)
git clone --filter=blob:none --sparse https://github.com/josipjelic/orchestrated-project-template "$SYNC_TMP" 2>&1
cd "$SYNC_TMP" && git sparse-checkout set .claude
```

If the clone fails (no internet, repo moved, etc.) stop immediately and report the error.

### 2. Show a diff summary

Compare `$SYNC_TMP/.claude/` against the project's `.claude/` directory and report:
- **New files** — present in upstream but not locally
- **Modified files** — present in both but with different content
- **Local-only files** — present locally but not in upstream (these will be **kept unchanged**)

If there are no changes, say so and skip to clean-up.

### 3. Ask for confirmation

Present the diff summary and ask the user: "Apply these changes? (yes/no)"

Do not proceed until the user confirms.

### 4. Apply the changes

Copy all files from `$SYNC_TMP/.claude/` into the project's `.claude/` directory:
- **Overwrite** files that exist in both
- **Add** files that are new in upstream
- **Do not delete** any local files that don't exist upstream — they may be project-specific customisations

Use `cp -r "$SYNC_TMP/.claude/." .claude/` from the project root.

### 5. Report

List each file that was added or updated.

### 6. Clean up

Remove the temp directory: `rm -rf "$SYNC_TMP"`
