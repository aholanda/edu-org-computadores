	#Fonte:	http://www3.informatik.uni-erlangen.de/Lehre/ArchSup/WS2010/arraycopy.asm

	
	# array1 = array1+array2
	.data
	        array1: .word 1:8
	        array2: .word 2:8 
	.text
	        li $t1, 8                # arrays size
	        la $t5, array1           # start addres array1
	        la $t6, array2           # start addres array2
	loop:   blez $t1, end            # terminate if finished
	        lw $t2, 0($t5)           # load element from array1
	        lw $t3, 0($t6)           # load element from array2
	        add $t4, $t2, $t3     
	        sw $t4, 0($t5)           # store result in array1
	        addi $t5, $t5, 4      
	        addi $t6, $t6, 4      
	        subi $t1, $t1, 1      
	        j loop                   # restart loop
	end:                             # fi
	        li   $v0, 10            # system call for exit
	        syscall                 # we are out of here	.
