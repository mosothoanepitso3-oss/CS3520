# Exercise 3 Notes
* **Functionality:** Loops through an array of integers, performs a bitwise check for parity, and accumulates the total count of even numbers.
* **Register Allocation:**
  * `t0`: Base array pointer address
  * `t1`: Size bound limit (8)
  * `t2`: Array iteration index counter ($i$)
  * `t3`: Total accumulated count of even elements
  * `t6`: Value of current array index element `my_array[i]`
  * `s0`: Temp holder for bitwise parity tracking value
* **Challenges:** Shifting the index counter cleanly via `slli` to calculate 4-byte boundaries for word-aligned array indexing.
