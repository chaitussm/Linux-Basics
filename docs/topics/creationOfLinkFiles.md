# Creation of Link Files (hard and symbolic links)

**Syllabus #8** · [workingWithFiles.md](workingWithFiles.md)  
**Course:** [Durga Soft online](https://www.durgasoftonline.com/s/courses/5e7ae04f0cf29f148a043786/take)

**Source recording:** `/home/surya/Videos/Screencasts/<your-screencast>.webm`  
**Policy:** [screencastWorkflow.md](screencastWorkflow.md)  
**Related:** [TypesOfFilesInLinux.md](TypesOfFilesInLinux.md) (link file type)

---

**Table of contents**

- [1. Why links exist](#1-why-links-exist)
- [2. Hard link — `ln target linkname`](#2-hard-link--ln-target-linkname)
- [3. Symbolic (soft) link — `ln -s target linkname`](#3-symbolic-soft-link--ln--s-target-linkname)
- [4. Compare hard vs soft (class table)](#4-compare-hard-vs-soft-class-table)
- [5. Practice questions](#5-practice-questions)

---

## 1. Why links exist

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/creationOfLinkFiles-intro-class.png`

**My observation:**

> **Pending:** `../assets/creationOfLinkFiles-intro-my.png`

---

## 2. Hard link — `ln target linkname`

```bash
ln original.txt hardlink.txt
ls -li original.txt hardlink.txt
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/creationOfLinkFiles-hard-class.png`

**My observation:**

> **Pending:** `../assets/creationOfLinkFiles-hard-my.png`

---

## 3. Symbolic (soft) link — `ln -s target linkname`

```bash
ln -s /path/to/file shortcut
ls -l shortcut
```

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/creationOfLinkFiles-soft-class.png`

**My observation:**

> **Pending:** `../assets/creationOfLinkFiles-soft-my.png`

---

## 4. Compare hard vs soft (class table)

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/creationOfLinkFiles-compare-class.png`

**My observation:**

> **Pending:** `../assets/creationOfLinkFiles-compare-my.png`

---

## 5. Practice questions

**Durga Sir class lab screenshot:**

> **Pending:** `../assets/creationOfLinkFiles-mcq-class.png`

**My observation:** One screenshot.