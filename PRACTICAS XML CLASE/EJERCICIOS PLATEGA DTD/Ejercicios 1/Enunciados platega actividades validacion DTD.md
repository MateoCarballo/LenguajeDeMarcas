# Enunciados

## Tarefa 1_a. 
Creación dunha DTD interna sinxela empregando elementos. Nesta tarefa imos traballar definindo elementos e modelos de contido para crear unha DTD interna 
que responda as cos especificacións dadas.

Tarefa 1_a. Creación dunha DTD interna sinxela empregando elementos
Crea a DTD para validar un documento XML que contén unha mensaxe de correo electrónico. Inserta a DTD dentro do arquivo XML. A mensaxe debe constar de:
- un apartado de, que se corresponde con el email del remitente.
- para, onde figurarán os destinatarios do correo electrónico (como mínimo un).
- asunto, un texto que indica o contido do correo.
- corpo, que será o texto do correo electrónico (pode aparecer ou non).
- adxunto, onde se incluirán os arquivos adxuntos ao documento (pode levar varios ou non 
levar ningún).
Un ejemplo de documento xml que validaría sería el siguiente:

		<?xml version="1.0" encoding="ISO-8859-1" standalone="no" ?>
		<!DOCTYPE mensaxe SYSTEM "email.dtd">
		<mensaxe>
			<de>maria@gmail.com</de>
			<para>ignacio@gmail.com</para>
			<para>pedro@edu.xunta.es</para>
			<asunto>Envíoche os arquivos</asunto>
			<adxunto>D:\fotos\dePesca.jpg</adxunto>
			<adxunto>D:\docs\carta.odt</adxunto>
			<adxunto>D:\fotos\naCea.jpg</adxunto>
		</mensaxe>			
		
## Tarefa 1_b. Creación dunha DTD externa. Nesta tarefa imos modificar o feito na tarefa 
1_a para que use unha DTD externa.

Tarefa 1_b. Creación dunha DTD externa
Extrae a DTD creada na tarefa anterior a un arquivo chamado (email.dtd) e enlázaa co 
arquivo XML de exemplo. A continuación, crea outro documento XML válido para esta 
DTD.



## Tarefa 2_a. 

Comprobación e modificación de documentos XML para que respondan a unha DTD determinada
Comproba se os seguintes documentos son válidos e en caso contrario modifica o XML para 
que responda á DTD proposta.

### a) Tarefa2a_a.xml

		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE ciclos [
		 <!ELEMENT ciclos (ciclo)>
		 <!ELEMENT ciclo (#PCDATA)>
		]>
		<ciclos>
		 <ciclo>Administración de Sistemas Informáticos e Redes</ciclo>
		 <ciclo>Desenvolvemento de Aplicacións Multiplataforma</ciclo>
		 <ciclo>Desenvolvemento de Aplicacións Web</ciclo>
		</ciclos>
		
### b) Tarefa2a_b
	
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE ciclo [
		 <!ELEMENT ciclo (modulo+)>
		 <!ELEMENT modulo (#PCDATA)>
		]>
		<ciclo>
		</ciclo>

### c) Tarefa2a_c

		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE ciclo [
		 <!ELEMENT ciclo (codigo*)>
		 <!ELEMENT codigo (#PCDATA)>
		]>
		<ciclo>
		 <CSIFC01>Administración de sistemas informáticos</CSIFC01>
		 <CSIFC02>Desenvolvemento de aplicacións multiplataforma</CSIFC02>
		 <CSIFC03>Desenvolvemento de aplicacións web</CSIFC03>
		</ciclo>
		
### d) Tarefa2a_d
	
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE familias [
		 <!ELEMENT familias (familia*)>
		 <!ELEMENT familia (codigo, nome)>
		 <!ELEMENT codigo (#PCDATA)>
		 <!ELEMENT nome (#PCDATA)>
		]>
		<familias>
		 <familia>
		 <codigo>IFC</codigo>
		 <nome>Informática e comunicacións</nome>
		 </familia>
		 <familia>
		 <nome>Imaxe persoal</nome>
		 <codigo>IMP</codigo>
		 </familia>
		</familias>
		
### e) Tarefa2a_e
	
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE contactos [
		 <!ELEMENT contactos (contacto*)>
		 <!ELEMENT contacto (nome, fixo?, mobil+,correo*)>
		 <!ELEMENT nome (#PCDATA)>
		 <!ELEMENT fixo (#PCDATA)>
		 <!ELEMENT mobil (#PCDATA)>
		 <!ELEMENT correo (#PCDATA)>
		]>
		<contactos>
		 <contacto>
		 <nome>Xoel</nome>
		 <fixo>989898989</fixo>
		 </contacto>
		 <contacto>
		 <nome>Noa</nome>
		 <fixo>998899889</fixo>
		 <correo>noa.vila@traballo.com</correo>
		 <mobil>644432344</mobil>
		 <correo>noa@omeucorreo.com</correo>
		 </contacto>
		</contactos>
		
### f) Tarefa2a_f
	
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE famosos [
		 <!ELEMENT famosos (famoso*)>
		 <!ELEMENT famoso ((nome | apodo), profesion+, dataNacemento?)>
		 <!ELEMENT nome (#PCDATA)>
		 <!ELEMENT apodo (#PCDATA)>
		 <!ELEMENT profesion (#PCDATA)>
		 <!ELEMENT dataNacimiento (#PCDATA)>
		]>
		<famosos>
		 <famoso>
		 <nome>Michael Jackson</nome>
		 <apodo>El rey del pop</apodo>
		 <profesion>cantante</profesion>
		 </famoso>
		<famoso>
		 <nome>Frank Sinatra</nome>
		 <apodo>La voz</apodo>
		 <dataNacemento>12-dec-1915</dataNacemento>
		 <profesion>cantante</profesion>
		 <profesion>actor</profesion>
		 </famoso>
		</famosos>