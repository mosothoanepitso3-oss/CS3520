# Exercise 1 Notes
* **Functionality:** Compares two integers stored in the `.data` segment and isolates the maximum value into register `a0`.
* **Register Allocation:**
  * `t2`: Stores value of variable `a`
  * `t3`: Stores value of variable `b`
  * `a0`: The final maximum integer result
* **Challenges:** Inverting the high-level `if (a > b)` logic to use an exit branch configuration (`bge`) that properly controls execution jump paths.
