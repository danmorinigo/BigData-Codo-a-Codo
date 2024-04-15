Algoritmo cajero
	
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
			// Aplicacion
			saldo = 143987
			salir = Falso
			
			mientras (No salir) hacer
				Borrar Pantalla
				Escribir "MENU DEL SISTEMA"
				Escribir "================"
				Escribir "1 - Consulta de saldo"
				Escribir "2 - Deposito"
				Escribir "3 - Extraccion"
				Escribir "4 - Transferencia"
				Escribir "5 - Salir"
				Escribir ""
				Escribir "Opción? [1-5]"
				Leer eleccion
				
				Borrar Pantalla
				Segun eleccion Hacer
					1:
						Escribir "CONSULTA DE SALDO"
						Escribir "================="
						Escribir "Su saldo es de $", saldo
					2:
						Escribir "DEPOSITO EN CUENTA"
						Escribir "=================="
						Escribir "Ingrese el monto a depositar:"
						Leer deposito
						Escribir "Su saldo anterior era de $", saldo
						saldo = saldo + deposito
						Escribir "Su saldo actual es de $", saldo
					3:
						Escribir "EXTRACCION DE CUENTA"
						Escribir "===================="
						Escribir "Este cajero entrega billetes de $100, $200, $500, $1000, $2000"
						Escribir "Ingrese el monto a extraer:"
						Leer extraccion
						
						Si (extraccion <= saldo) Entonces
							b100 = 0
							b200 = 0
							b500 = 0
							b1000 = 0
							b2000 = 0
							extSolicitada = extraccion
							
							Si (extraccion >= 2000) Entonces
								b2000 = trunc(extraccion / 2000)
								extraccion = extraccion - b2000 * 2000
								Escribir b2000, " billetes de $2000"
							FinSi
							
							Si (extraccion >= 1000) Entonces
								b1000 = trunc(extraccion / 1000)
								extraccion = extraccion - b1000 * 1000
								Escribir b1000, " billetes de $1000"
							FinSi
							
							Si (extraccion >= 500) Entonces
								b500 = trunc(extraccion / 500)
								extraccion = extraccion - b500 * 500
								Escribir b500, " billetes de $500"
							FinSi
							
							Si (extraccion >= 200) Entonces
								b200 = trunc(extraccion / 200)
								extraccion = extraccion - b200 * 200
								Escribir b200, " billetes de $200"
							FinSi
							
							Si (extraccion >= 100) Entonces
								b100 = trunc(extraccion / 100)
								extraccion = extraccion - b100 * 100
								Escribir b100, " billetes de $100"
							FinSi
							
							Si extraccion > 0 Entonces
								Escribir "No se pueden entregar billetes para completar $", extraccion
							FinSi
							
							saldo = saldo - extSolicitada + extraccion
							
						SiNo
							Escribir "Saldo insuficiente"
						FinSi
						Escribir "Su saldo actual es de $", saldo
					4:
						Escribir "TRANSFERENCIA"
						Escribir "============="
						Escribir "Ingrese el CVU de destino:"
						Leer cvu
						Escribir "Ingrese el monto a tranferir:"
						Leer tranferencia
						Si (tranferencia <= saldo) Entonces
							saldo = saldo - tranferencia
							Escribir "Se tranfiere $", tranferencia, " al CVU ", cvu
						SiNo
							Escribir "Saldo insuficiente"
						FinSi
						Escribir "Su saldo actual es de $", saldo
					5:
						Escribir "Gracias por usar nuestro ATM"
						salir = Verdadero
					De Otro Modo:
						Escribir "Opcion no esperada"
				FinSegun
				Escribir "** Pulse cualquier tecla para continuar **"
				esperar Tecla
			finmientras
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
