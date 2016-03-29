# #include <stdio.h>
# #include <iostream>
#using namespace std;
#int main(){
# int sz=10; 
# float introd;
# float suma=0.0;
# float media=0.0;
# cout <<"Suma de elementos y media"<<endl;
# for (int i=0; i<sz;++i){
#cout<<"Introduzca el numero a sumar :"<<endl;
#cin<<introd;
# suma+=introd;  
# }
#  cout <<"La suma del vector es : "<< suma <<endl;
#  media=suma/sz;
#  cout <<"La media del vector es : "<< media<<endl; 
#  return 0;
#}
		.data
enunc: .asciiz "----Suma de elementos y media---- \n";
enunc1: .asciiz "Introduzca el elemento a sumar : \n";
result: .asciiz "\n El resultado de la suma de elementos es : \n";
result1: .asciiz "\n La media es : \n";
sz:  .word 10  #tamaño del vector
sz1:	.float 10.0 #tamaño del vector en flotante

		.text	#seccion de codigo del usuario
	main:

# las siguientes lineas escriben el enunciado de nuestro problema

	li	$v0,4	# $v0 = 4 funcion print string
	la	$a0,enunc	# Sa0 = direccion de la cadena a imprimir
	syscall


	move $t0,$zero	#ponemos nuestro iterador a 0
	lw $s0, sz    #cargamos en s0  el tamaño del vector 

#nuestro bucle

for:	bge $t0,$s0,endfor		#comparacion $t0>=$s0

	li $v0,4 	 #imprime por pantalla el texto introduzca
	la $a0,enunc1
	syscall


	li $v0,6	#cojemos el flotante por pantalla
	syscall

	mov.s $f20,$f0   #movemos el valor que leemos por pantalla a f20

	add.s $f21,$f21,$f20  #sumamos el flotante introducido por pantalla
  	add $t0,1  #incrementamos el iterador una vez introducido y sumado el dato
  	j for		#saltamos a nuestra etiqueta for


endfor:
	li $v0,4 	 #imprime por pantalla el texto resultado suma
	la $a0,result
	syscall
	
	mov.s $f12,$f21	#movemos nuestro flotante de simple precision a f12

	li $v0,2	# $v0 = 2 funcion print_float, espera en $f12 el flotante a imprimir
  	syscall		#donde mostramos el resultado de nuestra suma
	
	li $v0,4 	 #imprime por pantalla el texto resultado media
	la $a0,result1
	syscall
	
	l.s $f22,sz1	#cargamos en f22 la etiqueta sz1 que contiene el tamaño del vector en flotante

	div.s $f23,$f21,$f22		#guardamos en f23 el resultado de la division
	  	
	mov.s $f12,$f23	#movemos nuestra division flotante de simple precision a f12 para poder imprimir

	li $v0,2	# $v0 = 2 funcion print_float, espera en $f12 el flotante a imprimir 
	syscall		#donde mostramos el resultado de nuestra division
  	

	li $v0, 10	# se hace una salida limpia del sistema (exit es codigo 10)
     	syscall

# FIN PROGRAMA 


#1-Elegi registros salvados para preservarlos entre llamadas.
#2-Para cambiar de simple precision a doble cambiariamios los .s por .d y no afectaria a nuestro codigo.