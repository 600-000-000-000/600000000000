# 02 - Avatar Recreation Standard

We do not remake avatars randomly. We recreate them on a standard basis so the crew still looks
like one world.

Official active names come from:

```text
https://600.wtf/members.json
```

For current image-derived details, inactive flags, and full-body directions, use:

- `09_AVATAR_CHARACTER_REFERENCE.md`
- `avatar_character_catalog.json`

## Objective

Given an existing avatar or concept image, recreate a cleaner, sharper, more canonical 600B
version without losing the member's identity.

## Status Rules

- `active`: listed on the live website and has a unique avatar reference.
- `active_placeholder`: listed on the live website but uses `img/600.png`; do not generate a
  unique avatar until identity details exist.
- `inactive`: local image exists, but the name is not on the live website roster; do not
  generate.

## 2D Avatar Output

- 1:1 square master
- optimized for circular crop
- high readability at small size
- one dominant silhouette
- one main light source
- one iconic object or gesture

Recommended export sizes:

- master: 2048 x 2048
- web: 1024 x 1024
- small fallback: 512 x 512

## Full-Body Output

- adult character, head to toe visible
- clean silhouette suitable for later humanoid rigging
- original avatar cue preserved before adding extra lore
- neutral standing pose, calm hero pose, or one readable signature gesture
- 600B palette and object language visible but not cluttered
- cypherpunk, traditional/old-world craft, fantasy, cute manga/toon style blend
- no readable text anywhere on the avatar image

For animal-coded avatars, use a riggable humanoid game body with the animal identity as mask,
head styling, outfit, companion, or mascot layer unless the request is explicitly 2D mascot art.

## Circle-Safe Composition

The website crops avatars to a circle. Keep:

- face, helmet, or main symbol inside the central 70-75 percent
- no critical details at the corners
- background detail visible but not required for recognition

## Canon Avatar Recipe

Each avatar should contain these layers:

### 1. Identity Layer

What makes this character unmistakably theirs?

Examples:

- hooded signal bearer
- architectural dome/grid
- engineer monk
- astronaut helmet
- Bullbear guardian armor
- sunglasses and orange halo
- dark coffee operator armor
- donkey/pathfinder flag
- honeybadger or badger styling

### 2. Role Layer

What do they do in the current website roster?

Use the role label from `members.json`, but do not write it into the image.

### 3. 600B Layer

What ties them to the universe?

Examples:

- wordless orange disk or abstract stacked glyph
- small round stone
- orange glow
- wordless medallion
- ember/lightning energy
- workshop, conference, party, or Palace cue

## Hard Visual Rules

Avatar images must contain no readable text at all:

- no names
- no handles
- no role labels
- no cap or clothing labels
- no readable signs
- no readable numbers
- no written 600B marks

Use wordless symbols, abstract glyphs, silhouettes, costumes, posture, objects, and color instead.

For non-avatar posters/story scenes, when the sacred number is visible, it is always:

```text
600
000
000
000
```

When the stone appears, it is:

- small
- round
- readable
- secondary to the character face unless explicitly requested

Team images follow the same no-readable-text avatar rule for people.

## Prompt Structure

```text
Create a full-body 600B avatar for [character].
Status: [active / active_placeholder / inactive].
Generate only if status permits it.
Role: [role from live members.json].
Core identity: [from avatar_character_catalog.json].
Key object: [object].
Pose: [neutral standing / hero stance / signature gesture].
Background: [workshop / stage / plaza / storm / archive / mountain / party].
Style: preserve the original cue, but make it cypherpunk, traditional, fantasy, cute manga/toon.
Palette: orange, gold, black, ember, plus character-specific accent.
No readable text anywhere: no names, handles, role labels, cap labels, signs, readable numbers,
or written 600B marks. Use wordless symbols instead.
```

## Quality Gate

Ship only if all are true:

- member is active in the live website roster
- placeholder members have identity details before unique generation
- inactive local images are not generated as current members
- instantly readable at 128 px
- still feels like the original member concept
- unmistakably 600B
- full-body version is riggable and not cluttered
- no broken hands, eyes, or nonsense anatomy
- no readable text anywhere on the avatar
- no wrong number formatting
- no oversized sacred stone unless requested

## File Naming Standard

Use:

```text
avatar-[member]-[variant]-v[major].[minor].png
```

Examples:

- `avatar-dni-core-v1.0.png`
- `avatar-blackcoffee-fullbody-v1.0.png`
- `avatar-snick-vrm-concept-v1.0.png`

Variant labels:

- `core` - default canonical avatar
- `fullbody` - full-body standard view
- `vrm-concept` - ready for 3D/VRM pipeline
- `event` - event-specific variant
- `meme` - controlled playful variant
