# Quick Start of MIPS Instruction
# Terminator Used: QtSPIM

# Declare main as a global function/main function
.globl main

# Declare program variables
.data
msg: .asciiz "Hello Word"
# Declare program codes
.text

# Declare label 'main'
main:
    li      $v0, 4
    la      $a0, msg
    syscall

exit:
    li      $v0, 10
    syscall