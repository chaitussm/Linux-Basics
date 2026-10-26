# Git: Fixing a Diverged `master` and Pushing

> **Symptom:** `git status -sb` shows `master...origin/master [ahead 1, behind 6]`, and a plain `git push` is rejected.
> **Cause:** local and remote `master` each have commits the other lacks (they have *diverged*).

---

## Table of Contents

1. [Quick Fix (TL;DR)](#1-quick-fix-tldr)
2. [Understand the Problem](#2-understand-the-problem)
3. [Step-by-Step Fix](#3-step-by-step-fix)
   - [Step 1: Check the state](#step-1-check-the-state)
   - [Step 2: Save your work](#step-2-save-your-work)
   - [Step 3: Fetch and inspect the remote](#step-3-fetch-and-inspect-the-remote)
   - [Step 4: Rebase onto the remote](#step-4-rebase-onto-the-remote)
   - [Step 5: Resolve conflicts (if any)](#step-5-resolve-conflicts-if-any)
   - [Step 6: Push](#step-6-push)
   - [Step 7: Verify](#step-7-verify)
4. [Rebase vs Merge](#4-rebase-vs-merge)
5. [Authentication Errors on Push](#5-authentication-errors-on-push)
6. [Things to Never Do](#6-things-to-never-do)
7. [Command Cheat Sheet](#7-command-cheat-sheet)
8. [Troubleshooting Table](#8-troubleshooting-table)

---

## 1. Quick Fix (TL;DR)

```bash
cd ~/Study/Linux-Basics
git add -A && git commit -m "your message"   # save local work
git pull --rebase origin master              # put your commits on top of remote
git push origin master                       # publish
git status -sb                               # verify: no ahead/behind
```

[⬆ Back to top](#table-of-contents)

---

## 2. Understand the Problem

```text
Remote:  A --- B --- C --- D --- E --- F --- G     (origin/master, 6 new commits)
                \
Local:           X                                 (your 1 commit)
```

| Status text | Meaning |
| :-- | :-- |
| `ahead 1` | You have 1 commit the remote does not |
| `behind 6` | The remote has 6 commits you do not |
| both | Diverged, so push is rejected |

After a rebase, your commit is replayed on top of the remote's:

```text
A --- B --- C --- D --- E --- F --- G --- X'
```

[⬆ Back to top](#table-of-contents)

---

## 3. Step-by-Step Fix

### Step 1: Check the state

```bash
git status -sb
```

Look for `[ahead N, behind M]` in the first line.

[⬆ Back to top](#table-of-contents)

### Step 2: Save your work

```bash
git add -A
git commit -m "your message"
```

Or stash instead of committing:

```bash
git stash          # hide uncommitted changes
git stash pop      # bring them back later
```

[⬆ Back to top](#table-of-contents)

### Step 3: Fetch and inspect the remote

```bash
git fetch origin
git log --oneline HEAD..origin/master      # commits you are missing
git log --oneline origin/master..HEAD      # commits only you have
```

[⬆ Back to top](#table-of-contents)

### Step 4: Rebase onto the remote

```bash
git pull --rebase origin master
```

Success looks like: `Successfully rebased and updated refs/heads/master.`

[⬆ Back to top](#table-of-contents)

### Step 5: Resolve conflicts (if any)

1. List the conflicted files: `git status`
2. Edit each file, fix the markers and keep the lines you want:
   ```text
   <<<<<<< HEAD
   remote version
   =======
   your version
   >>>>>>> your commit message
   ```
3. Mark resolved and continue:
   ```bash
   git add <file>
   git rebase --continue
   ```
4. To cancel and return to where you started:
   ```bash
   git rebase --abort
   ```

[⬆ Back to top](#table-of-contents)

### Step 6: Push

```bash
git push origin master
```

[⬆ Back to top](#table-of-contents)

### Step 7: Verify

```bash
git status -sb
```

Expected: `## master...origin/master` with **no** `ahead` or `behind`.

[⬆ Back to top](#table-of-contents)

---

## 4. Rebase vs Merge

| Option | Command | Result |
| :-- | :-- | :-- |
| **Rebase** (recommended) | `git pull --rebase origin master` | Linear history |
| **Merge** | `git pull --no-rebase origin master` | Adds a merge commit |

[⬆ Back to top](#table-of-contents)

---

## 5. Authentication Errors on Push

Error: `fatal: unable to get password from user`

GitHub does not accept account passwords over HTTPS. Pick one option.

**Option A: SSH**

```bash
ssh-keygen -t ed25519 -C "you@example.com"
cat ~/.ssh/id_ed25519.pub        # add at GitHub > Settings > SSH and GPG keys
git remote set-url origin git@github.com:chaitussm/Linux-Basics.git
git push origin master
```

**Option B: GitHub CLI**

```bash
gh auth login
git push origin master
```

**Option C: Personal Access Token (HTTPS)**

Create a token at GitHub > Settings > Developer settings > Personal access tokens, and use it as the password.

```bash
git config --global credential.helper store    # remember it
```

[⬆ Back to top](#table-of-contents)

---

## 6. Things to Never Do

| Avoid | Why |
| :-- | :-- |
| `git push --force` on `master` | Overwrites remote commits |
| `git reset --hard origin/master` before committing | Deletes your local work |

[⬆ Back to top](#table-of-contents)

---

## 7. Command Cheat Sheet

| Goal | Command |
| :-- | :-- |
| Short status | `git status -sb` |
| Fetch remote info | `git fetch origin` |
| Commits I'm missing | `git log --oneline HEAD..origin/master` |
| Commits only I have | `git log --oneline origin/master..HEAD` |
| Rebase onto remote | `git pull --rebase origin master` |
| Abort / continue rebase | `git rebase --abort` / `git rebase --continue` |
| Push | `git push origin master` |
| Preview push | `git diff origin/master --stat` |

[⬆ Back to top](#table-of-contents)

---

## 8. Troubleshooting Table

| Error | Fix |
| :-- | :-- |
| `rejected ... non-fast-forward` | `git pull --rebase origin master`, then push |
| `have diverged` | Same as above |
| `You have unstaged changes` | Commit or `git stash` first |
| `CONFLICT (content)` | See [Step 5](#step-5-resolve-conflicts-if-any) |
| `unable to get password from user` | See [Authentication Errors](#5-authentication-errors-on-push) |

[⬆ Back to top](#table-of-contents)
