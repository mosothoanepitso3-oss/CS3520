# Exercise 2 Notes
* **Functionality:** Iteratively computes the arithmetic summation of all integers from 1 up to $N$.
* **Register Allocation:**
  * `t1`: Loop boundary limit ($N$)
  * `t2`: Iterator index counter ($i$)
  * `t3`: Accumulator tracking variable (`sum`)
* **Challenges:** Correctly mapping the branch exit condition `bgt` to avoid an off-by-one error during iteration cycles.
