# 600B Member System

This folder standardizes identities, aliases, signup-generated candidates, avatar prompts,
Nostr anchors, Lightning/LNbits anchors, and future GitHub anchors.

The goal is scale: one person can sign up with a name and description, then the system can
generate a candidate identity, story card, RPG role, avatar prompt, and eventually a VRM
avatar without turning the person into a "cult member".

## Source Of Truth

- `member_registry.json` - canon identities, aliases, personas, image descriptions
- `generator_library.json` - reusable building blocks for generated candidates
- `signup_profile.schema.json` - input contract for a new candidate
- `member_registry.schema.json` - registry validation shape
- `schema.sql` - SQLite audit/data model
- `signup_flow.md` - signup and review process
- `avatar_generation_linux.md` - Linux avatar/VRM production pipeline
- `privacy_review.md` - current public identity/payment privacy notes

## Identity Rules

- One real identity can have many aliases or personas.
- Personas do not automatically become separate people.
- Team images never write names, handles, or job titles on people.
- Raw Nostr private keys, LNbits admin keys, and LNbits invoice keys never go into public JSON.
- Public routing files under `.well-known` are referenced, not edited by this system.

## Data Flow

```text
name + description
  -> SQLite signup request
  -> Nostr identity anchor
  -> LNbits wallet/account anchor
  -> generator library shuffle
  -> candidate profile
  -> avatar prompt + story/RPG card
  -> optional VRM avatar job
  -> review
  -> publication
```

The database is the audit trail. JSON files are documentation and public projection until the
generator/runtime exists.
