# Avatar Generation On Linux

This is the headless authoring pipeline for turning a signup/member identity into a simplified
toon humanoid avatar and, later, a rigged VRM for the RPG.

The hard rule: AvatarConfig is the source of truth. A generated concept image, GLB, or VRM is
derived art and can be regenerated.

## Output Contract

Every game avatar emitted by the pipeline must be:

- VRM 1.0 with a complete VRM Humanoid bone set
- simplified, stylized, humanoid, toon
- MToon material with warm 600B palette
- readable on Pixel 8+ class devices
- about 50k triangles, 4 materials, 90 humanoid bones for hero avatars
- content-hashed and registered in an asset manifest
- accompanied by a JSON validation report

Animals, mascots, and companions can exist beside the character. They are not avatar bodies for
VRM output.

If a result is over budget, off-style, non-humanoid, or missing required bones, the pipeline
downgrades or rejects it and records the reason.

## Runtime Target

The Linux laptop/workstation is for authoring. The game runtime only needs clean VRM assets and
shared animations. It should not care whether the VRM came from Hunyuan3D, TRELLIS.2, Blender,
or a manual correction pass.

## Proposed Implementation Path

In the game/PoC monorepo, place the executable pipeline at:

```text
packages/assets-pipeline/avatar/
```

Suggested modules:

```text
avatar_pipeline.py
stylize.py
image_to_3d.py
autorig.py
to_vrm.py
validate.py
publish.py
blender/make_vrm.py
```

This branding repo keeps the canon, schemas, and prompt contracts. The Linux build machine can
consume these files.

## Stages

```text
member/signup record
  -> AvatarConfig
  -> toon humanoid concept
  -> textured GLB mesh
  -> humanoid skeleton + skin weights
  -> VRM 1.0 + MToon
  -> budget/style validation
  -> content hash + manifest
```

### 1. AvatarConfig

Build from:

- `member_registry.json` for canon members
- `signup_profile.schema.json` plus `generator_library.json` for generated candidates
- user opt-in preferences

Example:

```json
{
  "identity_id": "candidate_001",
  "style": "simplified stylized humanoid toon",
  "hair": "short dark hair",
  "outfit": "black hoodie with gold workwear details",
  "palette": "ember_teal",
  "key_objects": ["small round stone", "toolbelt"],
  "companion": "small donkey companion beside the character, not avatar body",
  "avoid": ["visible name label", "giant stone", "realistic photo style"]
}
```

### 2. Stylize

If the input is a realistic photo or PFP, stylize it first into a full-body toon humanoid
concept. ComfyUI with an SDXL img2img graph is acceptable as a service. Text-only inputs can
generate the concept directly.

### 3. Image To 3D

Pragmatic options:

- Hunyuan3D for lower VRAM machines
- TRELLIS.2 for higher quality when GPU memory allows

Output should be a single textured GLB in a neutral pose, Y-up, meter scale.

Licensing must be checked before shipping generated output, especially model licenses and LoRA
licenses.

### 4. Auto Rig

The GLB must become a humanoid skeleton that maps cleanly to VRM Humanoid bones.

Options:

- Hunyuan3D rigging when staying in that toolchain
- UniRig for open mesh auto-rigging
- AccuRIG/ActorCore if the workflow accepts its terms
- Blender Rigify/manual pass for hero corrections

### 5. VRM And MToon

Use Blender headless with VRM-Addon-for-Blender:

```bash
blender --background --factory-startup \
  --python packages/assets-pipeline/avatar/blender/make_vrm.py -- \
  in.glb out.vrm
```

The script should:

1. import the rigged GLB
2. assign VRM Humanoid bones
3. convert materials to MToon
4. add small spring-bone chains for hair or cloth where useful
5. export VRM 1.0

### 6. Validate

Use a small validator plus `gltf-transform inspect` to verify:

- triangle count
- material count
- texture count
- humanoid bone completeness
- MToon material presence
- asset hash
- style notes

Report format:

```json
{
  "vrm": "600B_AVATAR_candidate_001_LOD0.vrm",
  "sha256": "<content hash>",
  "tris": 42112,
  "materials": 3,
  "bones": 72,
  "humanoidComplete": true,
  "downgraded": false,
  "notes": []
}
```

### 7. Publish

Write content-hashed files to the asset store, then register them in SQLite and a manifest. A
future Blossom mirror can store a content reference on the character record.

## Agent Interface

One command should be enough for an agent:

```bash
python packages/assets-pipeline/avatar/avatar_pipeline.py \
  --input path/to/pfp.png \
  --identity '{"hair":"long","outfit":"hoodie","aura":"#1f6b62"}' \
  --out out/ \
  --engine hunyuan3d \
  --quality builder
```

Text-only generation:

```bash
python packages/assets-pipeline/avatar/avatar_pipeline.py \
  --prompt "a calm Palace builder with toolbelt and small round stone" \
  --identity path/to/avatar_config.json \
  --out out/ \
  --engine trellis2 \
  --quality hero
```

## Linux Install Notes

- isolated Python/conda environment per model
- ComfyUI service for optional stylization
- Blender with VRM-Addon-for-Blender
- Node with `@gltf-transform/cli`
- local asset output directory with content hashes
- SQLite database from `schema.sql`

Keep proprietary or secret service keys out of the repo. Store only secret references in
SQLite, never raw admin keys.
