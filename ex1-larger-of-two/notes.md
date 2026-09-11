.data
a:      .word 15
b:      .word 42
msg:    .string "Larger value: "

.text
.globl main
main:
    # Load values from memory
    la t0, a
    lw t1, 0(t0)        # t1 = a
    la t0, b
    lw t2, 0(t0)        # t2 = b

    # Conditional branch comparison (Inverted logic for assembly flow)
    blt t1, t2, else_b  # If a < b, jump to else_b
    mv t3, t1           # max = a
    j print

else_b:
    mv t3, t2           # max = b

print:
    # Environment calls below are configured for Ripes console printing
    # Print string prefix
    la a0, msg
    li a7, 4            # Service 4: Print string
    ecall

    # Print the integer result
    mv a0, t3           # Move max value to argument register
    li a7, 1            # Service 1: Print integer
    ecall

    # Exit program cleanly
    li a7, 10           # Service 10: Exit
    ecall

