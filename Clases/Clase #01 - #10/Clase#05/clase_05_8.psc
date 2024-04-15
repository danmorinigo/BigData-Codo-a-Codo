/// Estructuras de CONTROL
/// Practica con CONDICIONALES MULTIPLES

// SOLUCION POR CASOS (Con Segun .. FinSegun)
// Requisitos para usar CASOS:
//		Se comparan los casos contra una sola variable
//		Se comparan los casos solamente por IGUALDAD

Algoritmo clase_05_8
	
	// 1 - Cafe
	// 2 - Te
	// 3 - Mate
	// 4 - Chocolate
	
	eleccion = 2
	
	// Solucion para teclado de 10 teclas (0 - 9)
	
	Segun eleccion Hacer
		1:
			Escribir "Expender Cafe"
		2:
			Escribir "Expender Te"
		3:
			Escribir "Expender Mate"
		4:
			Escribir "Expender Chocolate"
			
		De Otro Modo:
			Escribir "Eleccion no esperada" // Salida DEFAULT 
	FinSegun
		
FinAlgoritmo
