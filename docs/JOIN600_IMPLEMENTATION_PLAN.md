# join.600.wtf implementation plan

Date: 2026-06-24
Owner/operator: flx600 on alflx

## Current verified state

### Local app

`join-600` is already running on alflx.

Service root:

```text
/home/flx/services/join-600
```

Container:

```text
join-600
```

Verified health:

```text
http://127.0.0.1:6010/health
{"ok":true,"service":"join-600","db":"/app/data/join600.sqlite3"}
```

Current bind contract:

```yaml
ports:
  - "127.0.0.1:6010:8010"
  - "100.125.241.29:6010:8010"
```

This is good: localhost for reverse-SSH / local checks, Tailscale IP for private reverse proxy from a tailnet-connected server. No laptop WAN exposure needed.

### Public DNS / HTTPS

Current public DNS:

```text
join.600.wtf -> k8s.600.wtf -> 129.212.193.228
```

Current public HTTPS check:

```text
https://join.600.wtf -> HTTP 404
```

So DNS reaches a public webserver, but that webserver is not yet proxying to alflx `join-600`.

### Lightning backend prerequisite

Alby Hub was unlocked/started enough for LNbits to reconnect.

Verified after restart:

```text
LNbits Funding source: NWCWallet
NWCConnection is ready
Backend NWCWallet connected and with a balance of 0 msat
```

Caution: Alby Hub `/api/info` still reports `unlocked:false`, but protected node APIs report the node running and LNbits is connected through NWC. Treat LNbits NWC log as the payment-backend health source for now.

## Target architecture

```text
Internet
  -> DNS: join.600.wtf
  -> dniserver or one existing public webserver
  -> HTTPS reverse proxy
  -> private bridge to alflx
  -> http://100.125.241.29:6010  OR reverse-SSH loopback tunnel
  -> join-600 container on alflx:8010
```

Preferred option if the public webserver is in the same Tailscale tailnet:

```text
public Caddy/nginx -> http://100.125.241.29:6010
```

Fallback option if the public webserver is not in Tailscale:

```text
alflx reverse SSH tunnel -> public server 127.0.0.1:6010
public Caddy/nginx -> http://127.0.0.1:6010
```

## Phase 0 - freeze safety boundary

1. Keep `join-600` bound only to:
   - `127.0.0.1:6010`
   - `100.125.241.29:6010`
2. Do not bind it to `0.0.0.0`.
3. Do not open alflx WAN firewall ports for this app.
4. Public TLS and public exposure happen only on dniserver / selected webserver.
5. Before public launch, set real reviewer pubkeys:

```yaml
JOIN600_REVIEWER_PUBKEYS: "<dni_hex_or_npub_resolved_to_hex>,<flx_hex>"
```

Current value is empty, which means bootstrap/manual-review mode must not be treated as final public security.

## Phase 1 - choose public reverse proxy host

Pick one:

### Option A: dniserver / current `k8s.600.wtf`

Use because DNS already points there.

Checks on that host:

```bash
hostname
curl -I http://127.0.0.1
sudo ss -ltnp | grep -E ':80|:443'
command -v caddy || command -v nginx
command -v tailscale && tailscale status
```

If Tailscale is present and can reach alflx:

```bash
tailscale ping alflx
curl -fsS http://100.125.241.29:6010/health
```

### Option B: another public webserver

Use if it is easier to edit Caddy/nginx there or if dni controls it.

Required from that server:

```bash
curl -fsS http://100.125.241.29:6010/health
```

If this fails and server cannot join Tailscale, use reverse SSH tunnel.

## Phase 2A - Caddy reverse proxy via Tailscale

Caddyfile:

```caddyfile
join.600.wtf {
    encode zstd gzip

    reverse_proxy http://100.125.241.29:6010 {
        header_up Host {host}
        header_up X-Real-IP {remote_host}
        header_up X-Forwarded-Proto {scheme}
    }
}
```

Apply:

```bash
sudo caddy validate --config /etc/caddy/Caddyfile
sudo systemctl reload caddy
```

Verify from public internet:

```bash
curl -I https://join.600.wtf
curl -fsS https://join.600.wtf/health
```

Expected:

```json
{"ok":true,"service":"join-600",...}
```

## Phase 2B - nginx reverse proxy via Tailscale

```nginx
server {
    listen 80;
    server_name join.600.wtf;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name join.600.wtf;

    ssl_certificate /etc/letsencrypt/live/join.600.wtf/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/join.600.wtf/privkey.pem;

    client_max_body_size 30m;

    location / {
        proxy_pass http://100.125.241.29:6010;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
    }
}
```

Apply:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

## Phase 2C - reverse SSH tunnel fallback

Use only if the public webserver cannot be in Tailscale.

On public server, Caddy/nginx upstream should be:

```text
http://127.0.0.1:6010
```

On alflx, create a systemd user service that maintains:

```bash
ssh -N -R 127.0.0.1:6010:127.0.0.1:6010 <user>@<public-server>
```

Important: bind remote side to `127.0.0.1` only, so only the public reverse proxy can access it.

## Phase 3 - join pipeline hardening

### Current join app responsibilities

The app already provides:

- Nostr login
- member roster load
- style lock selection
- submission creation
- generation brief preview
- reference image upload
- manual gate status changes
- local storage-backed avatar/VRM assets

### Required before public launch

1. Reviewer identity gate:
   - configure dni/flx reviewer pubkeys
   - reject review actions from non-reviewers
2. Member admission gate:
   - `members.json` must include explicit `npub` for authorized members
   - NIP-05 display handles are not enough
3. Upload limits:
   - app-level limit
   - proxy `client_max_body_size` / equivalent
4. Base URL:
   - keep `JOIN600_PUBLIC_BASE_URL=https://join.600.wtf`
5. Privacy:
   - do not expose raw internal storage indexes
   - no secrets in generated briefs/logs
6. Paid generation gate:
   - no OpenAI/Meshy calls until manual approved status
   - provider keys loaded from secrets, not browser

## Phase 4 - integrate Palace of Culture story/game pipeline

Fresh local story pipeline is here:

```text
/home/flx/Nextcloud/workspace/20_PROJECTS/600000000000/packages/story-pipeline
```

Main character canon:

```text
THE BUILDER
```

CWO is publishing/ops voice, not protagonist.

Implementation steps:

1. Keep daily story drafts local-first:

```bash
cd /home/flx/Nextcloud/workspace/20_PROJECTS/600000000000/packages/story-pipeline
python3 generate_daily_post.py --date $(date -u +%F) --epoch 2026-06-24 --out output/today.md
python3 -m unittest discover -s tests -v
```

2. Add a Palace/story page to the public website repo:

```text
/home/flx/projects/github-600/600000000000
```

Suggested route:

```text
/palace.html
```

3. Data contract for website:

```json
{
  "series": "palace-of-culture-season-0-foundation",
  "day": 0,
  "title": "Before the Gate",
  "main_character": "THE BUILDER",
  "zone": "The Locked Gate",
  "story": "...",
  "image_prompt": "...",
  "image_url": null,
  "join_url": "https://join.600.wtf"
}
```

4. The daily post becomes both:
   - public story note after approval/image upload
   - website/game lore entry

## Phase 5 - test matrix

### Local alflx

```bash
curl -fsS http://127.0.0.1:6010/health
curl -fsS http://100.125.241.29:6010/health
```

### Public reverse proxy host

```bash
curl -fsS http://100.125.241.29:6010/health
curl -I https://join.600.wtf
curl -fsS https://join.600.wtf/health
```

### Browser smoke

- load `https://join.600.wtf`
- Nostr login visible
- current roster loads
- unauthorized user cannot enter member-gated flow
- authorized npub can create submission
- non-reviewer cannot approve/reject
- reviewer can move manual gate status
- upload works with image under limit

### Pipeline smoke

- generate story day
- load story into website data/page
- story mentions THE BUILDER as protagonist
- no accidental CWO-as-protagonist drift

## Phase 6 - DNS coordination with dni

Message to dni should include only the chosen action:

If staying on current `k8s.600.wtf`:

```text
Please configure the reverse proxy on 129.212.193.228 for join.600.wtf to upstream http://100.125.241.29:6010 over Tailscale, or tell us if that server is not in the tailnet so we can use a reverse SSH tunnel.
```

If moving DNS to another webserver:

```text
Please point join.600.wtf to <PUBLIC_SERVER_IP>. That server will terminate HTTPS and proxy privately to alflx join-600.
```

## Go/no-go checklist

GO when all are true:

- `join-600` health OK locally
- public proxy host can reach alflx upstream
- `https://join.600.wtf/health` OK
- TLS certificate valid for `join.600.wtf`
- reviewer pubkeys configured
- member `npub` gate verified
- upload limit verified
- Palace story Day 0 generated with THE BUILDER
- LNbits NWC backend connected if zap/payment features are used

NO-GO if any are true:

- app exposed directly on alflx WAN
- reviewer list empty in public mode
- public proxy returns 404 or wrong cert
- NIP-05-only member gate used without `npub`
- LNbits logs show VoidWallet fallback for payment features
