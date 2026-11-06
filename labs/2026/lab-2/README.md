# CS3520 Lab 2: Step 2 Discussion Questions

### 1. Inverted Loop Conditions (C++ `i < n` vs. Assembly `bge`)
In high-level languages like C++, a loop block specifies the condition required to **continue** executing. In hardware assembly, branches are used as exit vectors. Therefore, the branch instruction must check when to **exit** the loop and jump past the block. To exit a loop that runs while $i < n$, the hardware must check if $i \geq n$, which translates directly to the `bge` (Branch if Greater than or Equal) instruction.

### 2. Pseudo-instructions (`li`, `mv`, `la`, `ble`)
* **`li` (Load Immediate):** Becomes a single `addi` (e.g., `addi rd, zero, imm`) if the value fits in 12 bits, or a combination of `lui` and `addi` for larger integers.
* **`mv` (Move Register):** Translates directly to an addition with zero: `addi rd, rs, 0`.
* **`la` (Load Address):** Becomes an `auipc` (Add Upper Immediate to PC) followed by an `addi` to form a valid 32-bit PC-relative address.
* **`ble` (Branch Less than or Equal):** Synthesizes into a `bge` instruction by simply swapping the positions of the two source registers in the instruction arguments.

**Why they exist:** They elevate programmer productivity. Human engineers think in abstract primitives like "copy this variable" (`mv`) or "load this constant" (`li`). Pseudo-instructions preserve this clarity while allowing the hardware instruction set architecture (ISA) to remain completely lean and RISC-focused.

### 3. Register Saving Strategy in `find_max` (`s1` vs. `ra`)
* **Why saving `s1` is correct:** Register `s1` belongs to the **callee-saved** group (`s0`-`s11`). The calling convention states that a function must preserve these values for the caller. Since `find_max` modifies `s1`, it must back it up on the stack and restore it before returning.
* **Why omitting `ra` is correct:** `find_max` is a **leaf procedure** (it does not execute a `jal` or `jalr` to call another function). Because it never overwrites the return address register (`ra`), the original address remains perfectly intact, making a stack backup unnecessary.
