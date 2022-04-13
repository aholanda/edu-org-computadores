# computa o somatoria de n=0 at� 9 para x(i) + 8
# for(i=0; i<10; i++) x(i) = x + 8
# onde valores iniciais sao atribuidos para x e lim
   		.data					# comeco dos dados
lim: 		.word  	10      		# limite do loop
x:		.word	9
soma:	.word	0		# inicializa o lugar para guardar o somatorio
      		.text					# comeco das instrucoes
		la 		$s0,lim			# carrega o endereco de "lim" no registrador $s0
		la 		$s1,x			# carrega o endereco de x no registrador $s1
		lw		$s0,0($s0)		# carrega o valor de "lim" no reg $s0
		lw		$s1,0($s1)		# carrega o valor de "x" no reg $s1
		move 	$s2,$zero		# inicializa o registrador $s2 que sera o somatorio
		move	$t1,$zero		# inicializa o reg $t1 que corresponde a var i
loop:		addi		$t2,$s1,8		#  x + 8,
		add		$s2,$s2,$t2		#  x(i) <- x + 8,
		addi		$t1,$t1,1		# incrementa i
		bne		$t1,$s0,loop	# compara i com o "lim"
		la		$t3,soma		# carrega o endereco de onde armazenar a soma
		sw		$s2,0($t3)	# armazena o somatorio
 		li   		$v0, 10        	# chamada de sistema para saida
      		syscall               	# saida ocorre aqui
