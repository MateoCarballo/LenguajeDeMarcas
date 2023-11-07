La DTD es mas potente porque tiene en cuenta el tipo de dato que usamos, en la dtd no podiamos hacerlo(todo era texto plano).

Tipos simples y complejos. Tipos simples predefinidos.

Como se declaran los elementos, con xselement.

Basados por un tipo simple por el usuario.

secuence, all, choice,any(poco usado).

Cuando guardamos un xml lo guardamos como texto plano pero indicando que tipo de dato es, a la hora de usarlo
por programas. Nos dice que es posible transformarlo a ese tipo de dato.


Los shemas son un lenguaje que permtite definir schema. Cuando hacemos un schema creamos una instancia de esa
"clase". XML es un metalenguaje permite definir lenguajes. Las reglas son externas al archivo.

Diferencias DTD SHCHEMA.
	
	SCHEMAS especificas la gramatica en xm, porque es xml.
	Es mas extenso que las dtd. Pero si sabemos xml es mas facil de leer porque es el mismo lenguaje.
	Podemos definir tipos de datos o usar los definidos en el esquema(DATOS PRIMITIVOS).
	En DTD siempre existe la secuencia.En xml podemos especificarlo con las clausulas "choice" o " sequence".
	Si nosotros tenemos un atrib o elem llamado "CODIGO" solo lo podemos definir en un lugar, para los DTD.
	En xml podemos usar un nombre en varios lugares, es sensible al contexto.
	Con DDTD no podems realizar claves con referencias cruzadas.
	Comentado ejemplo pagina 4 Modelo de documento para elaborar materiais.
	Usarems el prefijo " xs " .
	Permite especificar ragos en las ocurrencas (Podemos definir la cardinalidad minima pero no la maxima en las dtd).
	En los SCHEMA podemos definir rangos 3<X<10 por ejemplo.
	
	Error en pagina cuatro el prefijo si es xs mantenerlo si no deberiamos usar siempre xsd.
	
	Cuando validamos un documento xml lo hacemos 2 veces. 1 vez contra el SCHEMA "Padre" y otra sobre nuestro archivo .xsd 
	
	Seguimos el enfoque de la POO, entendemos que nuestro SCHEMA es una herencia de otro "Padre" sobre el que se comprueba.
	
	Ejemplo comentadno en clase del coche. Definimos una clase coche pero lo tangible es un modelo de coche y no la idea que define al coche.
	
	La parte con la ue vinculamos nuestro xml y xsd nos la creemos es un dogma de fe.
	DEL XSD PODEMOS COMPROBAR QUE ESTE BIEN FORMADO PERO NO VALIDARLO, NO TENEMOS CONTRA QUIEN VALIDARLO !!!!
	
	TIPOS SIMPLES
	
			Todo lo que no sea un tipo simple es un tipo complejo. ¿Que es un tipo simple?
			
			Los atributos son opcionales, si queremos que sea obligatorio lo espedificamos con "use:required"
			
	TIPOS COMPLEJOS
			
		hay dos formas de representarlo, si empezamos con element deberemos definir cada vez que usemos este tipo de dato complejo los 
		datos simple que tenga dentro.
		Si usamos primero complexType y despues element, creamos una especie de plantilla que podemos reutilizar. Además si queremos modificar algo
		solo lo haremos en un punto.
		
		EXISTEN 4 TIPOS DE ELEMENTOS COMPLEJOS:
			#Elementos vacios
			#Elementos contenedores de otros elementos
			#Solo constan de text, pero tienen algun atributo.
			#Texto con elementos en el medio, el atributo "xs:mixed" debe estar en true " xs:mixed=true"
		
		!!!! PAGINAS 9-10 CHULETA RECORADATORIO !!!!!!!!!
		
		Constructores son element y atribute.
		El resto definen tipos en funcion del orden de las etiquetas.
	

INDICADORES DE ORDE

	#CHOICE elegir entre opciones 1 de ellas
	#ALL cualquier orden de que quiera dentro de los elementos
	