#ID:02764894
#02764894 % 11 = 0
#26+0 = 26
#β is 'p' and Δ is 'P'.


.data
data: .space 1001
output: .asciiz "\n"
notvalid: .asciiz "NaN"
comma: .asciiz ","

.text

main:
    li $v0, 8
    la $a0, data
    li $a1, 1001
    syscall
  
    jal subPrgm1
continue1:
j print

subPrgm1:
     sub $sp, $sp,4
     sw $a0, 0($sp)
     lw $t0, 0($sp)
     addi $sp,$sp,4
     move $t6, $t0


