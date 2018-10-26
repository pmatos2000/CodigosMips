# Autor: Paulo Henrique Rodrigues de Matos

# void strcpy(char dst[], char scr[]){
#     int i = 0;
#     do{
#         dst[i] = src[i];
#     while(src[i++]);
# }

# main usada apenas em teste
.data

str1:	.asciiz "Realizando copia com strcpy"
str2:	.word

.text

main:	la	$a1, str1	# Carregar endereço da string fonte
	la	$a0, str2	# Carregar endereço da string destino
	jal	strcpy		# Chama a função strcpy
	
	addi	$v0, $0, 4	# Imprimir a string
	syscall
	
	addi	$v0, $0, 10	# Termina a execução
	syscall
	

#strcpy
strcpy:	addi	$t0, $0, 0	# i = 0
L1:	add	$t1, $a1, $t0	# &scr[i]
	lb	$t1, 0($t1)	# scr[i]
	add	$t2, $a0, $t0	# &dst[i]
	sb	$t1, 0($t2)	# dst[i] = scr[i]
	beq	$t1, $0, L2	# (scr[i] == 0)?
	addi	$t0, $t0, 1	# i = i + 1
	j	L1		# Nova interação	
L2:	jr	$ra		# Retorna para a função que chamou
	