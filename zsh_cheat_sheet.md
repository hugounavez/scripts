# 🖥️ Zsh & Terminal Cheat Sheet

A curated guide to help you **master the terminal and improve productivity** 

---

## 🟢 1. Navigation & File Ops
```zsh
pwd                      # Show current directory
cd -                     # Back to previous directory
cd ~/Projects            # Jump to folder
ls -lh                   # Long listing with sizes
ls -la                   # Show hidden files
tree -L 2                # Directory tree (brew install tree)
mkdir -p src/utils       # Create nested dirs
touch main.go            # Create empty file
cp -r config/ backup/    # Copy folder
mv old.txt new.txt       # Rename or move
rm -rf dist/             # Remove directory (⚠️)
du -sh *                 # Show size of folders/files
```

---

## 🔥 2. Zsh Power Features
```zsh
# History navigation
ctrl + r          # Search past commands
!!                # Repeat last command
sudo !!           # Re-run last command as sudo
!git              # Repeat last command starting with "git"

# Aliases (in ~/.zshrc)
alias ll='ls -lah'
alias gs='git status'
alias gc='git commit -m'
alias ga='git add .'
alias gco='git checkout'

# Directory shortcuts
alias proj='cd ~/Projects'
alias desk='cd ~/Desktop'

# Options (in ~/.zshrc)
setopt autocd                # cd by just typing dir name
setopt correct               # Suggest correction for typos
autoload -U compinit && compinit   # Smart tab completion
```

---

## 🟡 3. Git & Version Control
```zsh
gs                           # Git status (via alias)
git diff                     # Show changes
git log --oneline --graph    # Branch history
git branch -vv               # Show branches and tracking info
git checkout -b feature/api
git commit -am "Fix bug"
git stash / git stash pop    # Save & restore changes
git cherry-pick <hash>       # Apply specific commit
git reset --hard HEAD~1      # Drop last commit
git reflog                   # Recover lost commits
git grep "TODO"              # Search in repo
```

---

## 🔵 4. Build, Run, Debug
```zsh
# Common build tools
make build                   # Run Makefile target
make test                    # Run tests
go build ./...                # Golang build
npm run build                # Node build
mvn package                  # Java Maven
docker build -t app .        # Docker build

# Process control
ps aux | grep node            # Find process
kill -9 <PID>                 # Kill process
htop                          # Interactive process monitor (brew install htop)

# Logs
tail -f /var/log/syslog       # Stream logs
less +F app.log               # Follow log like tail
journalctl -u nginx           # View service logs (Linux)
```

---

## 🟣 5. Search & Inspect
```zsh
grep -R "function main" .                 # Search recursively
grep -Rin "error" ./src                   # Add line numbers, ignore case
rg "TODO"                                 # Fast search (brew install ripgrep)
find . -name "*.swift"                    # Find files
find . -type f -size +10M                  # Files larger than 10MB
which python3                             # Show executable path
file binary.out                           # Show file type
```

---

## 🟤 6. Networking & APIs
```zsh
# curl basics
curl https://api.example.com/status
curl -I https://example.com                 # Show headers
curl -v https://example.com                 # Verbose/debug
curl -X POST https://api.example.com      -H "Content-Type: application/json"      -d '{"name":"Hugo"}'

# Network debugging
ping google.com
traceroute github.com                       # Path to host
dig openai.com                              # DNS info
nslookup openai.com
lsof -i :8080                               # Show process using port 8080
netstat -an | grep LISTEN                   # Listening ports
```

---

## 🟩 7. Archiving & File Utilities
```zsh
tar -czvf project.tar.gz project/     # Compress folder
tar -xzvf project.tar.gz              # Extract
zip -r archive.zip src/               # Zip files
unzip archive.zip                     # Unzip
df -h                                  # Disk usage
```

---

## 🟠 8. Automation & Scripting
```zsh
# Simple shell script
echo 'npm test' > run_tests.sh
chmod +x run_tests.sh
./run_tests.sh

# Cron jobs
crontab -e
0 2 * * * /usr/bin/bash backup.sh      # Run backup at 2 AM daily

# Watch a command run repeatedly
watch -n 2 "kubectl get pods"          # Every 2 seconds
```

---

## 🟨 9. Environment & Config
```zsh
export PATH="$HOME/bin:$PATH"          # Add dir to PATH
echo $PATH                             # Show current PATH
printenv                               # Show all env vars
which python                           # Path to Python
alias                                  # Show defined aliases
source ~/.zshrc                        # Reload config
```

---

## 🟧 10. Recommended CLI Tools (Install via Homebrew)
- `bat` → modern `cat` with syntax highlighting  
- `fzf` → fuzzy finder (history, files)  
- `htop` → better process viewer  
- `jq` → parse JSON (great for APIs)  
- `rg` → `ripgrep` fast search  
- `watch` → repeat commands live  
- `gh` → GitHub CLI  
- `tldr` → simple examples for any command  

```zsh
brew install bat fzf htop jq ripgrep gh watch tldr
```

---

## 🟦 11. .zshrc Enhancements
```zsh
# Colorful prompt with git branch
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst
PROMPT='%n@%m:%~%F{green}${vcs_info_msg_0_}%f %# '

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
```

---

## 💡 Tips to Level Up
1. Learn to **pipe** commands: `grep | awk | sed | jq`.  
2. Automate frequent tasks with **scripts and cron**.  
3. Use **fzf** + **Ctrl-R** for lightning-fast history search.  
4. Master **Git rebase, stash, cherry-pick, and bisect** for debugging.  
5. Save a personal **cheat-sheet repo** on GitHub for your scripts & aliases.  
6. Explore **man pages** (`man curl`, `man find`) for advanced flags.  
7. Keep terminal clean and organized with **aliases & functions** in `~/.zshrc`.  
8. Regularly prune old Docker images, logs, and caches to save space and speed builds.

---

### ✅ Pro Tip
Combine this cheat sheet with tools like **Oh My Zsh** and **zsh-autosuggestions** for a massive productivity boost.
