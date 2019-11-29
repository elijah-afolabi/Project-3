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

start:
     li $t2,0
     li $t7, -1
     lb $s0, ($t0)
     beq $s0, 9, skipper
     beq $s0, 32, skipper
     move $t6, $t0
     j looper

skipper:

    addi $t0,$t0,1
    j start

looper:

    lb $s0, ($t0)
    beq $s0, 0, substring
    beq $s0, 10, substring
    addi $t0,$t0,1
    beq $s0, 44, substring



