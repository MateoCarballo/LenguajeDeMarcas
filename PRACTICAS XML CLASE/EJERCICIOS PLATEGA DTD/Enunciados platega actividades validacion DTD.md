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