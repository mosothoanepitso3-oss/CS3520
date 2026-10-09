
Step 4 Notebook Questions

### 1. `lui` and `auipc` Architectural Difference
* **Component making the difference:** The ALU operand 1 multiplexer (`alu_op1_src`).
* **Selection:** For `lui`, the multiplexer selects a constant `0` (bypassing the PC) to place the upper immediate directly into the target register via the ALU calculation. For `auipc`, the multiplexer selects the active **Program Counter (PC)** value to add it to the upper immediate, creating a PC-relative address.

### 2. `sw` (Store Word) Datapath Control
* **Control Signal:** The `reg_do_write_ctrl` (RegWrite) signal is driving a low value (`0`), completely disabling commitments to the register file.
* **Write-back Multiplexer Behavior:** The multiplexer still outputs a candidate data value (the computed memory target address from the ALU), but it is completely ignored at the register file boundary because the register file's write-enable port is inactive.

### 3. Branch Verification Component Path
Tracing from the internal branch comparison hardware to `pc_src.select`, the signal passes through:
1. The **Branch/Comparison Unit** (determines if the registers meet the condition).
2. An **AND gate (`br_and`)** that checks if both the condition is met and a branch instruction control signal is active.
3. An **OR gate (`controlflow_or`)** that combines the branch evaluation with unconditional jump triggers (`jal`/`jalr`) to actively flip the selector line on `pc_src`.

### 4. Jump Return Address Sourcing
* **Multiplexer Input:** The return address is fed exclusively from the **`PC + 4`** dedicated hardware line connected to the write-back multiplexer.
* **Alternative Resource Restriction:** Neither the ALU nor the Data Memory can supply this address because the ALU is simultaneously tasked with computing the target branch/jump jump offset address, and the Data Memory is restricted to managing data loads/stores.


 Step 5 Statistics and Performance Analysis

### Simulation Metrics
* **Total Instructions in Memory:** 18
* **Instructions Retired:** 14
* **Cycles Elapsed:** 14
* **CPI:** 1.00
* **IPC:** 1.00



* **Which performance term did this design sacrifice?** 
  The single-cycle design severely sacrificed **\(T_c\) (the Clock Cycle Time / Clock Period)**. 
* **By what factor was it sacrificed?** 
  Because a single-cycle datapath must allow the slowest possible instruction (usually `lw`) to travel through *every single element* (Fetch, Decode, ALU, Data Memory, and Write-Back) within one lone cycle, the clock period must be stretched to accommodate the sum of all component delays. 
  Compared to a standard 5-stage pipelined processor where the clock period is only bounded by the single slowest individual stage, the single-cycle design sacrifices clock cycle time by a factor of roughly **4 to 5 times** slower.


# Lab 3: Step 6 - Architectural Implementation Differences

| Textbook Figure Feature | Ripes Implementation Reality | Engineering Gain / Benefit |
| :--- | :--- | :--- |
| **A. Dedicated Branch Adder** | There is **no second adder** for branches. The branch target is calculated using the main **ALU**. | **Saves hardware area and cost.** By routing the PC and immediate offset through the ALU multiplexers, the designer avoids wasting silicon space on an extra 32-bit adder that would sit idle most of the time. |
| **B. Subtraction for Branch Testing** | There is a **separate Comparison/Branch Unit** instead of relying on the ALU's `Zero` flag. | **Supports more complex branches.** A simple `Zero` flag can only easily tell if two numbers are equal (`sub = 0`). A dedicated comparison unit natively evaluates signed/unsigned inequalities (`blt`, `bge`, `bltu`, `bgeu`) in parallel without modifying ALU state. |
| **C. Two-Input MemtoReg Mux** | The write-back multiplexer (`reg_wr_src`) has **three inputs**. | **Enables Jumps (`jal`/`jalr`).** The third input connects directly to the `PC + 4` hardware path. This allows the processor to efficiently save the return address to the link register (`ra`) in a single cycle while the ALU is busy calculating the jump destination. |

### Step 6 Think Question Response
* **The Trade-Off:** 
  * The **textbook design** trades away hardware space (silicon area) to gain lower component propagation delays, keeping paths isolated. 
  * The **Ripes implementation** trades multiplexer complexity and critical path delay to save hardware area by aggressively reusing the ALU for branch target generation.
* **When to choose each:**
  * You would choose the **textbook design** in a high-performance scenario where minimizing propagation delay is vital to keeping the clock rate as fast as possible.
  * You would choose the **Ripes implementation** in a low-power, deeply embedded, or microcontroller scenario where minimizing silicon surface area, chip manufacturing cost, and power consumption is significantly more important than raw processing speed.
