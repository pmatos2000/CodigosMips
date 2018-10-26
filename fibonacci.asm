#Autor: Paulo Henrique Rodrigues de Matos

# unsigned int fib(unsigned int n){
#     if(n < 2) return 1;
#     return fib(n - 1) + fib(n - 2);
# }

#main usado para teste
.text

main:	addi 	$v0, $0, 5	#Ler um inteiro n
	syscall
	
	addi $a0, $v0, 0	# Passa o n para a função fib
	jal fib
	
	addi	$a0, $v0, 0	# Exibe um inteiro sem sinal
	addi	$v0, $0, 36	
	syscall
	
	addi	$v0, $0, 10	# Termina a execução
	syscall

#fibonacci
fib:	addi 	$sp, $sp, -12	# Cria espaço na pilha
	sw	$a0, 0($sp)	# Grava a0 (n) na pilha
	sw	$ra, 4($sp)	# Grava ra na pilha
	sw	$s0, 8($sp)	# Grava s0 na pilha
	sltiu	$t0, $a0, 2	# (n < 2)?
	beq	$t0, $0, L1	# (n < 2)?
	addi	$sp, $sp, 12	# Restaura a pilha
	addiu	$v0, $0, 1	# Retorna 1
	jr	$ra		# Retorna para função que chamou
L1:	addi	$a0, $a0,-1	# n = n-1
	jal	fib		# Chama a função recursivamente
	addi	$s0, $v0, 0	# Salva o retorno em s0
	addi	$a0, $a0, -1	# n = n-1
	jal	fib		# Chama a função recursivamente
	addu	$v0, $s0, $v0	# fib(n-1) + fib(n-2)
	lw	$a0, 0($sp)	# Restaura a0 (n) na pilha
	lw	$ra, 4($sp)	# Restaura ra na pilha
	lw	$s0, 8($sp)	# Restaura s0 na pilha	
	addi	$sp, $sp, 12	# Cria espaço na pilha
	jr	$ra		# Retorna para função que chamou