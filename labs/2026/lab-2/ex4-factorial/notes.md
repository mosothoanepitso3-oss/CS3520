# Exercise 4 Notes
* **Functionality:** Calls a distinct leaf procedure function using `jal` to iteratively calculate the factorial result of an input variable.
* **Register Allocation:**
  * `a0`: Dual-purpose function argument variable input ($N$) and result output return destination ($N!$)
  * `s1`: Callee-saved workspace accumulator register for ongoing loop multiplication tracking
  * `t1`: Loop increment tracking iterator ($i$)
* **Challenges:** Respecting standard calling conventions by strictly implementing a stack preservation layout frame (`sw`/`lw`) to save and restore `s1`.
