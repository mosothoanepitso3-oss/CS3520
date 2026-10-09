# Lab 3: Step 3 Trace Table

| Element | Port | Value |
| :--- | :--- | :--- |
| **pc_reg** | out | `0x00000008` |
| **pc_4** | out | `0x0000000c` |
| **instr_mem** | data_out | `0x006283B3` |
| **decode** | r1_reg_idx / r2_reg_idx | `5 / 6` |
| **decode** | wr_reg_idx | `7` |
| **control** | reg_do_write_ctrl | `1` |
| **control** | alu_op2_ctrl | `0` |
| **registerFile** | r1_out / r2_out | `12 / 5` |
| **alu_op1_src** | out | `12` |
| **alu_op2_src** | out | `5` |
| **alu** | res | `17` |
| **data_mem** | wr_en | `0` |
| **reg_wr_src** | select / out | `0 / 17` |
| **pc_src** | select / out | `0 / 0x0000000c` |

### Step 3 Think Question Response
* **Where did the value on `data_mem.addr` come from?** The output of the ALU (`17`) is permanently hardwired straight to the address port of the data memory block.
* **Why is it harmless?** The control unit evaluates the `add` instruction and keeps the memory write-enable signal (`data_mem.wr_en`) deactivated at `0`, meaning no memory cells can be overwritten or altered.
* **What is it costing the machine?** It costs the system **dynamic power consumption**. Every time the ALU output switches bits, the address decoding circuitry inside the memory module toggles and wastes electrical energy, even though the result is completely disregarded.
