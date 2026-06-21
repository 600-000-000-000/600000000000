# 09 - Avatar Character Reference

Checked: 2026-06-21

Official name source of truth: `https://600.wtf/members.json`

Image source checked: local `img/`

Purpose: preserve the original avatar style while creating standardized full-body descriptions
for avatar regeneration, story images, RPG characters, and later VRM work.

## Data Reconciliation Rules

- The live website roster is the source of truth for active member names.
- A local image does not create an active member by itself.
- If a character image exists locally but its name is not on the website roster, mark it
  `inactive` and do not generate it.
- If an active website member uses `img/600.png`, treat it as an active placeholder. Do not
  invent a unique face or body until identity details exist.
- Routing files such as `.well-known/nostr.json` are not name authority for generation.

## Generation Rules

- Preserve the original avatar's strongest visual cue first.
- Generate full-body adult characters, head to toe visible.
- Keep a clean silhouette that can later become a rigged humanoid avatar.
- For animal-coded avatars, keep the animal identity as mask, head styling, outfit, companion,
  or mascot layer unless the request is explicitly 2D mascot art.
- Style target: cypherpunk, traditional/old-world craft, fantasy, cute manga/toon.
- Avatar images must contain no readable text at all: no names, handles, roles, cap labels,
  clothing labels, signs, readable numbers, or written 600B marks.
- Use wordless symbols instead: orange disks, abstract stacked glyphs, medallions, stones,
  orbs, costumes, silhouettes, objects, and posture.
- For non-avatar scenes only, if the sacred number appears, it must use this exact stacked layout:

```text
600
000
000
000
```

## Active Website Members With Unique Avatar References

### dni

- Website role: CEO
- Website image: `img/dni2.jpg`
- Other local reference: `img/dni.jpg`
- Status: active
- Generate: yes

Image details extracted: dark hooded mystic/operator, glowing orange signal disk behind
the head, raised hands with orange lights, chest light, black/brown robe, warm ritual-tech
atmosphere.

Full-body standard: adult humanoid signal bearer in dark robe or long coat, centered and calm,
hands open as if conducting the signal, small round stone or orb near chest or feet, wordless
orange halo behind the head. Keep a mysterious but readable face.

Preserve: hooded silhouette, orange halo, raised hands, mystic operator mood.

Avoid: literal church-preacher costume, any readable text, giant stone, random crown.

### nind

- Website role: CCS
- Website image: `img/nind.jpg`
- Status: active
- Generate: yes

Image details extracted: abstract architectural avatar, cyan and black circular glass dome or
grid viewed from below, tunnel/dome depth, human presence implied but not portrait-forward.

Full-body standard: adult humanoid architect/operator in clean dark utility clothing, framed by
a cyan geometric dome, bridge grid, or blueprint-light structure. Keep the figure precise,
technical, and understated.

Preserve: cyan dome, circular architecture, grid/tunnel depth, anonymous builder mood.

Avoid: generic wizard, random city crowd, losing the dome/grid cue.

### michael1011

- Website role: CTO
- Website image: `img/m2.png`
- Other local reference: `img/michael1011.jpg` is weak/placeholder-like
- Status: active
- Generate: yes

Image details extracted: hooded seated engineer monk in warm circular chamber, glowing orange
node or stone on the floor, triangle/sigil cue, soft technical halo, dark robe.

Full-body standard: adult hooded engineer monk, seated or standing in workshop stance, hands
near a glowing node, subtle cables and machine geometry. Palette stays warm brown, orange, and
charcoal.

Preserve: hood, seated-monk energy, glowing node, sacred-tech workshop.

Avoid: generic hacker hoodie, robot villain, unreadable black-on-black body.

### sat

- Website role: CMO
- Website image: `img/sat2.jpg`
- Other local reference: `img/sat.jpg`
- Status: active
- Generate: yes

Image details extracted: astronaut/explorer in an old city or plaza, bulky suit, glowing
Bitcoin emblem as helmet face/visor, warm orange-gold light.

Full-body standard: adult astronaut/explorer in clean bulky suit, wordless helmet or chest
emblem as main icon, standing in public square, conference plaza, or mission-gate environment.

Preserve: astronaut suit, helmet emblem, public explorer stance, orange-gold palette.

Avoid: NASA copy, any readable text, price-chart background.

### flx

- Website role: CWO
- Website image: `img/flx.jpg`
- Status: active
- Generate: yes

Image details extracted: dense Bullbear chaos collage, central armored bear/bull guardian,
horns, glowing orange eyes, black armor, coffee mug and signal props in the source, volcanic lightning,
market-symbol debris, racooDNI side gag, high-energy orange/black palette.

Full-body standard: simplify into one adult humanoid Bullbear chaos-engineer guardian: black
armor, horned/bear-mask helmet or crest, heavy boots, coffee or tool cue, orange lightning
cracks. Keep force and humor but remove clutter for rigging/readability.

Preserve: Bullbear mass, black armor, orange lightning, coffee/workshop cue.

Avoid: any readable text, gore, too many background symbols, treating Bullbear as a separate
person from flx.

### shillie

- Website role: CDO
- Website image: `img/quillie2.jpg`
- Other local reference: `img/quillie.jpg`
- Status: active
- Generate: yes

Image details extracted: public-facing operator with sunglasses, raised hands, orange signal
disk as face/halo, warm urban/event backdrop, black/orange contrast.

Full-body standard: adult amplifier/operator with sunglasses, confident open-hand pose,
streetwear or stage jacket, wordless orange disk/halo behind head or chest emblem, party-stage
or city venue light.

Preserve: sunglasses, orange signal disk, raised hands, urban event energy.

Avoid: any readable text, generic influencer look, losing sunglasses/halo cue.

### arbadacarba

- Website role: CMO
- Website image: `img/arbadacarba.jpg`
- Status: active
- Generate: yes

Image details extracted: elegant robed strategist in a grand ritual library or hall, full-body
stance, arms open, glowing signal orb behind or above, gold/brown atmosphere.

Full-body standard: adult strategist in dark robe or tailored ritual coat, centered in library
or council archive, one glowing orb or book-light behind, composed and deliberate posture.

Preserve: library/hall, open arms, dark elegant robe, glowing knowledge orb.

Avoid: chaotic spell spam, generic fantasy sorcerer only, unreadable face.

### benarc

- Website role: CVO
- Website image: `img/benarc.jpg`
- Status: active
- Generate: yes

Image details extracted: dynamic vision crafter/forge figure, raised tool or blade-like object,
dramatic orange light, glowing 600 shield/orb, workshop/forge action.

Full-body standard: adult creator in forge-workshop clothing, one hand lifting a tool, brush,
or hammer, other hand shaping a wordless glowing emblem or artifact. Keep diagonal action but
make body clean and riggable.

Preserve: forge light, dynamic diagonal pose, artifact creation, glowing emblem.

Avoid: combat warrior as default, giant weapon focus, random fantasy armor.

### tobo

- Website role: CDO
- Website image: `img/tobo.jpg`
- Status: active
- Generate: yes

Image details extracted: frontier diplomat/statesman wearing tricorn hat, sunglasses or
laser-eye glow, old-world coat, pointing hand, warm gold background, side signal disk.

Full-body standard: adult envoy in old-world coat and tricorn silhouette, confident pointing or
welcoming gesture, warm civic backdrop, subtle Bitcoin/600B signal object.

Preserve: tricorn hat, old-world coat, sunglasses/laser-eye cue, pointing gesture.

Avoid: historical parody only, readable labels, too much costume clutter.

### BlackCoffee

- Website role: CHO
- Website image: `img/blackcoffee600bn.jpg`
- Status: active
- Generate: yes

Image details extracted: dark armored shadow operator/knight under storm sky, coffee mug,
lightning, glowing signal disk behind, quiet intense pose.

Full-body standard: adult armored operator in black or charcoal armor/heavy coat, wordless
coffee mug as signature object, storm light behind, disciplined low-motion posture.

Preserve: black armor, coffee mug, storm, quiet discipline.

Avoid: villain face, horror gore, blue noir palette overpowering orange signal.

### darren

- Website role: CIO
- Website image: `img/darren.png`
- Status: active
- Generate: yes

Image details extracted: cartoon donkey on mountain peak, orange Bitcoin flag, snowy peaks,
blue binary sky, clear meme simplicity.

Full-body standard: for 2D mascot art, keep the donkey as the main character. For game/VRM,
convert to adult humanoid pathfinder with practical explorer clothes, donkey companion, and
orange flag.

Preserve: donkey identity, mountain summit, orange flag, binary sky.

Avoid: losing flag/summit cue, realistic donkey style, non-humanoid VRM output.

### jedai

- Website role: CIAO
- Website image: `img/jedai.png`
- Status: active
- Generate: yes

Image details extracted: dark cypherpunk strategist seated in a leather command chair,
sunglasses, black shirt and coat, patterned scarf, cigar, watch, whiskey glass, chessboard with
gold and black pieces, storm clouds, golden halo geometry, vertical lightning, bear force on
the left, eagle vision on the right.

Full-body standard: adult humanoid cypherpunk strategist in dark tailored coat, scarf, and
sunglasses, relaxed command posture, one hand holding a wordless cigar-like prop or strategy
token, chess-piece object language, wordless golden halo geometry, bear/eagle aura companions
or heraldic silhouettes, traditional old-world craft details, fantasy authority, cute manga/toon
readability.

Preserve: sunglasses, dark coat/scarf, seated strategist confidence, chessboard strategy cue,
golden halo, bear/eagle power balance.

Avoid: any readable text, real brand marks, readable chess labels, over-realistic corporate
portrait, making bear or eagle replace the humanoid avatar body.

### Gadaj

- Website role: CKO
- Nickname: GDJ
- Title: Chief Kurwa Officer
- Website image: `img/gadaj.png`
- Status: active
- Generate: yes

Image details extracted: boar-coded muscular guardian standing in heavy rain, red headband,
large tusks and snout, huge flexed arms, wet dark fur/armor-like body texture, orange belt with
wordless emblem cue, brick industrial building behind, forest silhouette, cold grey-blue rain
atmosphere.

Full-body standard: adult humanoid boar-coded rain-yard guardian with massive but riggable
proportions, red headband, broad shoulders, orange wordless belt medallion, industrial
courtyard and dark forest backdrop, traditional warrior stance, cypherpunk grit, fantasy brute
presence, and cute manga/toon readability.

Preserve: boar head/snout/tusks, red headband, rain, industrial yard, huge guardian build,
orange belt cue.

Avoid: any readable text, readable belt symbols, realistic-only animal anatomy for VRM,
oversexualized bodybuilder framing, replacing the humanoid body with a four-legged boar.

### mhb

- Website role: CRO
- Nickname: mrs. honeybadger
- Website image: `img/mhb.jpeg`
- Status: active
- Generate: yes

Image details extracted: cute manga/toon honeybadger-coded feminine character, long blonde hair,
orange boho robe with cream trim, dreamcatcher, bracelets/necklaces, wordless orange medallion, warm
teal/gold bokeh, joyful ritual movement.

Full-body standard: adult humanoid honeybadger-coded ritual dancer or culture carrier, long
blonde hair, orange robe, cream trim, dreamcatcher/charm object, warm teal/gold background.
Keep cute manga/toon line-art style with cypherpunk and traditional craft details.

Preserve: honeybadger coding, long blonde hair, orange robe, dreamcatcher, cute manga/toon line art.

Avoid: realistic animal body for VRM, generic fantasy elf, losing robe/dreamcatcher cue.

### snick

- Website role: CWO
- Website image: `img/snick.jpeg`
- Status: active
- Generate: yes

Image details extracted: cute manga/toon badger-coded workshop operator, plain orange cap,
relaxed eyes, smoke, gold chain, wordless orange medallion, tool wall, jars, plants, warm indoor workshop/grow-room.

Full-body standard: adult humanoid badger-coded builder/operator, plain orange cap with no
letters, workbench/tool wall, chain or wordless medallion, relaxed confident posture. For game
output, keep the badger identity as head styling/mask on a riggable humanoid.

Preserve: badger coding, orange cap, tool wall, plants, chain/medallion, relaxed workshop mood.

Avoid: any cap text, realistic animal anatomy for VRM, overemphasizing smoke, clutter hiding
the silhouette.

## Active Website Members With Placeholder Image

These members are active because they are on the website. They use `img/600.png`, so no unique
avatar details can be extracted yet. Do not generate unique full-body avatars until identity
descriptions are provided.

| Name | Nickname | Role | Image | Status | Generate unique avatar |
|---|---|---|---|---|---|
| rootzoll | | CDJ | `img/600.png` | active_placeholder | false |
| nc | | CCC | `img/600.png` | active_placeholder | false |
| longy | | CSO | `img/600.png` | active_placeholder | false |
| essex | aaron of essex | CPO | `img/600.png` | active_placeholder | false |
| p | protom | CBDC | `img/600.png` | active_placeholder | false |
| aj | | COL | `img/600.png` | active_placeholder | false |
| bam | jose bam | CMO | `img/600.png` | active_placeholder | false |

Temporary fallback, if a placeholder visual is required: adult humanoid builder silhouette with
wordless orange medallion, no locked face, no locked outfit, no implied personal traits.

## Inactive Local Character Images

These images exist locally but are not in the live website roster. They are inactive for
generation and must not be used for new member/avatar output unless the website roster adds them.

| Local file | Former/likely name | Status | Generate |
|---|---|---|---|
| `img/p21.jpg` | derPeter21 / p21 | inactive | false |
| `img/janine.jpg` | janine | inactive | false |
| `img/r0cks1.jpg` | r0cks1 | inactive | false |
| `img/lightrider.png` | Lightrider | inactive | false |

## Non-Member Local Assets

These files are available assets but not official active member avatars.

| Local file | Handling |
|---|---|
| `img/oink.jpg` | mascot/companion reference only; not active member generation |
| `img/shrooms.jpg` | symbol/asset, not a member |
| `img/600.png` | active placeholder symbol |
| `img/600-old.png` | old symbol asset |
| `img/600_small.png` | small symbol asset |
| `img/favicon.ico` | site icon |
