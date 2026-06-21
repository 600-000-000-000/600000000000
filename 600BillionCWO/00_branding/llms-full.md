# 600B Universe - Full LLM Context

## Identity

We are 600 billion. We are not a generic crypto brand and not a cult. We are builders,
operators, memers, artists, players, and culture carriers carrying a signal through story,
image, software, events, and repetition.

## Core Truth

600B was never just the price. It was the signal.

Game-layer anchor:

```text
Money buys style.
Time builds legend.
```

## Sacred Number

Always write:

```text
600
000
000
000
```

Do not compress or freestyle the format.

## Sacred Stone

The 600B stone is small, round, dense, and charged. In the game layer, it is the first contact
object: quiet land, open sky, untouched earth, one small stone, and the question of how much
time the player gives to the future.

## World Layers

- Signal canon: council, memes, ritual, stone, builders, operators, public lore.
- Game canon: plots, companions, trees, palaces, timelocks, culture, patience, RPG systems.

Do not force every scene to carry both layers.

## Palace of Culture

The Palace of Culture is the game/RPG layer.

```text
people lock time -> time becomes assets -> assets become identity -> identity becomes culture
-> culture becomes community -> community builds the palace
```

Useful objects: private plot, tree, house, companion animal, vehicle, library, lighthouse,
observatory, hangar, 21-year spaceship, palace wing, event badge, seal.

## Places and Gatherings

Madeira is a valid origin echo only when island, sea-cliff, volcanic, or conference memory
matters. Prague Party 2026-06-11 is a strong event anchor for partygoers becoming fans,
bitcoiners, players, builders, and culture carriers.

## Member System

Use `member_system/member_registry.json` for structured member data. It should contain handles
and public aliases, but avoid duplicating raw pubkeys when `.well-known/nostr.json` already
serves NIP-05 routing.

Signup path:

```text
name + description
  -> signup intent in SQLite
  -> Nostr identity anchor
  -> LNbits wallet/account anchor
  -> library shuffle
  -> candidate profile
  -> avatar prompt + story/RPG card
  -> review
  -> optional publication
```

Do not place raw Nostr private keys, LNbits admin keys, or LNbits invoice keys in public JSON.
Store only pubkeys by reference, NIP-05 names, wallet references, Lightning handles, and secret
references.

## Avatar Pipeline

The identity or AvatarConfig is the source of truth. A generated image, GLB, or VRM is derived
art and can be rebuilt.

Linux builder target:

```text
signup/member record
  -> AvatarConfig
  -> toon humanoid concept
  -> GLB mesh
  -> humanoid rig
  -> VRM 1.0 with MToon
  -> validation report
  -> content-hash asset manifest
```

Output rules:

- stylized humanoid, toon, warm palette
- VRM 1.0 with complete VRM Humanoid bones for shared animation
- animals are companions or pets, not avatar bodies
- target budget: about 50k tris, 4 materials, 90 humanoid bones
- reject or downgrade off-style, over-budget, non-humanoid, or incomplete rigs

See `member_system/avatar_generation_linux.md`.

## Persona Clusters

- dni = dni, prophet, Bitcoin Jesus, racooDNI
- flx = flx, Chaos Engineer, Bullbear

Use one visible persona per identity cluster unless a deliberate split-persona scene is
requested.

## Council Roster

- dni - The Signal Bearer
- nind - The Architect
- michael1011 - The Machine Whisperer
- sat - The Signal Amplifier
- flx - The Chaos Engineer
- shillie - The Wave Rider
- derPeter21 - Guardian of Systems
- arbadacarba - The Strategist
- janine - Flame of Momentum
- benarc - Vision Crafter
- tobo - The Connector
- r0cks1 - Reality Bridge
- Lightrider - The Energy Core
- BlackCoffee - The Shadow Operator
- darren - The Pathfinder

## Team Image Rule

Do not write names, handles, job titles, or floating labels on team images. Identify characters
by silhouette, object, posture, costume, and placement.

Allowed text: sacred number in correct format, event signage such as `Prague Party 2026-06-11`,
and diegetic symbols, maps, seals, posters, or UI that do not name-tag people.

## Forbidden Drift

Reject outputs that:

- compress the sacred number into the wrong layout
- make the sacred stone huge by accident
- look like generic corporate crypto art
- make Madeira mandatory in every scene
- ignore gatherings, ritual, culture, patience, or build energy
- duplicate personas as separate people by accident
- use named proprietary machine lore by default
- frame new contributors as cult members
