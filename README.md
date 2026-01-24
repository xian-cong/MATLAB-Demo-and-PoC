# Polyspace Documentation

This branch shows how to setup the final stage of polyspace (after installation). It shows how the polyspace bugfinder and polyspace access works.
It also shows how the polyspace bugfinder server license can point to matlab network license manager.

## Prerequisites
- Install polyspace access on one server, could be same server where network license manager is stored
- Install polyspace bugfinder and code prover on another server, could be in VMWare (but config to Bridged Network)

## Important files
- license_config.pdf -> shows how polyspace bugfinder server in VM points to MATLAB network license manager
- integrating_polyspace_servers -> shows how to get servers running and get started