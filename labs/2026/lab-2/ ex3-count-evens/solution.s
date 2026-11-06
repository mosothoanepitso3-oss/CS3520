.data
# Define the array and its length
my_array: .word 12, 7, 19, 24, 5, 8, 14, 3
size:     .word 8

.text
.globl main
main:
    la t0, my_array     # t0 = Base pointer address of the array
    la t1, size
    lw t1, 0(t1)        # t1 = Loop bound (Array size = 8)
    
    li t2, 0            # t2 = i (Loop index counter initialized to 0)
    li t3, 0            # t3 = even_count (Accumulator initialized to 0)

loop:
    # Inverted condition check: exit loop if i >= size
    bge t2, t1, end_loop

    # Calculate memory address offset: offset = i * 4 bytes
    slli t4, t2, 2      # t4 = i << 2 (fast multiply by 4)
    add t5, t0, t4      # t5 = base address + offset
    lw t6, 0(t5)        # t6 = my_array[i]

    # Bitwise test for even parity: (value & 1) 
    # If the last bit is 0, the number is even. If 1, it is odd.
    andi s0, t6, 1
    bne s0, zero, is_odd # If remainder is not 0, it is odd, so skip increment

is_even:
    addi t3, t3, 1      # even_count++

is_odd:
    addi t2, t2, 1      # i++
    j loop

end_loop:
    mv a0, t3           # Move final even_count to a0 for verification/output
    li a7, 10           # Exit program code
    ecall
