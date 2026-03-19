# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Xilinx Vivado FPGA firmware project for the NEM_DEVB (White Rabbit Network Enabled Module Development Board). The design integrates:

- **White Rabbit (WR)** precision time protocol core for sub-nanosecond synchronization
- **SiTCP** hardware TCP/IP stack for Ethernet communication
- **Multi-FPGA coordination** system controlling multiple Spartan-6 FPGAs from a Kintex-7 master
- **TDC (Time-to-Digital Converter)** data acquisition
- **Flash programming** infrastructure for remote firmware updates
- **Manchester encoding** for serial data transmission
- **IPbus** control and monitoring framework

Target device: Xilinx Kintex-7 XC7K325T (FFG900-2 package)

## Key Architecture Components

### Top-Level Design (top.sv)

The main design entry point (`project_1.srcs/sources_1/new/top.sv`) orchestrates:
- White Rabbit core instantiation (`wr_nem_core_k7.edf` - precompiled netlist)
- SiTCP network stack integration (`SiTCP_rfd_top.sv`)
- Multi-board communication via Manchester-encoded LVDS links
- Flash memory controller for in-system firmware updates
- RBCP (Remote Bus Control Protocol) register interface

### White Rabbit Integration

The WR core (`wr_nem_core_k7.vhd/.edf`) provides:
- SFP transceiver interface for fiber optic timing distribution
- PLL/DAC control for clock synthesis and phase adjustment
- One-wire interface for EEPROM configuration
- DMTD (Digital Dual Mixer Time Difference) clock for sub-ns precision

Key signals:
- `SFP_I_P/N`, `SFP_O_P/N`: Fiber optic differential I/O
- `MGTREFCLK0_P/N`: High-speed reference clock
- `CLK_62M5_DMTD`: DMTD clock input
- `PLL_*`, `DAC_*`: Clock synthesis control

### SiTCP Network Stack

`SiTCP_rfd_top.sv` and `project_1.srcs/sources_1/new/SiTCP/rtl/` contain:
- Hardware TCP/IP implementation
- RBCP register access protocol
- Gigabit Ethernet PCS/PMA (Physical Coding Sublayer/Physical Medium Attachment)
- Clock domain crossing between 125 MHz Ethernet and system clocks

Base IP address configuration: 192.168.10.x (configurable via parameters)

### Multi-FPGA Communication

The system controls up to 12 Spartan-6 FPGAs via:
- **Clock distribution**: 12 LVDS clock outputs (`CLK_LVDS25_P[1:12]`)
- **Data channels**: 12 LVDS data pairs (`DATA_LVDS25_P[1:12]`)
- **Feedback paths**: 12 LVDS feedback channels (`FB_LVDS25_P[1:12]`)

Key modules:
- `master_rx_k7.v`: Kintex-7 receiver for Spartan-6 data
- `master_rx_s6.v`: Alternative implementation
- `slave_tx.v`: Spartan-6 transmitter
- `manchester_encoder.v`/`manchester_decoder.v`: Line coding for robust serial transmission
- `master_rx_top.v`: Top-level multi-channel receiver orchestration

### Register Interface (RBCP_REG.sv)

Memory-mapped control/status registers accessed via SiTCP RBCP protocol:
- FPGA version/ID registers
- TDC configuration (up to 64 channels)
- DAC control (up to 4 DACs, 8 channels each)
- Flash programming control
- DIP switch status

Address space: 32-bit addressing, 8-bit data width

### Flash Management

Modules for remote firmware updates:
- `flash_update.v`: Main flash controller with ICAP (Internal Configuration Access Port)
- `read_write_flash.v`: Low-level SPI flash operations
- Multi-region support:
  - Golden image: Protected boot image
  - Final board firmware: `0x00AF0000`
  - Middle board firmware: `0x01660000`
  - TDC board firmware: `0x01860000`

### IPbus Components

The `components/` directory contains the IPbus framework for control/monitoring:
- `ipbus_core/`: Core transaction layer (VHDL)
- `ipbus_eth/`: Ethernet MAC interfaces (1000BASE-X, RGMII, GMII)
- `ipbus_transport_udp/`: UDP transport layer
- `ipbus_slaves/`: Peripheral interfaces (RAM, registers)
- `opencores_i2c/`, `opencores_spi/`: I2C/SPI cores

## Vivado Project Structure

- **Project file**: `project_1.xpr` (Vivado 2018.2 or compatible)
- **Source hierarchy**:
  - `project_1.srcs/sources_1/new/`: Primary RTL (SystemVerilog/Verilog/VHDL)
  - `project_1.srcs/constrs_1/new/`: Timing and pin constraints (XDC files)
  - `project_1.gen/`: Generated IP cores
  - `project_1.runs/`: Synthesis and implementation runs

- **Constraint files**:
  - `top.xdc`: Main pin assignments and timing constraints
  - `nemdevb_top.xdc`: Board-specific constraints

- **Build outputs**:
  - `top_*.bit`: Bitstream files (various configurations: fb, normal, rc)
  - `top_*.ltx`: Logic debug probe files for ILA (Integrated Logic Analyzer)
  - `readback.mcs`: Flash memory programming file

## IP Cores

Key Xilinx IP instantiated in the design:
- `gig_ethernet_pcs_pma_0`: Gigabit Ethernet PCS/PMA for SiTCP
- `axis_data_fifo_*`: AXI-Stream FIFOs for data buffering
- `ila_*`: Integrated Logic Analyzer for debugging
- `vio_*`: Virtual I/O for runtime control
- Clock managers (MMCM/PLL) for multi-domain clocking

## Building the Design

The project uses Vivado GUI or Tcl scripting:

### Vivado GUI
```bash
vivado project_1.xpr
```
Then use GUI commands: Run Synthesis → Run Implementation → Generate Bitstream

### Vivado Tcl (Command Line)
```tcl
# Launch Vivado in Tcl mode
vivado -mode tcl

# Open project
open_project project_1.xpr

# Run full build
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
```

### Programming
- Bitstream: Use Vivado Hardware Manager or external tools
- Flash: Convert `.bit` to `.mcs` with `write_cfgmem` Tcl command

## Key Design Parameters

Top-level module parameters (defined in `top.sv`):
- `SPARTAN6_NUM`: Number of controlled Spartan-6 FPGAs (default: 12)
- `DAC_NUM`: Number of DAC devices (default: 2)
- `GOLDEN`: Golden image mode flag (0=normal, 1=golden)
- `BIT_SIZE`: Firmware bitstream size for flash operations
- `BASE_IP_ADDR`: Network base IP address (in MD10_top: 192.168.10.34)

## Clock Domains

Multiple clock domains require careful CDC (Clock Domain Crossing) handling:
- **125 MHz**: Ethernet/SiTCP domain
- **200 MHz**: IDELAYCTRL reference clock
- **62.5 MHz**: White Rabbit DMTD clock
- **125 MHz**: System clock from external source
- **156.25 MHz**: Potential GT transceiver clock

Asynchronous crossing handled by:
- `async.v`: Generic CDC utilities
- `Flag_CrossDomain.v`: Flag synchronizer
- AXI-Stream async FIFOs in IP cores

## Common Development Workflows

### Debugging with ILA
The design includes Integrated Logic Analyzer cores. Access via:
```
vivado -mode tcl
open_hw_manager
connect_hw_server
open_hw_target
set_property PROBES.FILE {top_*.ltx} [current_hw_device]
refresh_hw_device [current_hw_device]
```

### Modifying Register Map
Edit `RBCP_REG.sv` to add/modify control registers. Key sections:
- Register address decoding (case statements on `RBCP_ADDR`)
- Read/write logic
- Reset values (`REG_INIT_X*` defines)

### Flash Programming via Network
Use RBCP protocol over SiTCP to:
1. Set `FLASH_ERASE_EN` register
2. Write data to `FLASH_WRITE_DATA` with `FLASH_WRITE_VALID`
3. Monitor `FLASH_WRITE_READY` for completion
4. Trigger ICAP reload

## Critical Design Notes

1. **Pin Reversals**: Several LVDS pairs have "pin reverse" comments in XDC - these are intentional PCB routing corrections

2. **WR Core**: The White Rabbit core is a precompiled EDIF netlist (`wr_nem_core_k7.edf`). Source code not available in this repo. Only interface VHDL stub provided.

3. **Multi-board Synchronization**: The Manchester-encoded links must maintain phase alignment. See `manchester_top_auto_align.v` for auto-alignment logic.

4. **Flash Safety**: Golden firmware region should never be overwritten. Always maintain fallback path.

5. **SiTCP Version**: Custom integration by Bee Beans Technologies. Consult SiTCP documentation for RBCP protocol details.

## File Naming Conventions

- `*_top.sv`: Top-level module integrations
- `*_rx.v`: Receiver modules
- `*_tx.v`: Transmitter modules
- `*.edf`: Encrypted/compiled netlists (binary IP)
- `*.xdc`: Xilinx Design Constraints (timing/pin assignments)

## Testing

No automated test infrastructure found in repository. Testing typically done:
- In-hardware with ILA probes
- External test equipment on LVDS links
- Network-based register access verification via RBCP

## Version Information

Recent commits indicate:
- Latest: "The final firmware with WR and SiTCP is working. The test system firmware is ready"
- Manchester coding stabilization completed
- Flash programming from K7 to SP6 functional

FPGA version parameter in code: `32'h2207_1609` (suggests July 2022 baseline)
