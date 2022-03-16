# "Hello World" Program in MIPS Assembly Code

# Data Section
.data
    msg:    .asciiz "Hello World!\n"

# Code Section
.text
    # Globalize Main Function
    .globl main

# Main Function
main:
# Print String msg
    li      $v0, 4      # Load Service Type 4(in $v0): print_string 
    la      $a0, msg    # Load msg Address in $a0
    syscall             # Call Service
# Exit
    li      $v0, 10     # Load Service Type 10(in $v0): exit
    syscall             # Call Service
