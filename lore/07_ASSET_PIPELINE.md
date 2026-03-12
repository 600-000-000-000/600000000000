# 07 — Asset Pipeline

We do not generate random pretty noise.
We produce canonical 600B assets.

## Pipeline overview

### 1. Intent
What are we making?

- avatar
- roster card
- meme
- poster
- storyboard panel
- chapter image
- conference scene
- ritual scene

### 2. Canon check
Before generating, confirm:

- Does the sacred number appear?
- If yes, is it formatted correctly?
- Does the stone appear?
- If yes, is it small and round?
- Is the scene recognizably 600B?

### 3. Character check
If a council member appears, confirm:

- role matches archetype
- silhouette is readable
- iconic object is present if needed
- face / helmet remains recognizable

### 4. Environment check
Pick one environment anchor:

- Madeira
- conference
- workshop
- storm shrine
- council table
- wasteland
- AI meme lab

### 5. Prompt build
Compose prompt from:

- intent
- character canon
- world canon
- prompt library block

### 6. Review pass
Reject if:

- wrong number layout
- giant wrong-shaped stone
- random off-brand color palette
- mushy unreadable faces
- no clear silhouette
- too much generic fantasy noise

## Variant strategy

For important assets, create 3 passes:

### Pass A — conservative canon
Closest to existing identity.

### Pass B — stronger drama
More cinematic, more energy.

### Pass C — meme variant
Allows controlled absurdity while retaining canon.

## Versioning

Use semantic versioning for major image families.

Examples:

- `poster-last-supper-v1.0.png`
- `storyboard-madeira-origin-v2.0.png`
- `meme-gm-0420-v1.3.png`

## Metadata sidecar

For each important image, save a sidecar text or markdown note with:

- file name
- date
- prompt used
- characters shown
- environment
- canon notes
- accepted / rejected observations

## Generator rules for future agents

Any future 600B generator should ingest at minimum:

- `01_BRAND_VOICE.md`
- `03_CHARACTER_CANON.md`
- `04_WORLD_CANON.md`
- `05_PROMPT_LIBRARY.md`

## Release rule

An image is releasable when:

- it is readable on first glance
- it rewards second glance with details
- it feels like our world
- it respects the sacred number and sacred stone rules
- it adds signal, not just pixels
