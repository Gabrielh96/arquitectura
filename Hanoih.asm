.data
habla1: .asciiz "Ingrese el numero de discos: "
part1: .asciiz "\nSe mueve el disco "
part2: .asciiz " de la vara "
part3: .asciiz " hacia la vara "
newline: .asciiz "\n"
.text
main:
	#imprimir mensaje a
	li $v0, 4
	la $a0, habla1
	syscall
	
	#leer número a
	li $v0, 5
	syscall
	
	#guardar el número en un registro
	move $a0, $v0

	

	li $a1,'A'
	li $a2,'C'
	li $a3,'B'

	
	jal Hanoi
		
		# imprime el resultado

#	li $v0, 1 # syscall para imprimir enteros
#syscall
	
	            # termina el programa
            li $v0, 10 # syscall para terminar
            syscall

	Hanoi:	#a0 = n, a1=from_rod, a2=to_rod, a3=aux_rod

		subi $sp,$sp,20	
		sw $ra,16($sp)
		sw $a0,12($sp)
		sw $a1,8($sp)		
		sw $a2,4($sp)	
		sw $a3,0($sp)			
		
						
		bne $a0,0,Else # 1 !=1
		#return

		lw $a3,0($sp)
		lw $a2,4($sp)
		lw $a1,8($sp)		
		lw $a0,12($sp)	
		lw $ra,16($sp)	
		addi $sp,$sp,20
		jr $ra
	Else:
	
		subi $a0,$a0,1
		move $t1,$a2 #se le pasa el valor to rod a un aux
		move $a2,$a3 #se pasa aux rod como parametro en el sitio de to rod
		move $a3,$t1 #se le pasa el valor to rod como parametro en el sitio de aux rod
		jal Hanoi
		
		lw $a3,0($sp)
		lw $a2,4($sp)
		lw $a1,8($sp)		
		lw $a0,12($sp)	
		lw $ra,16($sp)	


		
		
		
		
		addi $s0,$a0,0
		addi $s1,$a1,0
		addi $s2,$a2,0
				#imprime
						#imprime
								#imprime						

		


        li $v0,  4              # print string
        la $a0,  part1
        syscall
        li $v0,  1              # print integer
        add $a0, $s0, $zero
        syscall
        li $v0,  4              # print string
        la $a0,  part2
        syscall
        li $v0,  11             # print character
        add $a0, $s1, $zero
        syscall
        li $v0,  4              # print string
        la $a0,  part3
        syscall
        li $v0,  11             # print character
        add $a0, $s2, $zero
        syscall

		subi $a0,$s0,1
		
		move $t2,$a1#se guarda en aux from rod
		move $a1,$a3 # se pasa aux rod en el lugar de from rod
		move $a3,$t2 # se le pasa from rod al lugar de aux rod
		
	#	move $t1,$a3 #se guarda en aux to rod
	#	move $t2,$a1#se guarda en aux from rod
	#	move $a1,$a2 #se le pasa el valor de aux rod a el sitio de from rod
	#	move $a2,$a3 # se le pasa el valor de to rod en el sitio de aux rod
	#	move $a3,$t2 #lo mismo con from rod en se pone en el ultimo sitio ahora
		jal Hanoi
		
				lw $a3,0($sp)
		lw $a2,4($sp)
		lw $a1,8($sp)		
		lw $a0,12($sp)	
		lw $ra,16($sp)	
		addi $sp,$sp,20
		jr $ra






#int fact (int n)
#{
#if (n < 1) return (1); 
#else return (n * fact(n-1));
#}
