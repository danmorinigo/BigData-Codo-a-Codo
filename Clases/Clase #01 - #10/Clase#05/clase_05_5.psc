/// Estructuras de CONTROL
/// Practica con CONDICIONALES COMBINADOS (usando conectivas logicas)

// Y, O, NO
// AND, OR , NOT

Algoritmo clase_05_5
	
	edad = 37
	sexo = "M" // F o M
	
	Si (edad >= 65) O (edad >= 60 Y sexo == "F") Entonces
		Escribir "La persona se puede jubilar"
	SiNo
		Escribir "La persona no se puede jubilar"
	FinSi
	
FinAlgoritmo
