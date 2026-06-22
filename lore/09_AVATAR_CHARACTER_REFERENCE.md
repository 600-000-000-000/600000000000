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
- If an active website member uses `img/600.png`, treat it as an active placeholder unless
  explicit user-provided identity details exist. Do not invent a unique face or body.
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
- Aliases/personas: dni, prophet, Bitcoin Jesus, racooDNI
- Status: active
- Generate: yes

Image details extracted: dark hooded mystic/operator, glowing orange signal disk behind
the head, raised hands with orange lights, chest light, black/brown robe, warm ritual-tech
atmosphere. User-specified canon: Bitcoin Jesus with Birkenstock-style sandals.

Full-body standard: adult humanoid signal bearer in dark robe or long coat, centered and calm,
hands open as if conducting the signal, small round stone or orb near chest or feet, wordless
orange halo behind the head, Birkenstock-style sandals without visible brand marks. Keep a
mysterious but readable face and a meme-prophet stance.

Preserve: hooded silhouette, orange halo, raised hands, Bitcoin Jesus meme-prophet identity,
Birkenstock-style sandals, mystic operator mood.

Avoid: institutional church-preacher costume, any readable text, sandal brand logos, giant stone,
random crown, making aliases/personas into separate characters.

### nind

- Website role: CCS
- Website image: `img/nind.jpg`
- Status: active
- Generate: yes

Image details extracted: abstract architectural avatar, cyan and black circular glass dome or
grid viewed from below, tunnel/dome depth, human presence implied but not portrait-forward.
User-specified canon: Indian, sells roses, big in cakes, OG Pepe/frog meme fan.

Full-body standard: adult humanoid architect/operator in clean dark utility clothing, framed by
a cyan geometric dome, bridge grid, or blueprint-light structure. Keep the figure precise,
technical, and understated. Add wordless roses, cake-box or pastry-tool props, and a small
wordless green frog charm as OG meme-culture cue.

Preserve: Indian identity, cyan dome, circular architecture, grid/tunnel depth, rose seller cue,
cake-craft cue, OG Pepe/frog meme fan charm, anonymous builder mood.

Avoid: any readable text, frog meme copy with text, brand logos, caricature, generic wizard,
random city crowd, losing the dome/grid cue.

### michael1011

- Website role: CTO
- Website image: `img/m2.png`
- Other local reference: `img/michael1011.jpg` is weak/placeholder-like
- Status: active
- Generate: yes

Image details extracted: hooded seated engineer monk in warm circular chamber, glowing orange
node or stone on the floor, triangle/sigil cue, soft technical halo, dark robe.
User-specified canon: OG coder who runs the node.

Full-body standard: adult hooded engineer monk, seated or standing in workshop stance, hands
near a glowing node, subtle cables and machine geometry, small server/node box, wordless
terminal-light props. Palette stays warm brown, orange, and charcoal.

Preserve: hood, seated-monk energy, glowing node, full-node operator identity, OG coder focus,
sacred-tech workshop.

Avoid: readable code or terminal text, generic hacker hoodie, robot villain, unreadable
black-on-black body.

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
- Titles: Head of Culture; Curator of 600 Billion
- Status: active
- Generate: yes

Image details extracted: dense Bullbear chaos collage, central armored bear/bull guardian,
horns, glowing orange eyes, black armor, coffee mug and signal props in the source, volcanic lightning,
market-symbol debris, racooDNI side gag, high-energy orange/black palette.
User-specified canon: head of culture and curator of 600 billion with absurdist/degen meme
energy and traditional grounding.

Full-body standard: simplify into one adult humanoid Bullbear chaos-engineer guardian: black
armor, horned/bear-mask helmet or crest, heavy boots, coffee or tool cue, orange lightning
cracks, curator/operator posture, ritual-cultural props, traditional material details. Keep force
and humor but remove clutter for rigging/readability.

Preserve: Bullbear mass, black armor, orange lightning, coffee/workshop cue, head-of-culture
identity, 600B curator role, absurdist traditional meme energy.

Avoid: any readable text, gore, too many background symbols, ableist framing, treating Bullbear
as a separate person from flx.

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

### rootzoll

- Website role: CDJ
- Website image: `img/rootzoll.png`
- Status: active
- Generate: yes

Image details extracted: smiling operator with yellow safety helmet, wordless decals on helmet,
black ear protection/headphones, glasses, outdoor blue-sky worksite light, practical jacket.
User-specified canon: DJ honeybadger with yellow helmet, vinyl record, and record case.

Full-body standard: adult humanoid honeybadger-coded DJ/operator with yellow helmet using only
wordless decals, black headphones, glasses, utility jacket, one vinyl record in hand, record
case at the side, warm worksite-meets-club posture, cypherpunk field-tech details, traditional
craft/tool cues, fantasy road-crew presence, cute manga/toon readability.

Preserve: yellow helmet, headphones, glasses, smiling worksite energy, DJ record and record
case, honeybadger coding.

Avoid: any readable text, readable helmet decals, brand logos, generic construction worker only,
record labels with text, replacing the humanoid body with a four-legged animal.

### nc

- Website role: CCC
- Title: Chief Culture Curator
- Website image: `img/nc.png`
- Status: active
- Generate: yes

Image details extracted: smooth rapper/performer in dark stage setting, cap, large dark
sunglasses, handheld microphone, orange bandana around neck, white shirt, wrist accessory, warm
low-key performance light. Source is a screenshot and contains subtitle/video UI text at the
bottom, which must not be reproduced.

Full-body standard: adult humanoid rap curator with cap, sunglasses, orange bandana, loose white
shirt or stage jacket, wordless handheld microphone, relaxed confident performance pose,
cypherpunk club light, traditional stage-craft details, fantasy bard/culture-curator energy, and
cute manga/toon readability.

Preserve: sunglasses, cap, microphone, orange bandana, smooth rapper posture, dark stage mood.

Avoid: any readable text, subtitles, video UI, watermark, brand logos, readable microphone or cap
labels, generic rapper stereotype without culture-curator warmth.

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

### bam

- Website role: CMO
- Nickname: jose bam
- Titles: Chief Meme Officer; Chief Mustache Officer
- Website image: `img/600.png`
- Source: user-provided identity description
- Status: active
- Generate: yes

Image details extracted: no unique local character image yet; current website image is the shared
`img/600.png` placeholder. User-specified canon: Mexican guy / Mexican-inspired meme officer with
big mustache, orange sombrero, sunglasses, and extra cool meme energy.

Full-body standard: adult humanoid meme maestro with big mustache, orange sombrero with no
readable decoration, dark sunglasses, warm poncho/serape or jacket accents, wordless meme-card
deck or talisman pouch, confident festival-host posture, cypherpunk party details, traditional
craft texture, fantasy trickster energy, and cute manga/toon readability.

Preserve: big mustache, orange sombrero, sunglasses, Chief Meme Officer energy, Chief Mustache
Officer joke, Mexican-inspired festival warmth, wordless meme props.

Avoid: any readable text, written memes, cap/hat labels, brand logos, flag text, caricature,
mockery, or reducing the character to a flat national stereotype.

### essex

- Website role: CPO
- Nickname: aaron of essex
- Title: Chief Punk Officer
- Website image: `img/essex.png`
- Status: active
- Generate: yes

Image details extracted: live stage performer leaning into a microphone, loose dark shirt, pale
trousers, warm orange/yellow stage light, drum kit behind him, microphone stands, punk gig
setting. Source image includes visible round 600-style mark and small lower-corner logo/text-like
artifact; these must not be reproduced.

Full-body standard: adult humanoid UK punk officer with rough stage hair, dark loose shirt or
patched jacket, pale trousers, beach-worn surfer details, small hippie charm or woven bracelet,
wordless microphone, band-stage stance, cypherpunk gig lighting, traditional punk DIY texture,
fantasy bard energy, and cute manga/toon readability.

Preserve: UK punk performer energy, microphone, stage/band setting, warm gig light,
hippie-surfer ease, relaxed rebellious posture.

Avoid: any readable text, visible 600 mark, logo artifacts, readable drum or stage labels, flag
text, generic royal/guard UK costume, or losing the punk/hippie/surfer blend.

### madmunky

- Website role: CPO
- Title: Chief Polish Officer
- Website image: `img/madmunky.png`
- Status: active
- Generate: yes

Image details extracted: low-angle portrait with shaggy hair / dreadlock-like silhouette, full
dark beard, mischievous raised-brow expression, cigarette-like prop, green jacket, bright blurred
urban/stone background. User-specified canon: DJ monkey who drops the fattest beats and always
causes mischief.

Full-body standard: adult humanoid monkey-coded DJ trickster with shaggy hair, full beard, green
jacket, DJ headphones, turntable or compact controller, vinyl crate, playful chaos props,
confident low-angle swagger, cypherpunk club lighting, traditional street-craft texture, fantasy
trickster energy, and cute manga/toon readability.

Preserve: DJ monkey identity, shaggy hair, beard, mischievous expression, green jacket, fat beat
dropper energy, playful troublemaker mood.

Avoid: any readable text, readable Polish symbols or flag labels, brand logos, mockery, flat
national stereotype, realistic animal body for VRM, or making the cigarette the main identity.

### p

- Website role: CBDC
- Nickname: protom
- Website image: `img/600.png`
- Source: user-provided identity description
- Status: active
- Generate: yes

Image details extracted: no unique local character image yet; current website image is the shared
`img/600.png` placeholder. User-specified canon: funny grinning cat from Alice-style wonderland
mixed with honeybadger, tall top hat, wizard style, and a signature grin mouth.

Full-body standard: adult humanoid honeybadger wizard with wonderland-cat mischief, oversized
signature grin, tall wordless top hat, striped or patchwork robe, small glowing potion or orb,
crooked staff, playful portal/smoke shapes, cypherpunk occult details, traditional storybook
craft, fantasy wizard style, and cute manga/toon readability.

Preserve: signature wide grin, top hat, wizard silhouette, honeybadger coding, playful
wonderland-cat mischief, funny magical oddness.

Avoid: copying a specific Disney Alice design, readable hat cards, written labels, visible text,
creepy horror mouth, realistic animal body for VRM, or losing the grin as the signature silhouette.

### longy

- Website role: CSO
- Website image: `img/600.png`
- External reference: `https://iris.to/npub19ppwxjrqckwl4n2a7j960fjsvhn8vrggcd0h092nmq7zcgcskjfsywp04j`
- Source: user-provided identity description
- Status: active
- Generate: yes

Image details extracted: no unique local character image yet; current website image is the shared
`img/600.png` placeholder. User-specified canon: street musician with guitar, punk attitude, and
cypherpunk energy.

Full-body standard: adult humanoid street guitarist with acoustic or electric guitar, patched
street jacket, rugged boots, small amp or open guitar case, cypherpunk signal glow, punk DIY
texture, urban busking posture, traditional folk-musician warmth, fantasy bard energy, and cute
manga/toon readability.

Preserve: street musician identity, guitar silhouette, punk attitude, cypherpunk signal energy,
busker posture, grounded human warmth.

Avoid: any readable text, readable stickers, readable guitar labels, readable signs, brand logos,
generic rock-star posing without street-musician warmth, or hiding the guitar silhouette.

### aj

- Website role: COL
- Website image: `img/600.png`
- Source: user-provided identity description
- Status: active
- Generate: yes

Image details extracted: no unique local character image yet; current website image is the shared
`img/600.png` placeholder. User-specified canon: Indian woman with hip-hop, reggae, and
cypherpunk vibes.

Full-body standard: adult Indian woman operator with hip-hop/reggae stage posture, headphones or
mic, layered streetwear, orange/green/gold accent cloth or scarf without flag text, braided or
flowing hair, sound-system speaker or rhythm prop, cypherpunk neon details, traditional textile
texture, fantasy sound-mage energy, and cute manga/toon readability.

Preserve: Indian woman identity, hip-hop/reggae sound-system energy, cypherpunk streetwear,
confident stance, warm music-culture charisma.

Avoid: any readable text, flag labels, brand logos, caricature, mockery, religious costume
shortcuts, or reducing the character to a flat national stereotype.

## Active Website Members With Placeholder Image

None currently. Every local branch member has either a local image reference or explicit
user-provided identity details.

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
