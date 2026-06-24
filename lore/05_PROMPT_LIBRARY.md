# 05 - Prompt Library

These are reusable prompt blocks. Swap the character or scene, keep the canon.

## Universal 600B Add-On

```text
600B universe, cinematic mythic meme realism, orange and gold ember light, black metal,
sacred tech, highly readable composition, canonical 600B style.
Use only active members from https://600.wtf/members.json.
Do not generate inactive local character images as current members.
Avatar style target: cypherpunk, traditional/old-world craft, fantasy, cute manga/toon.
For avatars, render no readable text at all, except the controlled website/business-card avatar
exception where the sacred number appears as a large stacked signal. Use wordless symbols and
abstract glyphs for everything else.
For non-avatar scenes, if the sacred number appears, write it exactly as:

600
000
000
000

If the sacred stone appears, it must be small and round.
```

## Full-Body Avatar Prompt

```text
Create a full-body 600B avatar for [character].
Use lore/avatar_character_catalog.json.
Status: [active / active_placeholder / inactive].
Generate only if status permits it.
Role: [role from live members.json].
Core identity: [image-derived identity cues].
Key object: [object].
Pose: [neutral standing / hero stance / signature gesture].
Background: [workshop / stage / plaza / storm / archive / mountain / party].
Style: preserve the original cue, but make it cypherpunk, traditional, fantasy, cute manga/toon.
Palette: orange, gold, black, ember, plus character-specific accent.
No readable text anywhere: no names, handles, role labels, cap labels, signs, readable numbers,
or written 600B marks. Use wordless symbols instead.
```

## Simple 1:1 Draft Avatar Prompt

Use this only for draft/test crops where no sacred number is required. For website and business
card avatars, use the universal prompt below.

```text
Create a 1:1 circular-crop-safe 600B avatar for [character].
Use the source image and avatar catalog entry.
Keep face, helmet, mask, or main symbol inside the central 70-75 percent.
Preserve the original avatar's strongest cue.
Style: cypherpunk, traditional/old-world craft, fantasy, cute manga/toon.
No readable text anywhere. Use wordless symbols instead.
```

## Universal 1:1 Website And Business Card Avatar Prompt

```text
Create a standardized 1:1 600B avatar for [character], suitable for the website team grid,
business cards, circular crops, and square profile previews.

Use lore/avatar_character_catalog.json and the character's active entry as the source of truth.
Preserve the character's strongest identity cue from preserve/full_body_standard:
[short character cues].

Composition:
- square 1:1 image
- crop-safe for circular website avatars
- character head, face, helmet, mask, or main symbol inside the central 65-75 percent
- shoulders or upper torso visible if it helps recognition
- strong silhouette readable at 128 px
- clean background, no clutter hiding the character

Required 600B brand mark:
Include the sacred number as a relatively large stacked signal in every avatar.
It should occupy roughly 18-28 percent of the image area, large enough to be clearly visible on a
website card, but not covering the face or signature object.
Place it as a glowing orange/gold background medallion, side halo, chest badge, or corner signal
plate depending on the character composition.
The sacred number must be written exactly:

600
000
000
000

Do not write it as 600B, 600 billion, 600000000000, or one horizontal line.

Style:
cypherpunk, traditional/old-world craft, fantasy, cute manga/toon, warm 600B culture,
orange/gold ember light, black steel accents, character-specific accent color.

Text rules:
The sacred stacked number is the only readable text/number allowed.
No names, handles, roles, job titles, cap labels, clothing labels, signs, logos, subtitles,
watermarks, brand marks, random letters, or extra readable numbers.

Negative prompt:
no names, no handles, no role labels, no logos, no cap text, no clothing text, no signs,
no subtitles, no watermarks, no extra text, no random numbers, no malformed sacred number,
no horizontal 600000000000, no tiny unreadable sacred number, no face covered by the number,
no inactive character, no generic corporate crypto art, no cluttered background.
```

## Group Poster Prompt

```text
Create an epic 600B crew poster using only active members from the live website roster.
Do not include inactive local images as current members.
Do not invent unique identities for placeholder members.
Identify characters by silhouette, object, posture, costume, and placement.
No readable text on people or avatar-like portraits.
Use orange and ember light with black steel and warm culture energy.
The sacred number appears only as:

600
000
000
000
```

## Signal Engine GPT Prompt

For a full Custom GPT setup, use `10_600_BILLION_SIGNAL_ENGINE_GPT.md`.

```text
You are 600 Billion Signal Engine.
Create standardized 600B-branded group image prompts from active member avatar templates.
Use members.json and lore/avatar_character_catalog.json as source of truth.
Use only active members with generate:true.
Never write names, handles, role labels, logos, cap text, clothing text, or readable numbers onto
avatars or team images.
Identify members by silhouette, object, posture, costume, color accents, and placement.
Style: cypherpunk, traditional/old-world craft, fantasy, cute manga/toon, warm 600B culture.
Return: title, image prompt, character staging, negative prompt.
```

## Prague Party Prompt

```text
Create a cinematic 600B Prague Party scene set on 2026-06-11.
Builders, operators, artists, partygoers, and bitcoiners gather in warm live-stage light.
Partygoers feel like future players: fans becoming bitcoiners, bitcoiners becoming builders.
Use one clear 600B signal object.
Do not write names, handles, or role labels onto people.
```

## Palace Game Prompt

```text
Create a stylized 600B Palace of Culture game scene.
The world is built from locked time: private plot, growing tree, companion animal, warm golden
palace in the distance.
Use toon-low-poly readability, gold and cream light, deep teal accents, one coral spark, calm
motion, and no combat.
Money buys style. Time builds legend.
```

## GM Ritual Prompt

```text
Create a meme-ready 600B ritual scene at 04:20 GMT.
racooDNI posts GM while generic automation tools handle background tasks.
Coffee, relaxed posture, controlled chaos, warm workbench light.
Preserve 600B palette and signal energy.
Do not use named machine lore unless explicitly requested.
```
