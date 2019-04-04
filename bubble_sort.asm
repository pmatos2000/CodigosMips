#Autor: Paulo Henrique Rodrigues de Matos

#void bubble_sort (int vetor[], int n) {
#	int k, j, aux;
#	for (k = 1; k < n; k++) {
#		for (j = 0; j < n - 1; j++) {
#			if (vetor[j] > vetor[j + 1]) {
#				aux = vetor[j];
#				vetor[j] = vetor[j + 1];
#				vetor[j + 1] = aux;
#			}
#		}
#	}
#}


#main usado para teste
.data
vetor: .word 1, 8, -23, 75, 76, 12, 4, 30, -20, 2

.text
main:
	la $s0, vetor
	addi $s1, $0, 10 #tamanho do vetor
	
	#chama a função print
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal print
	
	#chama a função bubble_sort
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal bubble_sort
	
	#chama a função print
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal print
	j FIM
	
#Usado para exibir o vetor
print:
	addi $t0, $a0, 0
	addi $t1, $0, 0 # i = 0
	L0:	
		slt $t2, $t1, $a1
		beq $t2, $0, LO_FIM # i<n ?
		addi $v0, $0, 1
		sll $t3, $t1, 2 # ix4
		add $t3, $t3, $t0
		lw $a0, 0($t3)
		syscall
		addi $t1, $t1, 1 #i++
		addi $v0, $0, 11
		addi $a0, $0, ' '
		syscall
		j L0
		
	LO_FIM:
		addi $a0, $0, '\n'
		syscall
		jr $ra 

		
#bolha
bubble_sort:
	addi $t1, $0, 1 #k = 1
	sub $t9, $a1, 1 # n-1
	L1:
		slt $t2, $t1, $a1
		beq $t2, $0, L1_FIM  # i<n ?
		addi $t3, $0, 0 #j = 0
		L2:
			slt $t2, $t3, $t9
			beq $t2, $0, L2_FIM  # j<n-1 ?
			sll $t4, $t3, 2 # jx4
			add $t4, $t4, $a0 #desloca a memoria 
			lw $t5, 0($t4) # vetor[j]
			lw $t6, 4($t4) # vetor[j+1]
			slt $t7, $t6, $t5
			beq $t7, $0, L3
			#salva invertido
			sw $t5, 4($t4) # vetor[j]
			sw $t6, 0($t4) # vetor[j+1]
		L3:
			addi $t3, $t3, 1 #j++
			j L2
		L2_FIM:
		addi $t1, $t1, 1 # k++
		j L1
	L1_FIM:
	jr $ra
		
FIM: