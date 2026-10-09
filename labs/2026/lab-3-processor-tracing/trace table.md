Lab 3: Step 3 Trace Table

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

Step 4 Trace Table (Every Instruction Class)

| Instruction | Format | imm | op1 mux | op2 mux | alu.res | wb mux / pc mux |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `addi t0, zero, 12` | I-type | `12` | Register (`0`) | Immediate (`12`) | `12` | `12` (wb) / `0` (pc) |
| `add t2, t0, t1` | R-type | `0` | Register (`12`) | Register (`5`) | `17` | `17` (wb) / `0` (pc) |
| `lui t4, 0x2B` | U-type | `0x0002B000` | Constant `0` | Immediate | `176128` | `176128` (wb) / `0` (pc) |
| `auipc t5, 0x0` | U-type | `0` | PC | Immediate (`0`) | `PC` value | `PC` value (wb) / `0` (pc) |
| `lw a1, 0(a0)` | I-type | `0` | Register (`a0`) | Immediate (`0`) | `a0 + 0` | Memory Out (wb) / `0` (pc) |
| `sw t2, 4(a0)` | S-type | `4` | Register (`a0`) | Immediate (`4`) | `a0 + 4` | None / `0` (pc) |
| `beq t0, t1, skip` | B-type | `skip` offset | Register (`12`) | Register (`5`) | Not equal | None / `0` (pc) |
| `bne t0, t1, target` | B-type | `target` offset| Register (`12`) | Register (`5`) | Not equal | None / `1` (pc) |
| `jal ra, report` | J-type | `report` offset| PC | Immediate | Target address | `PC + 4` (wb) / `1` (pc) |
| `jalr zero, ra, 0` | I-type | `0` | Register (`ra`) | Immediate (`0`) | Target address | `PC + 4` (wb) / `1` (pc) |

