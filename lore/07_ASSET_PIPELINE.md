# 07 - Asset Pipeline

We do not generate random pretty noise. We produce canonical 600B assets from the current public
roster and reviewed image references.

## Required Inputs

Avatar generators must ingest:

- `https://600.wtf/members.json`
- `02_AVATAR_RECREATION_STANDARD.md`
- `03_CHARACTER_CANON.md`
- `09_AVATAR_CHARACTER_REFERENCE.md`
- `avatar_character_catalog.json`

The live website roster decides who is active. The avatar catalog decides whether a member can
be generated now.

## Pipeline Overview

### 1. Intent

What are we making?

- 2D avatar
- full-body avatar
- VRM concept
- roster card
- team poster
- meme
- storyboard panel
- chapter image
- party scene
- ritual scene

### 2. Roster Check

Before generation, confirm:

- Is the name present in live `members.json`?
- Is the status `active`, `active_placeholder`, or `inactive`?
- Is `generate` true in `avatar_character_catalog.json`?

Rules:

- `active` and `generate:true`: generation allowed.
- `active_placeholder` and `generate:false`: no unique avatar generation until identity details exist.
- `inactive` and `generate:false`: do not generate as a current member.

### 3. Canon Check

Before generating, confirm:

- Does the sacred number appear?
- If yes, is it formatted correctly?
- Does the stone appear?
- If yes, is it small and round?
- Is the scene recognizably 600B?
- Are names, handles, and job titles absent from the image?

### 4. Character Check

If a member appears, confirm:

- source image matches the website roster image or approved alternate
- role comes from live `members.json`
- silhouette is readable
- iconic object is present if needed
- face, helmet, mask, or mascot cue remains recognizable
- full-body output is not over-cluttered

### 5. Environment Check

Pick one environment anchor:

- workshop
- party/stage
- public plaza
- storm shrine
- council archive
- mountain/high-ground path
- Palace build space
- warm conference memory

Madeira is optional memory, not mandatory default.

### 6. Prompt Build

Compose prompt from:

- intent
- roster status
- character catalog record
- visual extraction notes
- world canon
- prompt library block

### 7. Review Pass

Reject if:

- member is inactive
- placeholder member gets invented fixed identity
- wrong number layout
- giant wrong-shaped stone
- visible names/handles/roles on people
- random off-brand color palette
- mushy unreadable faces
- no clear full-body silhouette
- too much generic fantasy noise

## Variant Strategy

For important assets, create three passes:

- Pass A: conservative canon, closest to existing identity
- Pass B: full-body standard, cleaner and riggable
- Pass C: controlled meme variant, still recognizable

## Metadata Sidecar

For each important image, save a sidecar note with:

- file name
- date
- prompt used
- source member record
- source image
- roster status
- generation decision
- characters shown
- environment
- accepted/rejected observations

## Release Rule

An image is releasable when:

- it is generated from an active member record
- it respects `generate` status
- it is readable on first glance
- it rewards second glance with details
- it feels like our world
- it respects the sacred number and sacred stone rules
- it adds signal, not just pixels
