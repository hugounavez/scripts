# Linux Processes and Shell Configuration — Summary

This document summarizes the key concepts we covered about Linux process management, shell initialization files, and cron jobs as discussed during the Raspberry Pi exploration.

---

## 1. Listing Processes
- **Command:** `ps aux` — displays all running processes with details.
- `ps` itself appears in the list because it’s alive when it takes the snapshot, then exits immediately after printing.
- Other useful tools: `top`, `htop` (interactive), `pstree -p` (tree view).

---

## 2. Important Columns in `ps aux`
- **VSZ (Virtual Set Size):** total virtual memory the process can access (includes code, libraries, etc.), often larger than actual memory used.
- **RSS (Resident Set Size):** actual physical RAM currently in use by the process.
- **TTY:** the terminal associated with the process. Background services show `?`.
- **STAT:** shows process state and flags:
  - `R` = Running
  - `S` = Sleeping (waiting for input/event)
  - `D` = Uninterruptible sleep (I/O wait)
  - `T` = Stopped (paused)
  - `Z` = Zombie (finished but not cleaned up)
  - Flags: `s` = session leader, `+` = foreground, `l` = multithreaded, `<` = high priority, `N` = low priority.

---

## 3. Types of Processes
- **Kernel threads:** shown in square brackets `[ ]`, handle low‑level hardware tasks.
- **System processes & daemons:** e.g., `systemd`, `cron`, `sshd`, `NetworkManager`, `wpa_supplicant`, `dockerd`.
- **User sessions:** e.g., your `bash` shell, interactive commands.
- **Container processes:** e.g., `containerd`, `dockerd` running in background.

---

## 4. Shell Startup Files
- **`~/.bashrc`**: runs for **interactive bash shells** (like opening a terminal or SSH). Used for aliases, prompt tweaks, shell‑only variables.
- **`~/.profile`**: runs for **login shells** of any POSIX shell. Used for environment variables (`PATH`, `LANG`) and login startup commands.
- **`~/.bash_profile`**: bash‑specific login file; often just sources `.bashrc`.
- System‑wide equivalents:
  - `/etc/bash.bashrc`
  - `/etc/profile`
  - `/etc/zsh/zshrc` (if using Zsh)

---

## 5. Cron Jobs and Non‑Interactive Shells
- Cron runs jobs in the background **without a terminal (TTY)**.
- Cron spawns a minimal shell (`/bin/sh` by default) at scheduled times — *“spawn” means **create a new process***.
- `.bashrc` is **not loaded** because the shell is non‑interactive.
- `.profile` is the right place for environment variables needed by cron jobs or GUI programs.
- To use `.bashrc` settings in cron, you can source it in the cron command:
  ```bash
  * * * * * . $HOME/.bashrc; my_command
  ```

---

## 6. Glossary
- **Spawn:** to create/start a new process (from the English biological term “to spawn = to generate life”). In Linux this is done by `fork` + `exec`.
- **Fork:** OS creates a child process as a copy of the parent.
- **Exec:** replaces the child’s memory with the new program to run.

---

## 7. Key Takeaways
- `ps aux` is a snapshot that can include the `ps` command itself.
- Kernel threads do most low‑level work; userland processes are daemons and shells.
- Use `.profile` for environment setup that must always apply (login shells, cron, GUI).
- Use `.bashrc` for interactive shell conveniences (aliases, prompt, shell functions).
- Cron jobs don’t have a TTY; they inherit only a minimal environment.

---
