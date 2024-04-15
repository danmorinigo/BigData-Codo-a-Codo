Algoritmo ingresoTecladoYEspera
	Escribir Sin Saltar "Año de nacimiento: ";
	Leer anio_nac;
	Escribir Sin Saltar "Año de actual: ";
	Leer anio_act;
	Escribir "";
	edad = anio_act - anio_nac;
	Escribir Sin Saltar "Edad: ", edad;
	Escribir "";
	Escribir "+-----------+";
	Escribir "| Clase #02 |";
	Escribir "+-----------+";
	Escribir "Presione una tecla para continuar...";
	Esperar Tecla;
	Limpiar Pantalla;
	Escribir "Gracias por su colaboración";
	Escribir "+-----------+";
	Escribir "| Clase #02 |";
	Escribir "+-----------+";
	Escribir Sin Saltar "Ingrese segundos a esperar:";
	Leer tiempoEspera;
	Escribir "Esperando ", tiempoEspera, " segundos...";
	Esperar tiempoEspera Segundos;
	Limpiar Pantalla;
	Escribir "Gracias por su colaboración";
	Escribir Sin Saltar "Nota 1";
	Leer nota1;
	Escribir Sin Saltar "Nota 2";
	Leer nota2;
	Escribir Sin Saltar "Nota 3";
	Leer nota3;
	promedio = (nota1 + nota2 + nota3) / 3;
	Escribir "";
	Escribir "Promedio de las notas ", nota1 , ", " , nota2 , " y ", nota3, " es ", promedio, ".";
	Escribir "";
	Escribir "Presione una tecla para continuar...";
	Esperar Tecla;
	Limpiar Pantalla;
	Escribir Sin Saltar "Nombre";
	Leer nombre;
	Escribir Sin Saltar "Apellido";
	Leer apellido;
	apellidoYNombre <- apellido + ", " + nombre;
	cantLetras <- Longitud(apellidoYNombre);
	Escribir "";
	Escribir "Registrado en la base de datos como:";
	Escribir apellidoYNombre;
	Escribir "Nuevo registro con ", cantLetras, " caracteres.";
	Escribir "Presione una tecla para continuar...";
	Esperar Tecla;
	Limpiar Pantalla;
	EscribirSurayado("Calculador de cuando se jubila");
	Escribir Sin Saltar "Nombre: ";
	Leer nombreJ;
	Escribir Sin Saltar "Edad: ";
	Leer edadJ;
	Escribir Sin Saltar "Año actual: ";
	Leer anioJ;
	faltaParaJubilacion <- 65 - edadJ;
	Si faltaParaJubilacion > 0 Entonces
		Escribir nombreJ, " se juybila en el año ", anioJ + faltaParaJubilacion, ".";
	SiNo
		Escribir nombreJ, " ya deberías estar jubilado!"
	FinSi
FinAlgoritmo

Funcion Subrayar(texto)
	longitudTexto = Longitud(texto);
	Para i = 1 Hasta longitudTexto Con Paso 1 Hacer
		Escribir Sin Saltar "-";
	FinPara
	Escribir "";
FinFuncion
Funcion EscribirSurayado(texto)
	Escribir texto;
	Subrayar(texto);
FinFuncion
