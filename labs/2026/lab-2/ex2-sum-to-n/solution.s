.data
n: .word 10

.text
.globl main
main:
    la t0, n
    lw t1, 0(t0)        # t1 = N (loop upper boundary limit)
    
    li t2, 1            # t2 = i (loop counter iterator, initialized to 1)
    li t3, 0            # t3 = sum (accumulator register, initialized to 0)

loop:
    # Inverted condition check: exit loop if i > N
    bgt t2, t1, end_loop

    add t3, t3, t2      # sum = sum + i
    addi t2, t2, 1      # i++ (increment index counter)
    j loop

end_loop:
    mv a0, t3           # Move final calculation sum to a0 for verification
    li a7, 10           # Exit environment call
    ecall
