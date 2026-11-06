.data
input_n: .word 5

.text
.globl main
main:
    la t0, input_n
    lw a0, 0(t0)        # a0 = argument N for the function (5)

    jal ra, factorial   # Call the factorial procedure, save return address in ra

    # Upon return, a0 contains the final factorial result
    li a7, 10           # Exit program code for Ripes
    ecall

# --- Factorial Procedure ---
# Input:  a0 = n
# Output: a0 = n!
factorial:
    # Allocate stack space to preserve s1 (callee-saved register)
    addi sp, sp, -8
    sw s1, 0(sp)        # Save s1 onto the stack

    li s1, 1            # s1 = result accumulator (initialized to 1)
    li t1, 1            # t1 = i (loop counter initialized to 1)

fact_loop:
    # Exit loop if i > n (inverted check: branch if i > a0)
    bgt t1, a0, fact_end

    mul s1, s1, t1      # result = result * i
    addi t1, t1, 1      # i++
    j fact_loop

fact_end:
    mv a0, s1           # Place final result into function return register a0

    # Restore s1 from the stack and clean up stack pointer
    lw s1, 0(sp)
    addi sp, sp, 8

    jalr zero, ra, 0    # Return to main using saved address in ra
