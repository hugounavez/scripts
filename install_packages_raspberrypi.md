#!/usr/bin/env bash

# --- Strict mode (recommended for automation / provisioning scripts) ---
set -euo pipefail
#  -e : exit immediately if any command fails
#  -u : error if an undefined variable is used (helps catch typos/bugs)
#  -o pipefail : if any command in a pipeline fails, the whole pipeline fails
# -----------------------------------------------------------------------

# Prevent apt from showing interactive dialogs (good for headless/unattended)
# Without this, commands like apt upgrade can hang waiting for a prompt.
export DEBIAN_FRONTEND=noninteractive

# --- Package install section -------------------------------------------
sudo apt-get update
sudo apt-get -y upgrade    # -y auto-answers yes/no prompts
sudo apt-get -y install vim btop speedtest-cli
# -----------------------------------------------------------------------

# --- Sanity checks (don't crash if a version check fails) --------------
echo "--- versions ---"
vim --version | head -n1   || true
btop --version             || true
speedtest-cli --version    || true
# -----------------------------------------------------------------------

echo "All set ✅"
