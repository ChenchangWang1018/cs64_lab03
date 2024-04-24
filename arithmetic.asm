# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#

.text
main:
	
	# $t0 stores x
	li $v0 5
	syscall
	move $t0 $v0
	
	# $t1 stores y
	li $v0 5
	syscall
	move $t1 $v0
	
	# y/2 y>>1
	sra $t1 $t1 1

	# x-y/2
	sub $t0 $t0 $t1

	# 32=2*2*2*2*2 <<5
	sll $t0 $t0 5

	# $t2 stores 4
	li $t2 4

	# +4
	add $t0 $t0 $t2

	#output
	li $v0 1
	move $a0 $t0
	syscall

	j exit
	# TODO: Write your code here

exit:
	li $v0 10
	syscall
	# Exit SPIM: Write your code to exit here!

