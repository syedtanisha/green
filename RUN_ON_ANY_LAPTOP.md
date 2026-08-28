# Running Green Roof AI on any laptop (no Node.js install needed)

The `start.bat` method only works if the laptop already has Node.js. For a
hackathon demo, judges' laptops or a random exam-hall PC usually won't have
it — so use one of the options below instead.

---

## Option A — Put it online once, then it works on ANY laptop with a browser (recommended)

This gives you a permanent link like `https://green-roof-ai.onrender.com`
that works on every device — phones, judges' laptops, projectors — with
nothing to install, ever again. Do this once, from your own laptop, a day or
two before the demo.

1. Go to https://render.com and sign up (free, use your GitHub/Google account
   for the fastest setup).
2. Put this project folder in a GitHub repository:
   - Go to https://github.com/new, create a repo (e.g. `green-roof-ai`).
   - Upload this whole folder to it (GitHub's website lets you drag-and-drop
     files if you don't want to use git commands).
3. In Render: **New +** → **Web Service** → connect the GitHub repo you just
   created.
4. Render will detect the included `render.yaml` automatically and fill in:
   - Build command: (empty — nothing to build)
   - Start command: `node server.js`
5. Click **Create Web Service**. Wait 1–2 minutes for the first deploy.
6. You'll get a public URL — that's your app. Bookmark it, put it on your
   slide, and it will work on any laptop with internet, no setup at all.

Free-tier note: Render's free web services "sleep" after ~15 minutes of no
traffic and take ~30–50 seconds to wake up on the next visit. Open the link
yourself a minute before your demo slot so it's already awake.

---

## Option B — Portable version, no internet needed at demo time

If you won't have internet during the demo, use `start.bat` as before, but
first make sure Node.js is installed on **the specific laptop you'll present
from** — install it once, in advance, not on the day:

1. On that laptop, go to https://nodejs.org and download the **LTS**
   installer.
2. Run it (default options are fine), restart the laptop if it asks.
3. Copy this whole project folder onto that laptop.
4. Double-click `start.bat`, then open `http://localhost:8787`.

Do this the night before, not minutes before you present — installers can
be blocked by locked-down/managed laptops (common on college or judge PCs),
so confirm it works well ahead of time.

---

## Option C — USB / offline emergency backup

Keep a folder on a USB drive with:
- This whole project folder.
- The Node.js Windows installer downloaded in advance from
  https://nodejs.org (the LTS `.msi` file), in case the demo laptop has no
  internet to download it live.

This is your fallback if neither A nor B is available on the day.

---

## Which one should you actually use?

**Use Option A.** It is the only one that reliably works on a laptop you
don't control and haven't prepared in advance, which is the real situation
you described. Set it up now, test the public link on your phone's mobile
data (not your home WiFi) to confirm it really works from an unrelated
network, and treat Options B/C as backups only.
