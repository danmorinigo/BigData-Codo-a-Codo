/// Sistema de ingreso con usuario y clave (login)
/// El sistema debe permitir un maximo de 3 intentos
/// Si ya existe un ingreso correcto debe detener la solicitud de usuario

Algoritmo login
	usuarioBBDD = "Julieta"
	claveBBDD = "1234"
	intentos = 3
	valido = Falso
	
	Mientras (intentos > 0 y No valido) Hacer
		Escribir "Ingrese el usuario:"
		Leer usuario
		Escribir "Ingrese la clave:"
		Leer clave
		
		// Verificar la coincidencia de ambos items
		Si (usuario==usuarioBBDD Y clave==claveBBDD) Entonces
			Escribir "Ingreso valido"
			valido = Verdadero
		SiNo
			Escribir "Ingreso no valido"
			intentos = intentos - 1
			Escribir "Le quedan ", intentos, " intentos"
		FinSi
		Escribir ""
		
	FinMientras
	
	Si intentos == 0 Entonces
		Escribir "Usuario bloqueado"
	FinSi
	
FinAlgoritmo
