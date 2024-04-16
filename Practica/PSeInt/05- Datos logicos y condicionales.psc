Algoritmo logicos_condicionales
	Definir logico1, logico2 Como Logico;
	logico1 <- Verdadero;
	logico2 <- Falso;
	Escribir "logico1: ", logico1;
	Escribir "logico2: ", logico2;
	EsperarTeclaYLimpiar
	Definir l1, l2, l3, l4, l5, l6 Como Logico;
	l1 <- "a" = "12";
	l2 <- "a" <> "12";
	l3 <- "a" < "12";
	l4 <- "a" <= "12";
	l5 <- "a" > "12";
	l5 <- "a" >= "12";
	Escribir "l1= ", l1;
	Escribir "l2= ", l2;
	Escribir "l3= ", l3;
	Escribir "l4= ", l4;
	Escribir "l5= ", l5;
	Escribir "l6= ", l6;
	EsperarTeclaYLimpiar;
	Escribir Sin Saltar "Nota: ";
	Leer nota;
	Si nota >= 4 Entonces
		Escribir "APROBADO"
	FinSi
	EsperarTeclaYLimpiar
	Escribir Sin Saltar "Precio: ";
	Leer precio;
	Escribir Sin Saltar "Dinero disponible: ";
	Leer dinero;
	Si dinero - precio >= 0 Entonces
		Escribir "COMPRADO!"
	SiNo
		Escribir "Necesita mas dinero!"
	FinSi
	EsperarTeclaYLimpiar;
	Escribir Sin Saltar "Nota Final: ";
	Leer notaFinal;
	Definir reprobado, promocionado Como Logico;
	Si notaFinal >= 4 Entonces
		reprobado <- Falso;
		Si notaFinal >= 7 Entonces
			promocionado <- Verdadero;
		FinSi
	SiNo
		reprobado <- Verdadero;
		promocionado <- Falso;
	FinSi
	Si no reprobado Entonces
		Escribir "Materia Aprobada."
		Si promocionado Entonces
			Escribir "Y PROMOCIONADA."
		FinSi
	SiNo
		Escribir "Materia NO Aprobada."
	FinSi
	EsperarTeclaYLimpiar;
	Definir alturaAuto, alturaCaja, alturaPermitida, alturaTotal Como Real;
	Escribir Sin Saltar "Altura de su auto: ";
	Leer alturaAuto;
	Escribir Sin Saltar "Altura del paquete: ";
	Leer alturaCaja;
	Escribir Sin Saltar "Altura permitida para pasar bajo el puente: ";
	Leer alturaPermitida;
	alturaTotal <- alturaAuto + alturaCaja;
	Si alturaTotal <= alturaPermitida Entonces
		Escribir "CONTINUAR";
	SiNo
		Escribir "ALTO! TOMAR DESVIO";
	FinSi
		EsperarTeclaYLimpiar;
FinAlgoritmo

Funcion EsperarTeclaYLimpiar
	Escribir "Pulse una tecla...";
	Esperar Tecla;
	Limpiar Pantalla;
FinFuncion
	