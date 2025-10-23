# RoomOccupancy VHDL Project

This repository contains a VHDL implementation of a **Room Occupancy Counter**. The design monitors the number of people in a room and indicates when the maximum occupancy has been reached.

## Table of Contents
- [Description](#description)
- [Entity and Ports](#entity-and-ports)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [Simulation](#simulation)
- [Author](#author)

## Description
The `RoomOccupancy` module counts the number of occupants in a room based on two input signals:
- `X`: increment signal (person enters)
- `Y`: decrement signal (person exits)

It ensures the count does not exceed the specified `max_occupancy` and outputs:
- `occupancy_count`: current number of occupants
- `Z`: high when maximum occupancy is reached

A synchronous reset (`reset_signal`) allows clearing the occupancy count to zero.

## Entity and Ports

| Port Name       | Direction | Type                | Description                     |
|-----------------|-----------|-------------------|---------------------------------|
| clk             | in        | STD_LOGIC          | Clock signal                     |
| reset_signal    | in        | STD_LOGIC          | Synchronous reset                |
| X               | in        | STD_LOGIC          | Increment signal (person enters)|
| Y               | in        | STD_LOGIC          | Decrement signal (person exits) |
| max_occupancy   | in        | INTEGER 0..63      | Maximum occupancy allowed        |
| Z               | out       | STD_LOGIC          | High when max occupancy reached  |
| occupancy_count | out       | INTEGER 0..63      | Current occupancy count          |

## Architecture
The design is structured as follows:
- **Register Process**: Holds the current count and updates on rising clock edge.
- **Next State Logic Process**: Computes the next count based on inputs `X` and `Y` and sets the `Z` flag when maximum occupancy is reached.
- **Output Assignment**: `occupancy_count` and `Z` are assigned from internal signals.

## Technologies Used
- **VHDL** (IEEE.STD_LOGIC_1164)
- **Simulation Tools**: ModelSim, QuestaSim, Vivado Simulator
- **Target Boards**: Xilinx FPGA boards (optional)

## Simulation
1. Open the `RoomOccupancy.vhd` file in your simulator.
2. Create a testbench to apply various sequences of `X` and `Y` signals and check `occupancy_count` and `Z`.
3. Run the simulation to verify correct counting and max occupancy detection.

Example testbench scenarios:
- Increment count until max occupancy is reached.
- Decrement count to zero.
- Apply simultaneous `X` and `Y` signals and observe correct behavior.


