# Spawn Hill arena plan

## Selected space

The prototype uses the initial elevated hill in Floodgate's `set_workertown`
zone set. The natural rock walls create a compact, readable survival arena and
the open center has enough room for cooperative players and purchase stations.

## Prototype layout

- **Player hold area:** central high ground around the large rocks.
- **Flood lane A:** lower/front dirt approach.
- **Flood lane B:** left approach near the existing scenery and turret.
- **Flood lane C:** far/right approach toward the industrial structure.
- **Weapon station:** central rock face, visible from all three approaches.
- **Ammo station:** rear side of the central rocks, requiring players to turn
  away from the fighting briefly.
- **Exit boundary:** visible UNSC barricades where practical, backed by a
  trigger-volume return boundary so players cannot escape the arena.

## Boundary implementation

### Prototype

Place static scenery or crates to communicate the boundary visually. Use the
following existing tags:

- `objects\gear\human\military\barricade_large\barricade_large.crate`
- `objects\gear\human\military\barricade_small\barricade_small.crate`
- `objects\gear\human\industrial\jersey_barrier\jersey_barrier.scenery`

Do not physically seal the three Flood lanes. A trigger volume surrounding the
allowed player space will return escaping players to the hold area.

### Custom-map phase

Replace the scripted return boundary with `+soft_ceiling:survival_bounds`
structure-design geometry. Halo 3 soft ceilings affect player bipeds but allow
AI to pass, which makes them ideal for keeping players on the hill without
blocking Flood navigation.

## First playable wave arrangement

| Wave | Lane A | Lane B | Lane C |
| --- | ---: | ---: | ---: |
| 1 | 3 human combat forms | 3 human combat forms | - |
| 2 | 4 human combat forms | 4 human combat forms | infection forms |
| 3 | 4 human combat forms | 4 elite combat forms | 4 human combat forms |
| 4 | 5 mixed combat forms | 5 mixed combat forms | carriers + infection |
| 5 | 6 mixed combat forms | 6 mixed combat forms | 2 pure-form tanks |

Spawn points should be outside direct player sight and assigned to an objective
that brings them onto the central hill. Generate all pathfinding after the
placement pass.

