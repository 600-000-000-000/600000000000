# 07 - Asset Pipeline

We do not generate random pretty noise. We produce canonical 600B assets.

## Pipeline

1. Define intent: avatar, signup-generated avatar, VRM avatar, roster card, meme, poster,
   storyboard, chapter image, party scene, ritual scene, game scene.
2. Check canon: sacred number, stone, scene identity.
3. Check character: identity exists in `../member_system/member_registry.json`, selected
   persona belongs to the right cluster, silhouette is readable.
4. Pick environment: Palace of Culture, private plot, Prague Party 2026-06-11, conference,
   workshop, storm shrine, council table, wasteland, AI meme lab. Madeira only when useful.
5. Build prompt from intent, member registry, generator library, character canon, world canon,
   and prompt library.
6. Review and reject wrong number layout, giant stone, off-brand palette, unreadable faces,
   missing silhouette, generic fantasy noise, or visible name labels on team images.

Future generators should ingest:

- `01_BRAND_VOICE.md`
- `03_CHARACTER_CANON.md`
- `04_WORLD_CANON.md`
- `05_PROMPT_LIBRARY.md`
- `../member_system/member_registry.json`
- `../member_system/generator_library.json`

## VRM Avatar Pipeline

For the RPG layer, run generated characters through the Linux avatar pipeline:

```text
member/signup record -> AvatarConfig -> toon concept -> GLB -> rig -> VRM 1.0 -> validation
```

Hard gates:

- humanoid VRM 1.0 with complete VRM Humanoid bones
- MToon material and warm 600B toon style
- animals stay as companions, not avatar bodies
- about 50k triangles, 4 materials, 90 humanoid bones for hero avatars
- content hash, manifest entry, and JSON report

See `../member_system/avatar_generation_linux.md`.
