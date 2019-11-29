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


check:
   bgt $t2,0,noWntLooper
   beq $s0, 9, spGap
   beq $s0, 32, spGap
   ble $s0, 47, noWntLooper
   ble $s0, 57, vaild
   ble $s0, 64, noWntLooper
   ble $s0, 80, vaild
   ble $s0, 96, noWntLooper
   ble $s0, 112, vaild
   bge $s0, 113, noWntLooper


spGap:
   addi $t2,$t2,-1
   j looper

valid:
   addi $t3, $t3,1
   mul $t2,$t2,$t7
   j looper

noWntLooper:
   lb $s0, ($t0)
   beq $s0, 0, insubstring
   beq $s0, 10, insubstring
   addi $t0,$t0,1
   beq $s0, 44, insubstring

   j noWntLooper


insubstring:

addi $t1,$t1,1
sub $sp, $sp,4
sw $t7, 0($sp)
move $t6,$t0
lb $s0, ($t0)
beq $s0, 0, continue1
beq $s0, 10, continue1
beq $s0,44, noWntLooper
li $t3,0
li $t2,0
j looper

substring:
bgt $t2,0,insubstring
bge $t3,5,insubstring
addi $t1,$t1,1
sub $sp, $sp,4
sw $t6, 0($sp)
move $t6,$t0
lw $t4,0($sp)
li $s1,0

 jal subPrgm2

lb $s0, ($t0)
beq $s0, 0, continue1
beq $s0, 10, continue1
beq $s0,44, noWntLooper
li $t2,0
j looper


subPrgm2:

beq $t3,0,finish
addi $t3,$t3,-1
lb $s0, ($t4)
addi $t4,$t4,1
j subPrgm3

continue:

sw $s1,0($sp)
 j subPrgm2


subPrgm3:

move $t8, $t3
li $t9, 1
ble $s0, 57, num
ble $s0, 84, upper
ble $s0, 116, lower

#converters

num:
sub $s0, $s0, 48
beq $t3, 0, combine
li $t9, 26
 j exp

upper:
sub $s0, $s0, 55
beq $t3, 0, combine
li $t9, 26
j exp

lower:
sub $s0, $s0, 87
beq $t3, 0, combine
li $t9, 26
j exp


exp:
ble $t8, 1, combine
mul $t9, $t9, 26
addi $t8, $t8, -1
j exp

combine:

mul $s2, $t9, $s0
add $s1,$s1,$s2 
j continue













Exit:
li $v0, 10
syscall







