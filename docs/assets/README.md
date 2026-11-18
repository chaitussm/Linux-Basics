# Screenshot assets for topic notes

Topic markdown lives in [`docs/topics/`](../topics/). Images use **one** relative path:

```markdown
![alt text](../assets/your-file.png)
```

From `docs/topics/someTopic.md`, `../assets/` resolves to this folder (`docs/assets/`).

## Why Ctrl+click says “file not found”

VS Code / Cursor follow the path in the markdown. If the PNG is **not on disk** or **not committed** to git, preview and Ctrl+click fail.

**Fix on your PC:**

1. Put the PNG in **`docs/assets/`** (exact filename must match the markdown).
2. Stage both the `.md` and `.png`: `git add docs/assets/your-file.png docs/topics/yourTopic.md`
3. Commit and push: `git push origin master`

If you only edited markdown locally and never `git add` the PNGs, GitHub and other machines will still show broken links.

## Check all links from the repo root

```bash
bash scripts/file-system-navigation-and-hierarchy/validate-docs-assets.sh
```

## Screencast frames (local only)

Extract frames from `/home/surya/Videos/Screencasts/` — see [`screencastWorkflow.md`](../topics/screencastWorkflow.md). Do **not** commit `.webm` / `.mp4`.