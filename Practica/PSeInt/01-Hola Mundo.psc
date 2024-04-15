Algoritmo holaMundo
	Escribir("Hola, que tal?");
	Escribir("Ingrese nombre");
	Leer nombre;
	Escribir("Buen día, " + nombre + ".");
	Escribir("Ingrese apellido");
	Leer apellido;
	Escribir("Buen día, " + nombre + " " + apellido + ".");
	Escribir("Ingrese dos numeros");
	Leer numero1, numero2;
	suma = numero1 + numero2;
	Escribir("La suma de ambos es:");
	Escribir(suma);
	Escribir("Ingrese ganados, empatados y perdidos");
	Leer ganados, empatados, perdidos;
	totalPuntos = ganados * 3 + empatados * 1;
	Escribir("Total de puntos");
	Escribir(totalPuntos);
	Escribir("ingrese 3 numeros");
	Leer numero3, numero4, numero5;
	operacion = (numero3 + numero4) * numero5;
	Escribir("(A + B) x C =");
	Escribir(operacion);
	Escribir("Total de la factura?");
	Leer factura;
	Escribir("Comensales?");
	Leer comensales;
	cadaUnoPaga = factura / comensales;
	Escribir("Cada uno paga...");
	Escribir(cadaUnoPaga);
	Escribir("Ingrese dos numeros");
	Leer n1,n2;
	Escribir("1- Resta o 2- Suma");
	Leer eleccion;
	resultado = 0;
	Si (eleccion == 1) o (eleccion == 2) Entonces
		Si (eleccion = 1) Entonces
			Escribir("Resultado de la resta:");
			resultado = n1 - n2;
		FinSi
		Si (eleccion = 2) Entonces
			Escribir("Resultado de la suma:");
			resultado = n1 + n2;
		FinSi
	SiNo
		Escribir("Error!");
	FinSi
	Escribir(resultado);
	Escribir("Ingrese edad:");
	Leer edad;
	mayorEdad = Falso;
	Si (edad == 18) o (edad > 18) Entonces
		mayorEdad = Verdadero;
	FinSi
	Si mayorEdad Entonces
		Escribir("Mayor de edad");
	SiNo
		Escribir("Menor de edad");
	FinSi
FinAlgoritmo
