# Simple Routine of Caller-Callee Connection in MIPS Assembly Code
# Registers DO NOT Preserved by Stack.

# Data Section
.data
    msgX:    .asciiz "\nx = "
    msgY:    .asciiz "\ny(x) = x + 20 = "
    x:       .word 5
    y:       .word 0

# Code Section
.text
    # Globalize Main Function
    .globl main

# -------- Register Assignments -------- #
# x <-> $s0, y <-> $s1
# -------------------------------------- #

# Main Function
main:
# Initiaizing
    lw      $s0, x          # Load Word x to $s0
    lw      $s1, y          # Load Word y to $s1
# Print msgX
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msgX       # Load msg Address in $a0
    syscall                 # Call Service
# Print x
    li      $v0, 1          # Load Service Type 1(in $v0): print_int
    move    $a0, $s0        # Move x Content to $a0
    syscall                 # Call Service
# Call funcY
    move    $a0, $s0        # Argument 1: x ($s0)
    jal     funcY           # Save current PC in $ra, and jump to fun
    move    $s1, $v0        # Return value saved in $v0. This is y ($s1)
# Print msgX
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msgX       # Load msg Address in $a0
    syscall                 # Call Service
# Print x($t0)
    li      $v0, 1          # Load Service Type 1(in $v0): print_int
    move    $a0, $t0        # Move x Content to $a0
    syscall                 # Call Service
# Exit
    li      $v0, 10         # Load Service Type 10(in $v0): exit
    syscall                 # Call Service

funcY:
# Do function calculation y(x) = x + 20
    li      $s0, 20          # Load immediate 20; Overwrites $s0
    add     $s1, $s0, $a0
# Print msgY
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msgY       # Load msg Address in $a0
    syscall                 # Call Service
# Print y
    li      $v0, 1          # Load Service Type 1(in $v0): print_int
    move    $a0, $s1        # Move y Content to $v0
    syscall                 # Call Service
# Save the return value in $v0
    move    $v0, $s1
# Return from function
    jr      $ra             # Jump to return address stored in $ra