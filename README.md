# Halo 3 Flood Survival Prototype

This is the source scaffold for a cooperative, Call of Duty Zombies-inspired
Flood survival mode in Halo 3 MCC.

![Status](https://img.shields.io/badge/status-archived-lightgrey)
![Game](https://img.shields.io/badge/game-Halo%203%20MCC-7a5cff)
![License](https://img.shields.io/badge/license-MIT-blue)

> **Status:** Archived prototype. Development stopped after the initial design,
> HaloScript scaffold, and a command-line scenario-editing experiment. The
> repository is published so another modder can continue the idea.

This repository contains only original source and documentation. It does not
contain Halo maps, tags, textures, audio, or other Microsoft game assets. You
must supply your own licensed MCC installation and Halo 3 Mod Tools.

## At a glance

| Area | State |
| --- | --- |
| Wave controller | Five-wave HaloScript scaffold complete |
| Balance | Initial enemy counts, rewards, and timing documented |
| Arena | Floodgate spawn-hill layout documented |
| Scenario setup | Requires Sapien placement and pathfinding |
| Playable `.map` | Not completed or distributed |

The repository is a handoff package, not a finished downloadable mod. Its value
is the small, readable foundation for someone who wants to finish the Sapien
work or adapt the wave controller to another Halo 3 scenario.

## Prototype goal

The first playable build has:

- one existing Halo 3 campaign combat space;
- five Flood waves;
- a 20-second preparation period;
- a 10-second break between waves;
- a shared supply pool awarded when a wave is cleared;
- victory after wave five.

Purchasing, doors, weapon variants, and an endless-wave controller come after
this loop has compiled and run successfully in Halo 3 Standalone.

## Required software

- Halo: The Master Chief Collection on Steam;
- the Halo 3 component of MCC;
- **Halo 3 Mod Tools - MCC** from the Steam Library's Tools category.

## Scenario naming contract

In Sapien, create the following five AI squad groups or AI references. Each can
contain several individual squads and spawn points:

| Script reference | Suggested contents |
| --- | --- |
| `fs_wave_01` | 6 basic Flood combat forms |
| `fs_wave_02` | 8 basic forms + infection forms |
| `fs_wave_03` | 10 basic forms + 2 armed forms |
| `fs_wave_04` | 12 mixed combat forms + carrier forms |
| `fs_wave_05` | 14 mixed forms + 2 tougher forms |

Each group needs an AI objective that can navigate from every spawn point into
the defended area. Generate pathfinding data before testing.

## Files

- `data/scripts/flood_survival.hsc` - first-pass HaloScript controller.
- `design/balance.csv` - editable five-wave tuning table.
- `design/sapien-checklist.md` - the visual-editor work needed for the first run.
- `design/spawn-hill-arena.md` - agreed layout for the Floodgate spawn hill.
- `tools/Test-FloodSurvivalProject.ps1` - validates the source pack.
- `config/editor_init.txt` - prevents repetitive stock object-function warnings
  from covering Sapien's game window.

## Build sequence after the tools are installed

1. Copy a suitable stock Halo 3 campaign scenario into a uniquely named mod
   directory inside the Halo 3 Mod Tools depot. Never edit the stock scenario.
2. Open the copied scenario in Sapien.
3. Add the five AI references listed above and set up their spawn points,
   zones, areas, firing positions, and objective tasks.
4. Copy `flood_survival.hsc` into the scenario's corresponding `data` scripts
   directory.
5. Attach it with **Scenarios > Add Mission Script** if the scenario uses split
   mission scripts.
6. Compile scripts with **Ctrl+Shift+C**.
7. Generate all pathfinding data.
8. Use **Scenarios > Run Game Scripts**, then test the encounter in Standalone.

## Validate the source package

From PowerShell at the repository root:

```powershell
.\tools\Test-FloodSurvivalProject.ps1
```

This checks the expected source files and the script's naming contract. It
does not compile Halo tags or replace an in-engine playtest.

## What was completed

- Five-wave HaloScript scaffold and tuning table
- Floodgate spawn-hill arena design
- Sapien setup notes and warning suppression configuration
- Source validation script

No distributable `.map` file was completed. The local experiment used a copy
of Floodgate generated with `tool scenario-empty`; that proprietary scenario
is intentionally not included.

## Continuing the project

Fork the repository and start with `design/sapien-checklist.md`. Contributions
that keep the repository source-only are welcome. Do not open pull requests
containing extracted tags, maps, textures, sounds, or other game assets.

Useful next milestones are:

1. complete and verify the five encounter groups in Sapien;
2. compile the script and finish one five-wave playtest;
3. add a purchasable weapon or refill station;
4. replace fixed wave declarations with a reusable endless-wave director;
5. package distribution instructions that reference—but do not redistribute—
   the user's licensed game content.

## License and trademarks

The original code and documentation in this repository are available under the
MIT License. Halo and related names and assets belong to Microsoft and their
respective owners. This is an unofficial fan project and is not endorsed by or
affiliated with Microsoft, Xbox, Halo Studios, or Bungie.
