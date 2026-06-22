# 06 - Public Footprint

Public anchors already exist in the repo:

- `members.json` - public website roster projection
- `.well-known/nostr.json` - NIP-05 routing
- `.well-known/lnurlp/*` - LNURL-pay routing
- `img/` - public roster images

Do not edit `.well-known` routing files casually; they may back live Nostr or Lightning
addresses.

## Member Registry

Structured member/persona data lives in `../member_system/member_registry.json`. It references
public anchors instead of duplicating raw routing data where possible.

## Public Website Roster

Currently projected by `members.json`: dni, nind, michael1011, sat, flx, shillie,
arbadacarba, benarc, tobo, BlackCoffee, darren.

Canon roster currently not projected on the website: derPeter21, janine, r0cks1, Lightrider.

## Privacy Note

Nostr pubkeys, NIP-05 local names, and LNURL-pay endpoints are public routing data, but they
still create persistent identity/payment links. Do not add new ones without opt-in.

Detailed review notes live in `../member_system/privacy_review.md`.
