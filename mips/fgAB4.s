# computa f = g - A[B[4]]
# onde valores iniciais sao atribuidos para f e g
# a atribuicao dos registradores eh a seguinte
# $s0 <- f, $s1 <- g
   	.data			# comeco dos dados
f: 	.word  0       		# valor inicial de f na memoria
g: 	.word  9       	# valor inicial de g na memoria
A:	.word	8 1 3 4 6	# arranjo A
B:	.word	8 0 1 2 2 4	# arranjo B
      	      	.text		# comeco das instrucoes
	la 	$t0,f		# carrega o endereco de f no registrador $t0
	la 	$t1,g		# carrega o endereco de g no registrador $t1
	la	$t2,A		# carrega o endereco de A[0] no registrador $t2
	la	$t3,B		# carrega o endereco de B[0] no registrador $t3
	lw	$t4,16($t3)	# $t4 <- B[4]
	sll	$t4,$t4,2	# $t4 <- $t4 * 4, alinha os bytes (4 bytes)
	add	$t4,$t2,$t4	# soma o deslocamento $t4=B[4] ao endereco inicial de A
				# A[B[4}]
	lw	$t4,0($t4)	# carrega o valor de A[B[4]] em $t4
	lw	$s0,0($t0)	# carrega o valor de f no registrador $s0
	lw	$s1,0($t1)	# carrega o valor de g no registrador $s1
	sub 	$s0,$s1,$t4	# f <- g - A[B[4]]
	sw	$s0,0($t0)	# armazena o valor de $s0 na memória na posicao de f
 	li   	$v0, 10        	# chamada de sistema para saida
      	syscall               	# saida ocorre aqui
