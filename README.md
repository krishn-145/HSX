# HSX
<img width="1774" height="887" alt="160625" src="https://github.com/user-attachments/assets/0d0e62ef-3ebf-4105-b5c9-af8693bbc42e" />

> A lightweight 3D animated web tool that runs entirely on your Android device via Termux.
> It captures the visitor's **live location** and displays it directly in your terminal — no cloud, no server, no tracking.

<p align="center">
  <img src="https://img.shields.io/badge/Owner-Krishn-ff2b8a?style=for-the-ba" />
  <img src="https://img.shields.io/badge/Platform-Termux-00c6ff?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Language-Bash%20%2B%20Python-7c8cff?style=for-the-badge" />
  <img src="https://img.shields.io/badge/License-MIT-5ee7ff?style=for-the-badge" />
</p>

---

## 📖 What Is HSX?

**HSX** is a self-hosted web tool built for Termux on Android. It spins up a tiny local web server on your phone, serves a modern 3D animated website, and whenever a visitor opens the page and allows location access, their **live coordinates are printed directly in your Termux terminal** — complete with accuracy, speed, IP address, and a Google Maps link.

No external servers. No cloud account. No third-party dashboards. Everything stays on your own device.

---

## ✨ What It Does

### 1. Runs a Local Web Server
- Starts a Python-powered HTTP server on `http://127.0.0.1:8080`
- Binds only to **localhost** — nothing is exposed to the internet
- Auto-picks a free port if 8080 is busy

### 2. Serves a 3D Animated Website
- Rotating 3D cube in the hero section with cat images on every face
- Floating parallax orbs with blurred gradient colors
- Glass-morphism panels with hover tilt effects
- Scroll-reveal animations using `IntersectionObserver`
- A full-width cat gallery pulled from a public cat API
- Owner branding ("Krishn") displayed in the hero, an owner section, and the footer

### 3. Captures Live Location Automatically
- The moment the page loads, the browser's native **"Allow location?"** popup fires
- No button needs to be pressed — it happens instantly
- Once allowed, the site sends coordinates to your local server in real time
- `watchPosition` keeps sending updates as the visitor moves

### 4. Prints Live Location in the Terminal
Every new location (10 m apart or more) prints a clean box in Termux:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
│  📍  LIVE LOCATION   #1   06:35:39
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
│  Lat   : XX.XXXXXXX
│  Lon   : XX.XXXXXXX
│  Acc   : ±XXXm   Spd : -
│  IP    : 127.0.0.1
│  Map   : https://www.google.com/maps?q=XX.XXXXXXX,XX.XXXXXXX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

> Coordinates above are placeholders. Real GPS values appear in your terminal.

### 5. Smart Deduplication
- GPS often repeats the same coordinates several times per second
- HSX compares each new location against the last one
- If the visitor hasn't moved more than ~10 meters, the update is **skipped**
- This keeps the terminal clean — only real movement shows a new box

### 6. Saves Everything Locally
All captured data is saved to your phone:

```
~/HSX/
├── index.html          # The 3D website
├── server.py           # Python server with location handler
├── hsx.sh          # One-command installer
├── README.md           # This file
├── files/              # Any uploaded files
├── location/           # Location logs (JSON, timestamped)
└── device/             # Device fingerprint logs (JSON)
```

### 7. Auto-Opens the Browser
Once the server is running, HSX automatically launches your browser at `http://127.0.0.1:8080` — no need to type the URL manually.

### 8. Collects Device Info
Alongside location, HSX silently gathers basic device details:
- User agent, platform, language
- Screen size, viewport, pixel ratio
- Timezone, hardware cores, battery level
- Referrer, online status

Saved to `~/HSX/device/` as JSON files.

### 9. One-Command Setup
Everything — packages, folders, files, server, browser — is handled by a single command. No configuration, no editing, no manual steps.

---

## 🔧 How To Install

### Step 1 — Install Termux
Download from **F-Droid** (the Play Store version is outdated and won't work).

### Step 2 — Update packages and install Git
```bash
pkg update -y && pkg install -y git
```

### Step 3 — Clone the repository
```bash
git clone https://github.com/krishn-145/HSX.git
cd HSX
chmod +x hsx.sh
./hsx.sh
```

That's it. Packages install, folders are created, files are written, the server starts, and the browser opens automatically.

---

## 🖥️ Usage

Once running, the Termux screen shows:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
│  HSX SERVER IS RUNNING
│  Owner     : KRISHN
│  Local     : http://127.0.0.1:8080
│  LAN IP    : 192.168.x.x
│  Save      : /data/data/com.termux/files/home/HSX
│  Stop      : Ctrl+C
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

▶ Waiting for live location...
```

Open the site, allow location — and the live location box appears instantly.

### Stop the server
Press **Ctrl + C** in Termux.

### Restart the server
Just run `bash hsx.sh` again — it's safe to re-run anytime.

---

## 🔐 Privacy & Safety

| Aspect | Detail |
|---|---|
| **Network exposure** | Binds only to `127.0.0.1` — no external access |
| **Cloud dependency** | None — everything runs on your device |
| **Telemetry** | None — no analytics, no tracking |
| **Location storage** | Written only to `~/HSX/location/` on your own phone |
| **External calls** | Only `cataas.com` (for cat images) and `pkg install` (one-time) |

---

## ⚠️ Important Notes

### About the browser permission popup
The native **"Allow location?"** dialog is a **browser security feature**. No website in the world can hide it or bypass it. HSX simply triggers the request the instant the page loads — so the visitor doesn't have to press any button first. They only need to tap "Allow".

### About localhost-only access
Since the server binds to `127.0.0.1`, only **this phone** can open the site. If you want other phones on the same WiFi to open it, change the bind address in `server.py` from `127.0.0.1` to `0.0.0.0` and use the LAN IP shown in the banner.

### About the cat images
Cat images are loaded from the free public API `cataas.com`. If you have no internet, the gallery will show blank tiles — everything else still works.

---

## 🐛 Troubleshooting

| Problem | Fix |
|---|---|
| `python: command not found` | Run `pkg install python` |
| Port 8080 busy | Server auto-picks 8081–8099 |
| Location popup doesn't appear | Chrome → Settings → Site settings → Location → Allow |
| Browser didn't open | Manually visit `http://127.0.0.1:8080` |
| Cat images blank | Check internet connection |
| Server dies immediately | Check the terminal — the log is printed on exit |

---

## 📜 License

MIT License — free to use, modify, and share.

---

## 👤 Author

**Krishn**

- GitHub: [@krishn](https://github.com/onxx-x146
- Built with ❤️ on Termux

---

<p align="center">
  <b>HSX</b> · Made by <b>Krishn</b> · 2025
</p>
