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


