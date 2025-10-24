# 🚀 Raspberry Pi Headless Setup Guide (Wi-Fi + SSH)

This guide sets up a **Raspberry Pi (no monitor/keyboard)** so it **automatically connects to Wi-Fi** and **allows SSH with password authentication** after boot.

---

## 1️⃣ Flash the Raspberry Pi OS

1. **Download & Install** [Raspberry Pi Imager](https://www.raspberrypi.com/software/).
2. **Insert your microSD card** into your computer.
3. Open **Raspberry Pi Imager** and:
   - **Choose OS** → Select **Raspberry Pi OS (Lite or Full)**.
   - **Choose Storage** → Select your SD card.
   - Click the **⚙️ (gear icon) for Advanced Options**.

---

## 2️⃣ Preconfigure Wi-Fi & SSH

1. **Enable SSH** (so you can connect remotely).
2. **Set a username & password** (default: `pi`).
3. **Configure Wi-Fi**:
   - Enter **SSID (Wi-Fi name)**.
   - Enter **Wi-Fi password**.
   - Set **Wi-Fi country code** (e.g., `US`).
4. **Click "Write"** to flash the OS.

✅ **Your Raspberry Pi will now boot, connect to Wi-Fi, and enable SSH.**

---

## 3️⃣ First SSH Connection

### A. Find Raspberry Pi’s IP

Option 1️⃣: Try connecting using hostname:

```sh
ssh pi@raspberrypi.local
```

If it fails, find the **IP address** using:

```sh
ping raspberrypi.local
```

Or check your router's **DHCP client list**.

---

### B. Remove Old SSH Key (If Reinstalling)

If you get a **"REMOTE HOST IDENTIFICATION HAS CHANGED"** error:

```sh
ssh-keygen -R raspberrypi.local
```

Then, try SSH again:

```sh
ssh pi@raspberrypi.local
```

---

## 4️⃣ Ensure Password Authentication Works

If SSH **denies password login**, fix it:

1. SSH into your Pi **locally with a monitor/keyboard** or via serial console.
2. Open the SSH config file:
   ```sh
   sudo nano /etc/ssh/sshd_config
   ```
3. Find and **uncomment** this line (remove `#`):
   ```
   PasswordAuthentication yes
   ```
4. Save and exit (**CTRL + X**, then **Y**, then **Enter**).
5. Restart SSH:
   ```sh
   sudo systemctl restart ssh
   ```
6. Try SSH again from your Mac:
   ```sh
   ssh pi@raspberrypi.local
   ```

---

## 5️⃣ (Optional) Enable SSH Key Authentication (No Passwords)

1. On your Mac, generate an SSH key:
   ```sh
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
2. Copy the public key to the Raspberry Pi:
   ```sh
   ssh-copy-id pi@raspberrypi.local
   ```
3. Now, you can SSH **without entering a password**!

---

## 6️⃣ (Optional) Change the SSH Port for Security

1. Open the SSH config:
   ```sh
   sudo nano /etc/ssh/sshd_config
   ```
2. Change the port from `22` to something custom:
   ```
   Port 2222
   ```
3. Restart SSH:
   ```sh
   sudo systemctl restart ssh
   ```
4. Connect using the new port:
   ```sh
   ssh -p 2222 pi@raspberrypi.local
   ```

---

## ✅ Done! Your Raspberry Pi is Ready 🎉

### Summary of Key Steps:

✔ **Flash OS with SSH & Wi-Fi enabled**\
✔ **Ensure password login works (**``**)**\
✔ **Find Raspberry Pi’s IP & connect via SSH**\
✔ **(Optional) Enable SSH key authentication**\
✔ **(Optional) Change SSH port for security**

---

**Now your Raspberry Pi is set up for remote access!** 🚀


### Install dependencies

```sh
# Example — replace with your username and Pi host/IP
ssh user@your-pi-host 'bash -s' < setup-pi.sh # i have this file within this repo

```


