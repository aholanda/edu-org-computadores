# este programa tem como objetivo estudar
# a distribuicao de chache hits/misses
   	.data			# comeco dos dados
a: 	.word  	1       	# valor inicial de a na DRAM
b: 	.word  	2	       	# valor inicial de b na DRAM
c:	.word	3		# valor inicial de c na DRAM
#d:	.word	4		# valor inicial de d na DRAM
P:	.word	8 1 3 4 6 9	# arranjo P
Q:	.word	8 0 1 2 2 4	# arranjo Q
soma:	.word	0		# armazena a soma 
     	.text			# comeco da regiao de instrucoes
	la 	$t0,a		# carrega o endereco de a no registrador $t0
	la 	$t1,b		# carrega o endereco de b no registrador $t1
	la	$t2,c		# carrega o endereco de c no registrador $t2
	la	$t3,d		# carrega o endereco de b no registrador (reg) $t3
	la	$t4,P		# carrega o endereco base do arranjo P no reg $t4
	la	$t5,Q		# carrega o endereco base do arranjo Q no reg $t5
	la	$t6,soma
	# O carregamento das variaveis a,b,c e d so foi colocado
	# para fins didaticos, ou seja, o entendimento do carregamento
	# em blocos da DRAM para a cache, nao possuindo funcao na logica
	# do programa
	lw	$s0,0($t0)	# carrega o conteudo de a no reg $s0
	lw	$s1,0($t1)	# carrega o conteudo de b no reg $s1
	lw	$s2,0($t2)	# carrega o conteudo de a no reg $s2
	lw	$s3,0($t3)	# carrega o conteudo de b no reg $s3
 	# Os valores dos arranjos P e Q serao somados a partir de agora
 	# inicio da soma do arranjo P
 	lw	$s4,0($t4)	# P[0]: carrega o valor contido no indice 0
 	add	$s5,$s4,$zero	# soma = soma + P[0]
 	lw	$s4,4($t4)	# P[1]: carrega o valor contido no indice 1
 	add	$s5,$s4,$s4	# soma = soma + P[1]
 	lw	$s7,8($t4)	# P[2]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[2]
 	lw	$s7,12($t4)	# P[3]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[3]
 	lw	$s7,16($t4)	# P[4]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[4]
 	lw	$s7,20($t4)	# P[5]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[5]
 	# inicio da soma do arranjo Q 
 	lw	$s4,0($t5)	# Q[0]: carrega o valor contido no indice 0
 	add	$s5,$s4,$s4	# soma = soma + Q[0]
 	lw	$s4,4($t5)	# Q[1]: carrega o valor contido no indice 1
 	add	$s5,$s4,$s4	# soma = soma + Q[1]
 	lw	$s7,8($t5)	# Q[2]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[2]
 	lw	$s7,12($t5)	# Q[3]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[3]
 	lw	$s7,16($t5)	# Q[4]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[4]
 	lw	$s7,20($t5)	# Q[5]: carrega o valor contido no indice 2
 	add	$s5,$s4,$s4	# soma = soma + P[5]
	# Armazena a soma no endereco da variavel soma
	sw	$s5,0($t6)
 	li   	$v0, 10        	# chamada de sistema para saida
      	syscall               	# saida ocorre aqui
