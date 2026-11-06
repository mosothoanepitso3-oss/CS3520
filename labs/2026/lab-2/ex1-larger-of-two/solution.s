.data
# Define the two integers to compare
a: .word 42
b: .word 87

.text
.globl main
main:
    # Load pointers to memory addresses
    la t0, a
    la t1, b
    
    # Load the actual data values from memory into registers
    lw t2, 0(t0)        # t2 = a (42)
    lw t3, 0(t1)        # t3 = b (87)

    # Inverted condition: if a >= b, jump past the b block
    bge t2, t3, a_is_larger

b_is_larger:
    mv a0, t3           # Place b into return register a0
    j print_result

a_is_larger:
    mv a0, t2           # Place a into return register a0

print_result:
    # a0 now holds the maximum value for verification in Ripes
    li a7, 10           # Exit environment call
    ecall
