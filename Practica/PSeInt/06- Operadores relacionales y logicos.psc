Algoritmo op_relacionales_logicos
	Escribir Sin Saltar "Edad: ";
	Leer edad;
	Escribir Sin Saltar "Sexo [F/M]: ";
	Leer sexo;
	sexo = Mayusculas(sexo);
	Si (sexo = "F" Y edad >= 60) o (sexo = "M" Y edad >= 65) Entonces
		Escribir "La persona se puede jubilar";
	SiNo
		Escribir "La persona aún no se puede jubilar";
	FinSi
	EsperarTeclaYLimpiar;
	Escribir Sin Saltar "Altura [cm]: ";
	Leer altura;
	Si (altura >= 80) y (altura <=110) Entonces
		Escribir "Podría pasar.....";
		Escribir Sin Saltar "Edad: ";
		Leer edad;
		Si edad <= 10 Entonces
			Escribir "Puede pasar";
		SiNo
			Escribir "No pasa por superar maximo edad permitida";
		FinSi
	SiNo
		Escribir "No puede pasar porque no le da la altura";
	FinSi
	EsperarTeclaYLimpiar;
	Escribir Sin Saltar "Ingrese numero de mes [1-12]: ";
	Leer mes;
	Definir cantidadDias Como Entero;
	
	Si mes = 1 o mes = 3 o mes = 5 o mes = 7 o mes = 8 o mes = 10 o mes = 12 Entonces
		cantidadDias = 31;
	SiNo
		Si (mes = 4) o (mes = 6) o (mes = 9) o (mes = 11) Entonces
			cantidadDias = 30;
		Sino 
			Si mes = 2 Entonces
				cantidadDias = 28;
			SiNo
				cantidadDias = 0;
			FinSi
		FinSi
	FinSi
	Si cantidadDias > 0 Entonces
		Escribir "Ese mes tiene ", cantidadDias, " días."
	SiNo
		Escribir "No existe ese mes."
	FinSi
	EsperarTeclaYLimpiar;
	Escribir Sin Saltar "Dia: ";
	Leer dia;
	Escribir Sin Saltar "Mes: ";
	Leer mes;
	Definir estacion Como Caracter;
	diaComienzoEstacion = 21;
	mesOtonio <- 3;
	mesInvierno <- 6;
	mesPrimavera <- 9;
	mesVerano <- 12;
	Si mes < 3 o (mes = 3 y (dia < diaComienzoEstacion)) o (mes = 12 y (dia >= diaComienzoEstacion))Entonces
		estacion = "Verano"
	SiNo
		Si (mes = 3 y (dia >= diaComienzoEstacion)) o (mes < 6) o (mes = 6 y (dia < diaComienzoEstacion))Entonces
			estacion = "Otoño"
		SiNo
			Si (mes = 6 y (dia >= diaComienzoEstacion)) o (mes < 9) o (mes = 9 y (dia < diaComienzoEstacion))Entonces
				estacion = "Invierno"
			SiNo
				Si (mes = 9 y (dia >= diaComienzoEstacion)) o (mes < 12) o (mes = 12 y (dia < diaComienzoEstacion))Entonces
					estacion = "Primavera"
				FinSi
			FinSi
		FinSi
	FinSi
	Escribir estacion;
	EsperarTeclaYLimpiar;
	Definir nota1, nota2, nota3 Como Entero;
	Definir promedio Como Real;
	Definir estado Como Caracter;
	Escribir Sin Saltar "Nota 1: ";
	Leer nota1;
	Escribir Sin Saltar "Nota 2: ";
	Leer nota2;
	Escribir Sin Saltar "Nota 3: ";
	Leer nota3;
	Escribir Sin Saltar "Aprobo TP´s [S/N]: ";
	Leer TPs;
	TPs = Mayusculas(TPs);
	Definir tpsAprobados Como Logico;
	Si TPs = "S" Entonces
		tpsAprobados = Verdadero;
	SiNo
		tpsAprobados = Falso;
	FinSi
	promedio = (nota1 + nota2 + nota3) / 3;
	Escribir "(Promedio -> ", promedio, ")";
	Si promedio < 4 Entonces
		estado = "R";
	SiNo
		Si no tpsAprobados Entonces
			Si promedio >= 4 Entonces
				estado = "D";
			FinSi
		SiNo
			Si promedio < 7 Entonces
				estado = "A";
			SiNo
				estado = "P";
			FinSi
		FinSi
	FinSi
	Segun estado Hacer
		"R":
			Escribir "Reprobado. Debe recursar la materia";
		"D":
			Escribir "Debe presentar los TPs.";
		"A":
			Escribir "Aprobado. Debe rendir el final.";
		"P":
			Escribir "Promocionado.";
	FinSegun
	EsperarTeclaYLimpiar;	
FinAlgoritmo

Funcion EsperarTeclaYLimpiar
	Escribir "Pulse una tecla...";
	Esperar Tecla;
	Limpiar Pantalla;
FinFuncion