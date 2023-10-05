#REGLAS CREACION DTD

## 1.Construccion de una DTD.
A gramática dun documento XML defínese nun documento DTD. 
A etiqueta  ```<!DOCTYPE>``` contén a definición da gramática. A súa sintaxe é a seguinte:

	<!DOCTYPE nomeElementoRaiz [ declaracions ]>

Ou ben

	<!DOCTYPE nomeElementoRaiz SYSTEM "nomeArquivo.dtd">
		
Onde, nomeElementoRaiz é o nome do elemento raiz; declaracions define unha lista 
do conxunto de declaracións dos elementos e atributos do documento; e nomeArquivo.dtd
é o nome do arquivo da DTD.
A continuación vemos a gramática DTD correspondente ao documento XML anterior:

	<!DOCTYPE tema [
	<!ELEMENT tema (autor, apartado+)>
	<!ATTLIST tema
	titulo CDATA #REQUIRED
	unidade CDATA #REQUIRED>
	<!ELEMENT autor (#PCDATA)>
	<!ELEMENT apartado (#PCDATA)>
	<!ATTLIST apartado
	numero CDATA #REQUIRED>
	]>

## 2. Declaracion DTD. 
			
### 2.1 Declaracións DTD dentro dun documento XML (DTD internas).			
			
Declaracións DTD dentro dun documento XML (DTD internas) <!DOCTYPE> xusto despois do prólogo:

	<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
	<!-- Declaracións DTD-->
	<!DOCTYPE tema [
	<!ELEMENT tema (autor, apartado+)>
	<!ATTLIST tema
	titulo CDATA #REQUIRED
	unidade CDATA #REQUIRED>
	<!ELEMENT autor (#PCDATA)>
	<!ELEMENT apartado (#PCDATA)>
	<!ATTLIST apartado
	numero CDATA #REQUIRED>
	]>
	<!-- Datos XML-->
	<tema unidade="5" titulo="A linguaxe XML">
	<autor>Sabela Varela</autor>
	<apartado numero="1">Contido do apartado 1</apartado>
	<apartado numero="2">Contido do capitulo 2</apartado>
	</tema>

### 2.2 Declaracións DTD nun arquivo .dtd (DTD externas).

Declaracións DTD nun arquivo .dtd (DTD externas) <!DOCTYPE nomeElementoRaiz SYSTEM "nomeArquivo.dtd">		
xusto despois do prólogo e antes dos datos XML para indicar o arquivo que contén a definición da gramática DTD:
```
<!DOCTYPE nomeElementoRaiz SYSTEM "nomeArquivo.dtd">
```			
En primeiro lugar, imos ver o contido do arquivo tema.dtd:
```
	<!ELEMENT tema (autor, apartado+)>
	<!ATTLIST tema
	titulo CDATA #REQUIRED
	unidade CDATA #REQUIRED>
	<!ELEMENT autor (#PCDATA)>
	<!ELEMENT apartado (#PCDATA)>
	<!ATTLIST apartado
		numero CDATA #REQUIRED>
```
E a continuación vemos o contido do arquivo tema.xml que contén o vínculo co arquivo .dtd asociado:
```
	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<!DOCTYPE tema SYSTEM "tema.dtd">
	<!-- Datos XML-->
	<tema unidade="5" titulo="A linguaxe XML">
	<autor>Sabela Varela</autor>
	<apartado numero="1">Contido do apartado 1</apartado>
	<apartado numero="2">Contido do capitulo 2</apartado>
	</tema>
```
Con esta solución, o documento XML non é es autosuficiente e, polo tanto, o valor do atributo standalone é no.

### 2.3 Declaracións DTD nun documento cunha referencia pública.

Cando o documento é un estándar usaremos o identificador PUBLIC, a cadea de texto que o 
identifica e a súa URL. Por exemplo:

			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
			 "http://www.w3.org/TR/html4/strict.dtd">
			 
## 3 Definir elementos.

A sintaxe para definir elementos é a seguinte:

			<!ELEMENT nomeElemento contido>
ou ben
			<!ELEMENT nomeElemento (tipoDeContido)>	 

### 3.1 Especificacions.

-EMPTY ```<!ELEMENT br EMPTY>``` -> ```<br />```

-ANY

-PCDATA```<!ELEMENT titulo (#PCDATA)>``` -> ```<titulo>A linguaxe XML</titulo>```

-MIXED```<!ELEMENT obxecto (#PCDATA|imaxe)*>```


Obxecto podería conter cero ou máis ocurrencias de datos de carácter (#PCDATA) e/ou
subelementos de tipo imaxe.
### 3.2 Regras.

Esta declaración debe respectar as seguintes condicións:
– Os datos textuais #PCDATA deben aparecer sempre en primeira posición.
– O grupo debe ser unha elección (separado co carácter | ).
– O grupo debe aparecer cero, unha ou varias veces (operador *).
			
### 3.3 Modelos contidos.
	
Un modelo de contido é un patrón que establece os subelementos aceptados, e a orde na que 
estes deben estar. A continuación imos ver as distintas posibilidades:
			
-Fillo unico
```
	<!ELEMENT titor (nome)>
```			
```			
	<titor>
	<nome>Sara Vila Ferreiro</nome>
	</titor>
```
-Fillos nunha orde determinada 
```
	<!ELEMENT ciclo (codigo,nome,grao)>
					
```
```					
	<ciclo>
	<codigo>CSIFC03</codigo>
	<nome>Desenvolvemento de aplicacións Web </nome>
	<grao>Superior</grao>
	</ciclo>
```					
-Opción a que aparezan uns fillos ou outros
```			
	<!ELEMENT ciclo ((codigo|nome),grao)>
```					
### 3.4 Frecuencia.

- Opcional ->(?)
```
	<!ELEMENT telefono (mobil, fixo?)>
```
```		
	<telefono>
	<mobil>632323232</mobil>
	</telefono>
```		
- 1 ou máis veces ->(+)
	```
		<!ELEMENT provincia (nome, 
		 (cp,poboacion)+)>
	```	 
	```
		<provincia>
		<nome>Lugo</nome>
		<cp>27003</cp>
		<poboacion>Lugo</poboacion>
		<cp>27850</cp>
		<poboacion>Viveiro</poboacion>
		</provincia>
	```	
	
-"0 ou mais veces" ->(*)
	```
		<!ELEMENT maquinas (ip, maquina)*)>
	```
	```
		<maquinas>
		

		</maquinas>
	```