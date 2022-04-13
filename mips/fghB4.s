# computa f = g + h + B[4]
# onde valores iniciais sao atribuidos para f, g e h
# a atribuicao dos registradores eh a seguinte
# $s0 <- f, $s1 <- g, $s2 <- h
   	.data			# comeco dos dados
f: 	.word  0       		# valor inicial de f
				# na memoria principal
g: 	.word  9       		# valor inicial de g
				# na memoria principal
h:	.word	7		# valor inicial de h
				# na memoria principal
B:	.word	8 0 1 2 2 4	# arranjo B
      	      	.text		# comeco das instrucoes
	la 	$t0,f		# carrega o endereco de f
				# no registrador $t0
	la 	$t1,g		# carrega o endereco de g
				# no registrador $t1
	la	$t2,h		# carrega o endereco de h
				# no registrador $t2
	la	$t3,B		# carrega o endereco de B[0]
				# no registrador $t3
	lw	$t4,16($t3)	# $t4 <- B[4]
	lw	$s1,0($t1)	# carrega o valor de g
				# no registrador $s1
	lw	$s2,0($t2)	# carrega o valor de h
				# no registrador $s2
	add 	$t5,$s2,$t4	# $t5 <- h + B[4]
	add	$s0,$s1,$t5	# f <- g + $t5
	sw	$s0,0($t0)	# armazena o valor de $s0
				# na memoria na posicao de f
 	li   	$v0, 10        	# chamada de sistema para saida
      	syscall               	# saida ocorre aqui
