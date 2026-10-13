# Exercise 03 — Redirection and pipes

**Goals:** `>`, `>>`, `2>`, `|`, `&&`.

1. Run `ls /etc > etc-list.txt` and inspect the file.
2. Run `ls /no-such-dir 2> errors.log` (expect stderr in file).
3. Chain: `cat sample/access.log | grep "404" | wc -l` using files in `sample/`.
4. Run `mkdir test-dir && touch test-dir/ok.txt` — then try with a failing first command.

**Check:** stdout vs stderr file descriptors (1 and 2).
