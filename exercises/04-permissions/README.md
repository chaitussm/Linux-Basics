# Exercise 04 — Permissions

**Goals:** `chmod`, `chown` (with sudo if needed), octal modes.

1. Create `secret.txt` and run `ls -l secret.txt`.
2. Remove read for others: `chmod o-r secret.txt` — verify in another session if possible.
3. Make `run-me.sh` executable: `chmod 755 run-me.sh` and execute it.
4. Decode mode `rwxr-x---` into octal (750).

**Check:** user vs group vs other bits.
