# Signup Flow

The signup system turns a person into a 600B candidate profile without publishing private data
or creating accidental duplicate characters.

## Inputs

- display name
- short self-description
- optional aliases
- optional Nostr/NIP-05 anchor
- optional Lightning/LNbits anchor
- optional GitHub handle
- optional avatar preferences
- consent flags

## Flow

```text
1. Receive signup_profile.schema.json payload.
2. Store raw request in SQLite as status=PENDING.
3. Normalize display name and aliases.
4. Check for collisions against member_registry.json and prior signup_requests.
5. Create or link Nostr identity anchor.
6. Create or link LNbits wallet/account anchor.
7. Shuffle generator_library.json with the user's description.
8. Produce candidate profile, story profile, RPG role, and avatar prompt.
9. If avatar consent is true, create an avatar job for the Linux VRM pipeline.
10. Review candidate.
11. Publish only approved public projection.
```

## Privacy

Never publish:

- raw Nostr private keys
- nsec strings
- LNbits admin keys
- LNbits invoice keys
- wallet seeds
- emails
- phone numbers
- shipping addresses

Public JSON may contain:

- display name
- selected aliases
- public image path or asset reference
- public NIP-05 name
- public Lightning address or LNURL reference
- GitHub handle when user opted in
- generated story/image descriptions

## Candidate Statuses

- `PENDING` - received but not processed
- `GENERATED` - candidate profile exists
- `REVIEW` - needs human check
- `APPROVED` - can be projected publicly
- `PUBLISHED` - appears in public registry/site/game
- `REJECTED` - not used; reason is recorded

## Review Checklist

- Does this duplicate an existing identity cluster?
- Are aliases attached to the right cluster?
- Are private keys and LNbits secrets absent?
- Does the image prompt avoid visible labels on team images?
- Is the avatar humanoid if VRM output is requested?
- Does the profile avoid cult framing?
- Is the sacred number written correctly when used?
