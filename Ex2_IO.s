# Sample input/output in MIPS Assembly Code

# Data Section
.data
    msg1:   .asciiz "Enter A: "
    msg2:   .asciiz "Enter B: "
    msg3:   .asciiz "A + B = "

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
# Get input A and Save in Register t0
    li      $v0, 5          # Load Service Type 5(in $v0): read_int
    syscall                 # Call Service
    move    $t0, $v0        # syscall results returned in $v0
# Print String msg2
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msg2       # Load msg Address in $a0
    syscall                 # Call Service
# Get input B and Save in Register t1
    li      $v0, 5          # Load Service Type 5(in $v0): read_int
    syscall                 # Call Service
    move    $t1, $v0        # syscall results returned in $v0
# Calculation
    add     $t0, $t0, $t1   # Calculation
# Print String msg3
    li      $v0, 4          # Load Service Type 4(in $v0): print_string
    la      $a0, msg3       # Load msg Address in $a0
    syscall                 # Call Service
# Print Sum in A($t0)
    li      $v0, 1          # Load Service Type 1(in $v0): print_int
    move    $a0, $t0        # Move A Content to $a0
    syscall                 # Call Service
# Exit
    li      $v0, 10         # Load Service Type 10(in $v0): exit
    syscall                 # Call Service