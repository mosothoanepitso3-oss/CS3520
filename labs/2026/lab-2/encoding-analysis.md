# CS3520 Lab 2: Step 5 Machine Code Encoding Analysis

## 1. Conditional Branch Instruction (B-Type)
* **Instruction Evaluated:** `bne s0, zero, is_odd` (from Exercise 3)
* **Generated 32-bit Machine Code Hex:** `00041663`
* **Binary Expansion:** `0000 0000 0000 0100 0001 0110 0110 0011`

### Field Breakdown:
* `imm[12|10:5]`: `0000000` (Bits 31-25)
* `rs2`: `00000` (`zero` register, Bits 24-20)
* `rs1`: `01000` (`s0` / `x8` register, Bits 19-15)
* `funct3`: `001` (`bne` operational code variant, Bits 14-12)
* `imm[4:1|11]`: `0110` (Bits 11-7)
* `opcode`: `1100011` (Standard Branch operational code mapping, Bits 6-0)

---

## 2. Unconditional Jump Instruction (J-Type)
* **Instruction Evaluated:** `jal ra, factorial` (from Exercise 4)
* **Generated 32-bit Machine Code Hex:** `00C000EF`
* **Binary Expansion:** `0000 0000 1100 0000 0000 0000 1110 1111`

### Field Breakdown:
* `imm[20|10:1|11|19:12]`: `00000000110000000000` (Bits 31-12)
* `rd`: `00001` (`ra` / `x1` destination link register, Bits 11-7)
* `opcode`: `1101111` (Standard Jump operational code mapping, Bits 6-0)

---

## 3. Engineering Justification for Scattered Immediates
In the RISC-V Instruction Set Architecture, immediate fields are purposefully scattered across disjoint bit configurations to ensure that the register source identifiers (`rs1`, `rs2`) and the destination identifier (`rd`) remain anchored at the **exact same bit positions** across all structural instruction formats (R-type, I-type, S-type, B-type, U-type, J-type). 

By ensuring these register index locations never change, the core processing hardware can decode and read register file values immediately in parallel while simultaneously reading the opcode, without needing expensive, power-hungry multiplexing logic to look up where the register indices are on different instructions. This significantly boosts clock efficiency and minimizes literal hardware complexity.
