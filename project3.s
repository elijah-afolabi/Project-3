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
  
