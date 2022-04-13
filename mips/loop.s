# computa for(i=0; i<5; i++) s[i] = 2 + i
# onde valores iniciais sao atribuidos para f e g
# a atribuicao dos registradores eh a seguinte
# $s0 <- 10, $s1 <- S[0]
   	.data			# comeco dos dados
LIM: 	.word  5      		# limite do loop
S: 	.word  0 : 4       	# arranjo S que 
				# contera 10 elementos
      	      	.text		# comeco das instrucoes
	la 	$s0,LIM		# carrega o endereco de LIM 
				# no registrador $s0
	la 	$s1,S		# carrega o endereco de S[0] 
				# no registrador $s1
	lw	$t0,0($s0)	# carrega o valor de 
				# LIM no reg $t0
	move	$t1,$zero	# inicializa "i" no reg $t1 
				# que corresponde a var i
loop:	addi	$t2,$t1,2	# $t2 <- i + 2
	sll	$t3,$t1,2	# alinha os bytes, 
				# sll 2 -> desloca 2 bytes
	add 	$t3,$s1,$t3	# adiciona o deslocamento
				# ao endereco S[0] 
				# o deslocamento
	sw	$t2,0($t3)	# armazena o valor S[i]
	addi	$t1,$t1,1	# incrementa i
	bne	$t1,$t0,loop	# compara i com o LIM
 	li   	$v0, 10        	# chamada de sistema 
				# para saida
      	syscall               	# saida ocorre aqui
