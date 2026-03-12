# 02 — Avatar Recreation Standard

We do not remake avatars randomly.
We recreate them on a standard basis so the crew still looks like one world.

## Objective

Given an existing avatar or concept image, we recreate a cleaner, sharper, more canonical 600B version without losing the member's identity.

## Output target

Default avatar output:

- 1:1 square master
- optimized for circular crop
- high readability at small size
- one dominant silhouette
- one main light source
- one iconic object or gesture

Recommended export sizes:

- master: 2048 × 2048
- web: 1024 × 1024
- small fallback: 512 × 512

## Circle-safe composition

We assume the website crops to a circle.
So we keep:

- face / helmet / main symbol inside the central 70–75%
- no critical details at the corners
- background detail visible but not required for recognition

## Canon avatar recipe

Each avatar should contain these layers:

### 1. Identity layer
What makes this character unmistakably theirs?

Examples:

- monk silhouette
- astronaut helmet
- wizard beard
- raccoon face
- cowboy hat
- winged energy form
- dark knight armor
- donkey flag bearer

### 2. Role layer
What do they do in the council?

Examples:

- architect
- signal amplifier
- pathfinder
- shadow operator
- chaos engineer

### 3. 600B layer
What ties them to the universe?

Examples:

- sacred number in correct format
- small round stone
- orange glow
- bitcoin medallion
- ember / lightning energy
- conference / Madeira / storm / workshop cues

## Hard visual rules

### The number

When the sacred number is visible, it is always:

```text
600
000
000
000
```

### The stone

When we use the stone in an avatar, it is:

- small
- round
- readable
- secondary to the character face unless the role demands otherwise

### Palette

Primary palette:

- orange
- gold
- ember white
- black
- charcoal
- volcanic brown

Accent palette when needed:

- electric blue
- cyan
- muted steel

## Background rules

Backgrounds should support identity, not drown it.

Good backgrounds:

- storm sky
- forge glow
- workshop
- conference haze
- volcanic cliff
- library of smoke and light
- cyberpunk control room

Bad backgrounds:

- random AI fantasy mush
- busy crowd scenes for small avatars
- flat empty gradients with no 600B character

## Facial / figure rules

We keep people visibly adult.
We keep them strong, iconic, and readable.
We do not let the model drift into off-brand youthfulness or random face swaps.

## Prompt structure

Use this structure every time:

```text
Create a 1:1 circular-crop-safe 600B council avatar.
Character: [name]
Role: [role]
Core identity: [archetype]
Key object: [stone / mug / staff / laptop / orb / flag]
Background: [Madeira / forge / workshop / storm / conference]
Palette: orange, gold, black, ember
Style: cinematic, mythic, memetic realism
Hard rule: if the sacred number appears, write it exactly as

600
000
000
000

Keep face and icon centered for circular crop.
```

## Quality gate

We only ship an avatar if all are true:

- instantly readable at 128 px
- still feels like the original member concept
- unmistakably 600B
- no broken hands, eyes, or nonsense anatomy
- no wrong number formatting
- no oversized sacred stone unless requested

## File naming standard

Use:

`avatar-[member]-v[major].[minor].png`

Examples:

- `avatar-dni-v1.0.png`
- `avatar-blackcoffee-v2.1.png`
- `avatar-bullbear-v1.0.png`

## Variant labels

If needed:

- `core` — default canonical avatar
- `alt` — stylistic variant still in canon
- `event` — conference or poster-specific variant
- `meme` — intentionally playful variant

Example:

`avatar-racoodni-core-v1.2.png`
