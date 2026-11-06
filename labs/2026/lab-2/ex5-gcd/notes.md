# Exercise 5 Notes
* **Functionality:** Implements Euclid's subtraction-based GCD model inside a procedural loop function.
* **Register Allocation:**
  * `a0`: Parameter input variable `a` and final returned GCD value output
  * `a1`: Parameter input variable `b`
* **Challenges:** Managing functional control execution without a dedicated stack boundary layout since it functions exclusively as a register-contained leaf function.
