# computa if (f == g) f = f + g else f = f - g
# onde valores iniciais sao atribuidos para f e g
# a atribuicao dos registradores eh a seguinte
# $s0 <- f, $s1 <- g
   	.data			# comeco dos dados
f: 	.word  10       	# valor inicial de f 
				# na memoria principal
g: 	.word  9       		# valor inicial de g 
				# na memoria principal
      	      	.text		# comeco das instrucoes
	la 	$t0,f		# carrega o endereco de f 
				# no registrador $t0
	la 	$t1,g		# carrega o endereco de g 
				# no registrador $t1
	lw	$s0,0($t0)	# carrega o valor de f 
				# no registrador $s0
	lw	$s1,0($t1)	# carrega o valor de g 
				# no registrador $s1
	beq 	$s0,$s1,Equal	# if (f == g)
	sub	$s0,$s0,$s1	# f <- f - g
	j	Exit		# pula p/ a saida
Equal:	add	$s0,$s0,$s1	# f <- f + g
Exit:	sw	$s0,0($t0)	# armazena o valor de $s0 
	# na memoria na posicao de f
 	li   	$v0, 10        	# chamada de sistema 
	# para saida
      	syscall               	# saida ocorre aqui
