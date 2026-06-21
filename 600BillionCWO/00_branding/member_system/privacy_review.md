# Privacy Review

Scope checked:

- `members.json`
- `.well-known/nostr.json`
- `.well-known/lnurlp/*`
- `sticker.html`
- public website pages referencing Nostr/member data

No routing files were edited.

## Findings

### Public Nostr Routing

`.well-known/nostr.json` contains public NIP-05 names and pubkeys. This is expected for NIP-05,
but it permanently links handles to pubkeys. Keep it as the routing source and avoid duplicating
raw pubkeys into lore or generator JSON unless there is a strong reason.

The routing file includes more names than the website roster. That is not automatically a
problem, but future tooling should not assume every NIP-05 route is a public RPG character.

### Public LNURL Routing

`.well-known/lnurlp/*` exposes live payment callbacks and metadata. Several entries allow
comments. The `peter` LNURL route also exposes a third-party Wallet of Satoshi identifier and a
Nostr pubkey in the payment metadata.

These are public payment routes. Treat them as live infrastructure, not lore files.

### Website Roster

`members.json` publicly links display names, images, and NIP-05 names. This is the existing
website projection. The new `member_registry.json` references this data instead of adding raw
pubkeys or secrets.

### Sticker Address Collection

`sticker.html` currently asks users to put a shipping address into a Lightning payment comment.
That is privacy-sensitive because comments may be stored by payment infrastructure and can be
hard to delete or audit.

Recommended future change: collect a short order ID in the payment comment and handle shipping
details through a separate private channel or checkout flow.

## Rules For Future Work

- Do not commit Nostr private keys, `nsec` strings, wallet seeds, LNbits admin keys, or LNbits
  invoice keys.
- Do not add new public NIP-05 or LNURL routes without explicit opt-in.
- Do not copy raw routing data into generated lore when a reference to the routing source is
  enough.
- Do not write names, handles, or job titles into team images.
- Store signup and review decisions in SQLite before publication.
