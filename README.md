# port-operations-pddl

# Automated Task Planning for Port Operations (PDDL)

This project models and solves an automated task planning problem for an autonomous port robot using **PDDL (Planning Domain Definition Language)** with STRIPS and typing requirements.

## Overview
The `port-operations` domain represents a port environment where an autonomous robot (crane truck) must transport and stack containers across connected docks while respecting physical and resource constraints.

### Domain Entities (`domain.pddl`)
* **Types:** `dock`, `container`, `robot`
* **Constraints Modeled:**
  * Bidirectional connectivity between docks.
  * Exclusive dock occupancy (`free-dock`): only one robot can occupy a dock at a time.
  * Robot capacity (`empty`, `in`): a robot can carry at most one container at a time.
  * Stacking rules (`on`, `on-base`, `clear`): containers can only be loaded if they are clear on top.
* **Actions:** `move`, `load-from-base`, `load-from-top`, `unload-to-base`, `unload-to-top`.

### Problem Instance (`problem.pddl`)
* **Setup:** 3 docks (`d1`, `d2`, `d3`), 3 containers (`c1`, `c2`, `c3`), and 1 robot (`r1`).
* **Goal:** Relocate all containers to dock `d3` in a specific stacking configuration (`c3` on base, `c1` stacked on `c2`) and return robot `r1` to dock `d1`.

## Results
Solved using automated PDDL planners, yielding an **optimal plan of 15 steps** that satisfies all topological, capacity, and stacking constraints.
