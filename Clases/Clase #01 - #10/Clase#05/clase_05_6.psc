/// Estructuras de CONTROL
/// Practica con CONDICIONALES MULTIPLES

// SOLUCION ESTANDAR (Con SI .. FINSI)

Algoritmo clase_05_6
	
	// 1 - Cafe
	// 2 - Te
	// 3 - Mate
	// 4 - Chocolate
	
	eleccion = 4
	
	// Solucion para teclado de 4 teclas
	Si (eleccion == 1) Entonces
		Escribir "Expender Cafe"
	SiNo
		Si (eleccion == 2) Entonces
			Escribir "Expender Te"
		SiNo
			Si (eleccion == 3) Entonces
				Escribir "Expender Mate"
			SiNo
				Escribir "Expender Chocolate"
			FinSi
		FinSi
	FinSi
	
FinAlgoritmo
