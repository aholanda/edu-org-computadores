# computa f = g - (f - 5)
# onde valores iniciais sao atribuidos para f e g
# a atribuicao dos registradores eh a seguinte
# $s0 <- f, $s1 <- g
   	.data			# comeco dos dados
f: 	.word  9       		# valor inicial de f na memoria
g: 	.word  16       	# valor inicial de g na memoria
      	.text			# comeco das instrucoes
	la 	$t0,f		# carrega o endereco de f
				# no registrador $t0
	la 	$t1,g		# carrega o endereco de g
				# no registrador $t1
	lw	$s0,0($t0)	# carrega o valor de f
				# no registrador $s0
	lw	$s1,0($t1)	# carrega o valor de g
				# no registrador $s1
	subi 	$t2,$s0,5	# $t2 <- f - 5
	sub	$s0,$s1,$t2	# f <- g - $t2
	sw	$s0,0($t0)	# armazena o valor de $s0
				# na memoria na posicao de f
 	li   	$v0, 10        	# chamada de sistema para saida
      	syscall               	# saida ocorre aqui
