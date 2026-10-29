# Programmable Network Lab

Coursework for **Programmable Network** (Universiti Malaya). Course-provided scripts build a
routed network in Mininet from YAML files; this repo holds my work on top of them.

## What I did so far

- Wrote `check_paths()`, which traces packets hop by hop and reports routing loops and
  missing routes before the network is built
- Designed my own routed topology and static routes (`network.yaml`, `routes.yaml`)
- Tested the checker with faulty inputs (`loop.yaml`, `missing.yaml`, `bad.yaml`)
- Saved ping, traceroute and routing-table output as evidence (`evidence/`, `week3/`)
- Packaged the lab environment with Docker (`Dockerfile`, `setup.sh`)

