# conditional.asm
# A conditionally branching program in MIPS Assembly for CS64
#
#  Data Area - allocate and initialize variables
.data
	prompt: .asciiz "Enter an integer: "

#Text Area (i.e. instructions)
.text
main:
	#print prompt
	li $v0 4
	la $a0 prompt
	syscall
	# TODO: Write your code here
	#input is stored in $t0
	li $v0 5
	syscall
	move $t0 $v0

	#a copy of t0 for bitmasking
	move $t1 $t0

	#mask to keep only the rightmost 2 digits
	li $t2 0x00000003
	and $t1 $t1 $t2

	#check whether divisible by 4
	beq $t1 $zero divisible

	#not divisible *7=*(8-1)
	#a copy of t0 for minus
	move $t1 $t0
	sll $t0 $t0 3
	sub $t0 $t0 $t1
	li $v0 1
	move $a0 $t0
	syscall
	j exit

divisible:
	sll $t0 $t0 2
	li $v0 1
	move $a0 $t0
	syscall
	j exit



exit:
	li $v0 10
	syscall
	# Exit SPIM: Write your code here!

