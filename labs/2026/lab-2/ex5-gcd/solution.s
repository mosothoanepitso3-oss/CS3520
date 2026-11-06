.data
num1: .word 24
num2: .word 60

.text
.globl main
main:
    # Load the two integers into argument registers a0 and a1
    la t0, num1
    lw a0, 0(t0)        # a0 = 24
    
    la t1, num2
    lw a1, 0(t1)        # a1 = 60

    jal ra, gcd         # Call the gcd procedure

    # Upon return, a0 contains the greatest common divisor result (12)
    li a7, 10           # Exit program code for Ripes
    ecall

# --- GCD Procedure ---
# Input:  a0 = a, a1 = b
# Output: a0 = GCD(a, b)
gcd:
gcd_loop:
    # Exit condition: if a == b, we are done
    beq a0, a1, gcd_end

    # If a < b, jump to the block where we subtract a from b
    blt a0, a1, b_is_larger

a_is_larger:
    sub a0, a0, a1      # a = a - b
    j gcd_loop

b_is_larger:
    sub a1, a1, a0      # b = b - a
    j gcd_loop

gcd_end:
    # The GCD value is now in both a0 and a1. 
    # Since a0 is already the return register, we just return.
    jalr zero, ra, 0    # Return to main
