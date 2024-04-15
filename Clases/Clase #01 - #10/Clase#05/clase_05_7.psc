/// Estructuras de CONTROL
/// Practica con CONDICIONALES MULTIPLES

// SOLUCION ESTANDAR (Con SI .. FINSI)

Algoritmo clase_05_7
	
	// 1 - Cafe
	// 2 - Te
	// 3 - Mate
	// 4 - Chocolate
	
	eleccion = 2
	
	// Solucion para teclado de 10 teclas (0 - 9)
	Si (eleccion == 1) Entonces
		Escribir "Expender Cafe"
	SiNo
		Si (eleccion == 2) Entonces
			Escribir "Expender Te"
		SiNo
			Si (eleccion == 3) Entonces
				Escribir "Expender Mate"
			SiNo
				Si (eleccion == 4) Entonces
					Escribir "Expender Chocolate"
				SiNo
					Escribir "Eleccion no esperada" // Salida DEFAULT 
				FinSi
			FinSi
		FinSi
	FinSi
	
FinAlgoritmo
