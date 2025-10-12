# 🧠 Raspberry Pi Task Automation Reference

A quick guide to setting up automated tasks, cron jobs, and output redirection on Raspberry Pi (or any Linux system).

---

## 🕐 1. Cron Basics

Cron is a built-in scheduler that runs commands or scripts at specific times or intervals.

### ✏️ Edit your crontab
```bash
crontab -e
```

### 📜 View your existing jobs
```bash
crontab -l
```

### 💡 Example job
```
* * * * * echo "Hello from cron!" >> /home/pi/cron_test.log 2>&1
```
Runs every minute and writes a message to a log file.

---

## 🧾 2. Cron Time Fields

Each cron line has five time fields followed by the command:

| Field | Meaning        | Example | Range |
|--------|----------------|----------|-------|
| m | Minute | 0–59 | `5` |
| h | Hour | 0–23 | `14` |
| dom | Day of Month | 1–31 | `1` |
| mon | Month | 1–12 | `10` |
| dow | Day of Week | 0–6 (Sun–Sat) | `1` |

Example:  
```
0 7 * * * /usr/bin/python3 /home/pi/script.py
```
→ Runs every day at 7 a.m.

---

## 🏷️ 3. Cron Time Shortcuts (Tags)

You can use shorthand tags instead of `* * * * *`:

| Shortcut | Equivalent | Description |
|-----------|-------------|--------------|
| `@reboot` | — | Run once at startup |
| `@hourly` | `0 * * * *` | Every hour |
| `@daily` / `@midnight` | `0 0 * * *` | Every day at midnight |
| `@weekly` | `0 0 * * 0` | Every week (Sunday midnight) |
| `@monthly` | `0 0 1 * *` | First day of each month |
| `@yearly` / `@annually` | `0 0 1 1 *` | Every January 1 |

Example:
```
@reboot sleep 30 && /usr/bin/python3 /home/pi/startup.py >> /home/pi/startup.log 2>&1
```
→ Runs 30 seconds after boot and logs all output.

---

## 🐍 4. Running a Python Script with Cron

Create your Python file:
```bash
nano /home/pi/cron_test.py
```

```python
#!/usr/bin/env python3
from datetime import datetime

with open("/home/pi/cron_output.txt", "a") as f:
    f.write(f"Script ran at: {datetime.now()}\n")
```

Make it executable:
```bash
chmod +x /home/pi/cron_test.py
```

Schedule it:
```
*/2 * * * * /usr/bin/python3 /home/pi/cron_test.py >> /home/pi/cron_log.txt 2>&1
```

---

## 🔁 5. Delaying Startup Jobs

Sometimes you need to wait until the network is ready:

### Option 1: Delay inside cron
```
@reboot sleep 30 && /usr/bin/python3 /home/pi/startup.py >> /home/pi/startup.log 2>&1
```

### Option 2: Delay inside script
```python
import time; time.sleep(30)
```

---

## 🪣 6. Redirecting Output & Errors

| Symbol | Meaning | Example | Notes |
|---------|----------|----------|-------|
| `>` | Redirect stdout (overwrite) | `echo hi > file.txt` | Replaces file contents |
| `>>` | Redirect stdout (append) | `echo hi >> file.txt` | Adds to file |
| `<` | Read input from file | `python3 < input.txt` | Feed file to program |
| `2>` | Redirect stderr (errors only) | `python3 script.py 2> errors.log` | Keeps normal output separate |
| `2>&1` | Redirect stderr to stdout | `python3 script.py > all.log 2>&1` | Combine both outputs in one file |
| `&>` | Redirect both (shorthand) | `python3 script.py &> all.log` | Same as above in modern shells |

---

## 🧹 7. Debugging Cron Jobs

- Check system logs:
  ```bash
  grep CRON /var/log/syslog | tail
  ```
- Check your log files (if you used `>> ... 2>&1`)
- Ensure all paths are **absolute** (cron doesn’t load your `PATH`)
- Verify the job runs manually before automating it

---

## 🧰 8. Quick Reference Summary

| Task | Crontab Entry | Notes |
|------|----------------|-------|
| Test every minute | `* * * * * echo "Hello" >> ~/test.log 2>&1` | Basic test |
| Python every 2 min | `*/2 * * * * /usr/bin/python3 /home/pi/cron_test.py >> ~/log.txt 2>&1` | Uses full path |
| Run on reboot | `@reboot sleep 30 && /usr/bin/python3 /home/pi/startup.py` | Wait for boot |
| Reboot weekly | `@weekly /sbin/reboot` | Needs root crontab (`sudo crontab -e`) |

