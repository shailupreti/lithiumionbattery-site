# lithiumionbattery.info — Visitor Site

Public visitor guide for **C4V Innovation Center** (Vestal, NY) and **Near Prime Technologies Gigafactory** (Endicott, NY). Hosted on GitHub Pages at the custom domain `www.lithiumionbattery.info`.

## URL structure

| URL | Page |
|---|---|
| `https://www.lithiumionbattery.info/` | Landing hub — both locations as cards, quick airport summary |
| `https://www.lithiumionbattery.info/c4v/` | Full C4V Innovation Center visitor guide |
| `https://www.lithiumionbattery.info/nearprime/` | Full Near Prime Technologies visitor guide |

## File layout

```
/
├── index.html              Landing hub
├── c4v/
│   └── index.html          C4V Innovation Center guide
├── nearprime/
│   └── index.html          Near Prime Technologies guide
├── 404.html                Fallback for unknown paths
├── CNAME                   Tells GitHub Pages the custom domain is www.lithiumionbattery.info
├── .nojekyll               Disables Jekyll processing so everything ships as-is
└── README.md               This file
```

Everything is plain static HTML with inline CSS — no build step, no framework. Edit `.html` files directly, commit, push; the site updates in ~1–2 minutes.

## How to put this live on GitHub Pages

### 1. Create the repo

1. On github.com, create a new **public** repo. Any name is fine (e.g. `lithiumionbattery-site`).
2. Clone it locally:
   ```bash
   git clone git@github.com:<your-user>/lithiumionbattery-site.git
   cd lithiumionbattery-site
   ```
3. Copy every file in this `lithiumionbattery-site/` folder — including the hidden `.nojekyll` — into the repo root.
4. Commit and push:
   ```bash
   git add .
   git commit -m "Initial visitor site"
   git push origin main
   ```

### 2. Turn on GitHub Pages

1. In the repo on github.com, go to **Settings → Pages**.
2. Under **Source**, choose **Deploy from a branch**.
3. Branch: **main**, folder: **/ (root)**. Save.
4. Under **Custom domain**, enter `www.lithiumionbattery.info` and save. (This matches the `CNAME` file already in the repo.)
5. Leave **Enforce HTTPS** unchecked for now; tick it once DNS has propagated (step 3).

After a minute, GitHub will show the site at `https://<your-user>.github.io/<repo-name>/`. You can confirm it renders there first, then move on to DNS.

### 3. Point DNS at GitHub Pages

You'll need access to the DNS settings for `lithiumionbattery.info` (wherever the domain is registered — e.g., GoDaddy, Namecheap, Google Domains / Squarespace, Cloudflare).

**A. The `www` subdomain — a CNAME record.** Create a `CNAME` record:

| Type | Host / Name | Value | TTL |
|---|---|---|---|
| CNAME | `www` | `<your-user>.github.io` | 3600 (or default) |

Replace `<your-user>` with your actual GitHub username (all lowercase). Example: if your GitHub username is `shaileshupreti`, the value is `shaileshupreti.github.io` — **no repo name**, **no https://**, **no trailing slash**.

**B. The apex / root domain — four A records.** So that `lithiumionbattery.info` (without `www`) also works and redirects to `www`, add these four `A` records to the root:

| Type | Host / Name | Value | TTL |
|---|---|---|---|
| A | `@` | `185.199.108.153` | 3600 |
| A | `@` | `185.199.109.153` | 3600 |
| A | `@` | `185.199.110.153` | 3600 |
| A | `@` | `185.199.111.153` | 3600 |

(If your DNS provider uses `lithiumionbattery.info` instead of `@` for the root, use that. Some providers call this "apex" or leave the Host field blank.)

**Optional but recommended — AAAA records for IPv6:**

| Type | Host / Name | Value |
|---|---|---|
| AAAA | `@` | `2606:50c0:8000::153` |
| AAAA | `@` | `2606:50c0:8001::153` |
| AAAA | `@` | `2606:50c0:8002::153` |
| AAAA | `@` | `2606:50c0:8003::153` |

### 4. Verify and enable HTTPS

1. DNS usually propagates in minutes but can take up to 24 hours. Check progress with:
   ```bash
   dig www.lithiumionbattery.info +short
   dig lithiumionbattery.info +short
   ```
   The first should resolve to `<your-user>.github.io` (and then a set of GitHub IPs). The second should resolve to the four IPs listed above.
2. Once GitHub Pages reports the DNS check as successful (green check in repo Settings → Pages), tick **Enforce HTTPS**. Certificate issuance takes a few minutes.
3. Visit `https://www.lithiumionbattery.info/` in a browser. You should see the landing hub.

### 5. Updating the site later

Edit the HTML files, commit, push — Pages redeploys automatically. For anything more than a tweak, open the files in any code editor; no build step is required.

## Maintenance notes

- All styles are inline per page to keep each file self-contained. If you ever want a shared stylesheet, extract into `/assets/site.css` and reference it from each page.
- Apple Maps / Google Maps links are URL-encoded with the full address. If you change a site address, update every link — there are 2 per location page (one "Open in" button + one in the top header's deep link) plus the landing page's Directions buttons.
- The `CNAME` file must contain exactly `www.lithiumionbattery.info` (no trailing slash, no protocol). GitHub's Pages UI will update this file if you change the custom domain there — don't manually conflict.

## Contact

Questions: **Alex** · Admin Assistant to Shailesh Upreti · admin@c4v.us · +1 (607) 444-2443
