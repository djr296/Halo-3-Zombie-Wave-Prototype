# Sapien checklist: first playable build

## Preserve the stock content

- Copy the chosen scenario and its mission resources to a unique mod path.
- Confirm that the copied scenario opens before changing anything.
- Keep the stock tag tree untouched.

## Define the play space

- Select one compact room or arena with at least two AI approaches.
- Put the player starting location inside the defended area.
- Add an initial assault rifle, shotgun, and ammunition pickups.
- Add temporary blockers to routes that should not be used in this prototype.

## Configure Flood AI

- Create AI references named `fs_wave_01` through `fs_wave_05`.
- Give each reference at least two spatially separated spawn locations.
- Keep spawn points outside direct player sight where possible.
- Assign Flood character variants and counts from `balance.csv`.
- Create a shared objective with tasks that drive all wave groups toward the
  defended area.
- Verify that Flood can traverse every route.
- Generate all pathfinding data.

## Attach and test the script

- Copy `flood_survival.hsc` into the matching `data` scripts directory.
- Attach it through Add Mission Script when working with split scripts.
- Compile scripts and resolve every red compiler entry.
- Run game scripts in Sapien.
- Confirm that only wave 1 spawns initially.
- Kill wave 1 and confirm wave 2 starts after ten seconds.
- Complete all five waves and confirm the victory message appears.

## Record during the test

- Flood that fail to leave their spawn area.
- Routes where AI bunch together or become stuck.
- Average completion time for each wave.
- Ammunition remaining after each wave.
- Whether cooperative players can join and respawn correctly.

