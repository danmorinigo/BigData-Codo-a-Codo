/// Estructuras de CONTROL
/// Practica con CONDICIONALES ANIDADOS (en cascada)

// SI (condicion) Hacer
//		codigo condicional (cuando se cumple la condicion)
// SINO
//		codigo condicional (cuando no se cumple la condicion)
// FINSI

Algoritmo clase_05_4
	
	edad = 66
	sexo = "M" // F o M
	
	Si (edad >= 65) Entonces
		Escribir "La persona se puede jubilar"
	SiNo
		Si (edad < 60) Entonces
			Escribir "La persona no se puede jubilar"
		SiNo
			si (sexo == "F") Entonces
				Escribir "La persona se puede jubilar"
			SiNo
				Escribir "La persona no se puede jubilar"
			FinSi
		FinSi
	FinSi
	
FinAlgoritmo
