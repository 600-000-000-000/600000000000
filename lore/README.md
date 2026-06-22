# 600B Documentation Pack

We are 600 billion.

This pack is the working documentation for rebuilding avatars, preserving canon, and generating
new assets on a standardized basis.

## What Lives Here

- `01_BRAND_VOICE.md` - voice, framing, and 600B wording
- `02_AVATAR_RECREATION_STANDARD.md` - avatar recreation and full-body standards
- `03_CHARACTER_CANON.md` - active roster, placeholders, inactive local characters
- `04_WORLD_CANON.md` - stones, gatherings, rituals, and recurring story logic
- `05_PROMPT_LIBRARY.md` - reusable prompt blocks
- `06_PUBLIC_FOOTPRINT.md` - website, roster, routing, and public asset snapshot
- `07_ASSET_PIPELINE.md` - asset generation, review, versioning, release rules
- `08_LORE_SUMMARY.md` - compact lore summary
- `09_AVATAR_CHARACTER_REFERENCE.md` - image-derived avatar descriptions and full-body standards
- `10_600_BILLION_SIGNAL_ENGINE_GPT.md` - Custom GPT spec for branded group image prompts
- `avatar_character_catalog.json` - machine-readable avatar catalog

## Source Of Truth

Official active member names come from:

```text
https://600.wtf/members.json
```

When sources disagree, resolve them in this order:

1. live website roster at `https://600.wtf/members.json`
2. hard visual rules in this pack
3. avatar extraction in `09_AVATAR_CHARACTER_REFERENCE.md`
4. recurring 600B canon established by the crew
5. temporary meme variants

Local images that are not attached to a live website member are inactive for generation.

## Non-Negotiable Rules

The sacred number is always:

```text
600
000
000
000
```

The sacred stone is small and round.

Avatar images must contain no readable text at all. Use wordless symbols, costumes, objects,
silhouettes, posture, and palette instead.

Avatar style target: cypherpunk, traditional/old-world craft, fantasy, cute manga/toon.

## How To Use This Pack

If remaking a member avatar, start with:

- `02_AVATAR_RECREATION_STANDARD.md`
- `03_CHARACTER_CANON.md`
- `09_AVATAR_CHARACTER_REFERENCE.md`
- `avatar_character_catalog.json`

If generating a poster, storyboard, or meme, start with:

- `04_WORLD_CANON.md`
- `05_PROMPT_LIBRARY.md`

If building the Custom GPT for standardized group images, start with:

- `10_600_BILLION_SIGNAL_ENGINE_GPT.md`
- `avatar_character_catalog.json`

If syncing docs with public reality, start with:

- `06_PUBLIC_FOOTPRINT.md`

If building a generator, use the avatar catalog as the machine-readable input and keep inactive
items out of generation.
