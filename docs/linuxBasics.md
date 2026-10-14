# Linux Basics — Study Index

*Durga Sir — [YouTube playlist](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY)*

Each topic has its own **`.md` file** under [`topics/`](topics/). **All runnable examples** live in [`../scripts/`](../scripts/) as **`.sh`** files.

**Table of contents**

- [Linux Basics — Complete Study Guide](#linux-basics--complete-study-guide)
- [Course map (Session 1 overview)](#course-map-session-1-overview)
- [Why Linux matters (Session 1)](#why-linux-matters-session-1)
- [1. Introduction to UNIX and Linux](#1-introduction-to-unix-and-linux)
  - [1.1 What is Unix / Linux?](#11-what-is-unix--linux)
  - [1.2 Operating system role](#12-operating-system-role)
  - [1.3 Key features (interview-friendly)](#13-key-features-interview-friendly)
  - [1.4 Unix vs Linux](#14-unix-vs-linux)
  - [1.5 Flavors (distributions)](#15-flavors-distributions)
  - [1.6 Architecture](#16-architecture)
- [2. Linux installation (overview)](#2-linux-installation-overview)
- [3. File system hierarchy and navigation](#3-file-system-hierarchy-and-navigation)
  - [3.1 Essential commands](#31-essential-commands)
  - [3.2 Informational commands (Part 1)](#32-informational-commands-part-1)
- [4. Working with files](#4-working-with-files)
  - [4.1 Comparing files](#41-comparing-files)
  - [4.2 Links](#42-links)
  - [4.3 Sort and unique](#43-sort-and-unique)
- [5. Redirection, pipes, and command line](#5-redirection-pipes-and-command-line)
- [6. Wildcards and regular expressions](#6-wildcards-and-regular-expressions)
  - [6.1 `cut`](#61-cut)
  - [6.2 `find` and `locate`](#62-find-and-locate)
  - [6.3 Command aliasing](#63-command-aliasing)
- [7. Compression and archives](#7-compression-and-archives)
- [8. Permissions, ownership, editors](#8-permissions-ownership-editors)
  - [8.1 Permission model](#81-permission-model)
  - [8.2 Editors](#82-editors)
- [9. Documentation](#9-documentation)
- [10. Shell scripting (Part 2 summary)](#10-shell-scripting-part-2-summary)
- [11. SED (stream editor)](#11-sed-stream-editor)
- [12. AWK](#12-awk)
- [13. Linux administration basics (Part 3)](#13-linux-administration-basics-part-3)
  - [13.1 Job scheduling — cron](#131-job-scheduling--cron)
  - [13.2 User and group management](#132-user-and-group-management)
  - [13.3 Remote access](#133-remote-access)
  - [13.4 Processes](#134-processes)
  - [13.5 Packages (Debian/Ubuntu example)](#135-packages-debianubuntu-example)
  - [13.6 Job control](#136-job-control)
  - [13.7 Other topics (as time permits in course)](#137-other-topics-as-time-permits-in-course)
- [14. Quick reference — Session 1 checklist](#14-quick-reference--session-1-checklist)

---

## Video index

| # | Topic files | Video |
| :---: | :--- | :--- |
| 1 | [introduction-to-unix-linux.md](topics/introduction-to-unix-linux.md), [course-overview.md](topics/course-overview.md) | [Session 1](https://www.youtube.com/watch?v=txRD_bK062Y&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=1) |
| 2 | [**Components of Unix.md**](topics/Components%20of%20Unix.md) (+ more topic files as added) | [Session 2](https://www.youtube.com/watch?v=2zfh8eC7cY0&list=PLd3UqWTnYXOloH0vWBs4BtSbP84WcC2NY&index=2) |

---

## All topics (by file name)

| File | Subject |
| :--- | :--- |
| [course-overview.md](topics/course-overview.md) | Curriculum Parts 1–3, why Linux matters |
| [introduction-to-unix-linux.md](topics/introduction-to-unix-linux.md) | Unix/Linux intro, features, distros, architecture |
| [**Components of Unix.md**](topics/Components%20of%20Unix.md) | Shell, kernel, execution flow, first script (Video 2) |

---

## Run examples (Ubuntu + VS Code terminal)

```bash
cd /path/to/Linux-Basics
chmod +x scripts/*.sh
bash scripts/unixclasses-walkthrough.sh
```

See **[scripts/README.md](../scripts/README.md)** for the full script list.
