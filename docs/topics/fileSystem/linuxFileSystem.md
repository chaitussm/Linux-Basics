# Linux File System

The Linux file system is organized as one directory tree. The tree begins at
the root directory, `/`; disks and other storage are attached somewhere within
that tree rather than appearing as separate drive letters.

> The supplied course link opens a sign-in page here, so these are original
> reference notes on the Linux file system, not a transcript of the lesson:
> [Linux File System course page](https://www.durgasoftonline.com/s/courses/5e7ae04f0cf29f148a043786/take).

For detailed navigation examples, see
[File System Navigation Commands & Linux File System Hierarchy](File%20System%20Navigation%20Commands%20And%20Hierarchy.md).

## Table of contents

- [The directory tree](#the-directory-tree)
- [Common top-level directories](#common-top-level-directories)
- [Absolute and relative paths](#absolute-and-relative-paths)
- [Useful navigation commands](#useful-navigation-commands)
- [Safe path habits](#safe-path-habits)

## The directory tree

```text
/
├── bin       Essential command links or executables
├── dev       Device files
├── etc       System-wide configuration
├── home      Regular users' home directories
├── lib       Essential shared libraries and kernel modules
├── media     Automatic mount points for removable media
├── mnt       Temporary mount points
├── opt       Optional add-on software
├── proc      Process and kernel information (virtual filesystem)
├── root      Home directory for the root administrator
├── run       Volatile runtime data
├── sbin      System administration commands or links
├── srv       Data served by system services
├── sys       Device and kernel information (virtual filesystem)
├── tmp       Temporary files
├── usr       Most user-space applications and shared data
└── var       Frequently changing data, such as logs and caches
```

The exact contents can vary by distribution. On many modern distributions,
`/bin`, `/sbin`, and `/lib` may be links into corresponding directories under
`/usr`.

## Common top-level directories

| Path | Typical purpose |
| :--- | :--- |
| `/` | Root of the complete directory tree |
| `/home` | Parent directory for regular users' personal directories |
| `/root` | Home directory of the root administrator; distinct from `/` |
| `/etc` | System-wide configuration files |
| `/dev` | Device interfaces, including terminal devices |
| `/proc` | Virtual view of process and kernel information |
| `/sys` | Virtual view of devices and kernel objects |
| `/tmp` | Temporary files; cleanup policy depends on the system |
| `/var/log` | Many system and service logs |
| `/usr/bin` | Many user commands and applications |
| `/usr/sbin` | Many system administration commands |
| `/var` | Data that changes while the system runs |
| `/media` and `/mnt` | Common places to mount storage devices |
| `/opt` | Optional, separately packaged software |

These are conventions, not a guarantee that every listed directory contains
the same files on every Linux distribution.

## Absolute and relative paths

An **absolute path** starts at `/`:

```text
/home/alex/Documents/notes.txt
```

A **relative path** starts from the current working directory:

```text
Documents/notes.txt
```

Special path components:

| Component | Meaning |
| :--- | :--- |
| `.` | Current directory |
| `..` | Parent directory |
| `~` | Current user's home directory (expanded by the shell) |
| `-` | Previous working directory when used with `cd -` |

Linux paths are case-sensitive: `Documents` and `documents` can be different
names. The slash `/` separates path components.

## Useful navigation commands

```bash
pwd                 # print the current working directory
ls                  # list visible entries
ls -la              # list all entries, including hidden ones, with details
cd /etc             # move to an absolute path
cd ..               # move to the parent directory
cd ~                # move to your home directory
cd -                # return to the previous working directory
mkdir -p work/demo  # create a directory and missing parents
```

Inspect a path without changing directories:

```bash
ls -ld /var/log
```

For more examples of `pwd`, `cd`, `ls`, and directory hierarchy, see the
[navigation and hierarchy notes](File%20System%20Navigation%20Commands%20And%20Hierarchy.md).

## Safe path habits

- Check your location with `pwd` before running commands that change or remove
  files.
- Use `ls` to inspect a target directory before acting on it.
- Prefer explicit paths when a command's target could be ambiguous.
- Be especially careful with `rm`, wildcard characters such as `*`, and
  administrator privileges such as `sudo`.
- Avoid assuming that a directory's contents or mount layout are identical
  across Linux distributions.
