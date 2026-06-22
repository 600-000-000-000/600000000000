# 02 - Avatar Recreation Standard

We do not remake avatars randomly. We recreate them so the crew still looks like one world.

Before prompting, check `../member_system/member_registry.json` for:

- identity cluster
- aliases and personas
- source image description
- canonical image profile
- avoid-drift rules

## Output Target

### 2D Image Target

- 1:1 square master
- optimized for circular crop
- readable at small size
- one dominant silhouette
- one main light source
- one iconic object or gesture

### 3D Game Avatar Target

For RPG/game production, the source of truth is the member/signup identity record plus
AvatarConfig. A VRM is derived art.

- stylized humanoid toon character
- VRM 1.0 with complete VRM Humanoid bones
- MToon material, warm 600B palette
- about 50k triangles, 4 materials, 90 humanoid bones for hero avatars
- content-hashed asset plus validation report
- animals, mascots, and companions stay as companions or pets, not avatar bodies

See `../member_system/avatar_generation_linux.md`.

## Canon Avatar Recipe

Each avatar contains:

- identity layer: silhouette, face/helmet/creature shape, signature cue
- role layer: what they do in council/game/story
- 600B layer: sacred number, small stone, orange glow, Palace/party/workshop/storm cue

## Hard Rules

If visible, the sacred number is:

```text
600
000
000
000
```

The stone is small, round, readable, and secondary to the face unless requested otherwise.

Team images must not write names, handles, or role labels on people.

## Prompt Structure

```text
Create a 1:1 circular-crop-safe 600B avatar.
Character: [name]
Identity cluster: [identity id]
Persona / alias: [selected persona]
Role: [role]
Archetype: [archetype]
Key object: [one object]
Background: [Palace / forge / workshop / storm / conference / Prague Party]
Palette: orange, gold, black, ember or Palace gold, cream, deep teal, one coral spark
Style: cinematic, mythic, memetic realism or stylized Palace game look
Do not write the character name into the image.
If the sacred number appears, write it exactly as:

600
000
000
000
```
