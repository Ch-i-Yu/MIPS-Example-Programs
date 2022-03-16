# Simple Routine of a Loop in MIPS Assembly Code
# Compute the sum [1..input], if input <= 0 then return 0

# Data Section
.data
    msg1:    .asciiz "Input integer(n): "
    msg2:    .asciiz "Output factorial(n): "

# Code Section
.text
    # Globalize Main Function
    .globl main

# Main Function
main:
# Print String msg1
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msg1       # Load msg Address in $a0
    syscall                 # Call Service
# Get input and Save in Register t0
    li      $v0, 5          # Load Service Type 5(in $v0): read_int
    syscall                 # Call Service
    move    $t0, $v0        # Move $v0 Content to $t0

init:
# Initializing $t1, $t2 with 0
    li      $t1, 0
    li      $t2, 0

loop:
# Calculate sum [1..input]
    addi    $t1, $t1, 1     # $t1 = $t1 + 1
    add     $t2, $t2, $t1   # $t2 = $t2 + $t1
    beq     $t0, $t1, exit  # Jump to label exit if $t0 == $t1
    j       loop            # Otherwise jump to/continue loop

exit:
# Output & Exit
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msg2       # Load msg Address in $a0
    syscall                 # Call Service

    li      $v0, 1          # Load Service Type 1(in $v0): print_int
    move    $a0, $t2        # Move $t2 Content to $a0
    syscall                 # Call Service

    li      $v0, 10         # Load Service Type 10(in $v0): exit
    syscall                 # Call Service
