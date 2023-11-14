# REGLAS DE CREACION SCHEMA XML

## INDICE

## 1. CONSTRUCCION DE SCHEMA

### 1.1 DEFINICION DE UN SCHEMA

Los esquemas resulven problemas de las DTD como el tipado de datos, con las DTD no podiamos comprobar los tipos de datos (Int, String,etc.) y con los esquemas **SI**.
Las DTD solo validan la estructura mientras que los esquemas validan ademas los tipos de datos que definimos para cada elemento.

Analogamente a lo explicado en las DTD una instancia concreta de un esquema XML se conoce como *Definicion de esquema XML* por esto su extension sera *.xsd*.

```
```

> [!IMPORTANT]
> UN ESQUEMA XML(EXTENSION .xsd) ES XML. USAMOS XML PARA VALIDAR XML.

### 1.2 Diferencias XML↔DTD.

- CONTRIBUCION DE LA SINTAXIS. Los esquemas usan XML las DTD no.
- CONTRIBUCION DA TIPAXE. En .xsd podemos especificar tipos de datos y definir los nuestros.
- SECUENCIAS ORDENADAS. .xsd permite que los elementos aparezcan en cualquier orden.
- DECLARACIONES SENSIBLES AL CONTEXTO. Con .xsd podemos hacer declaraciones sensibles al contexto.
- ESPAZOS DE NOMES. .xsd si soporta los espacios de nombres.
- REFERENCIAS CRUZADAS. .xsd puede formar claves a partir de varios atributos/nombres.
- PERMITE ESPECIFICAR RANGOS. Podemos especificar un valor minimo y maximo para los elementos de un tipo en .xsd

### 1.3 Vinculacion de un esquema

| Tipo Primitivo         | Descripción            | Ejemplo                                        |
|------------------------|------------------------|------------------------------------------------|
| **CADENAS**            |                        |                                                |
| xs:string              | Cadena de caracteres   | `<nombre>John</nombre>`                         |
| xs:anyURI              | URI                    | `<enlace>http://ejemplo.com</enlace>`           |
| xs:normalizedString    | Cadena Normalizada     | `cadena_normalizada`                            |
| **NÚMEROS**            |                        |                                                |
| xs:byte                | Byte                   | `<numero>123</numero>`                          |
| xs:decimal             | Número decimal         | `<numero>19.99</numero>`                        |
| xs:float               | Número flotante        | `<numero>3.14</numero>`                         |
| xs:int                 | Entero                 | `<numero>5</numero>`                            |
| xs:integer             | Número entero          | `<numero>5</numero>`                            |
| xs:long                | Entero largo           | `<numero>7648321</numero>`                     |
| xs:negativeInteger     | Entero negativo        | `<numero>-100</numero>`                         |
| xs:nonNegativeInteger  | Entero no negativo     | `<numero>0</numero>`                            |
| xs:positiveInteger     | Entero positivo        | `<numero>10</numero>`                           |
| xs:nonPositiveInteger  | Entero no positivo     | `<numero>-5</numero>`                           |
| xs:short               | Entero corto           | `<numero>30000</numero>`                        |
| xs:unsignedInt         | Entero sin signo       | `<numero>100</numero>`                          |
| xs:unsignedLong        | Entero largo sin signo | `<numero>4294967295</numero>`                   |
| xs:unsignedShort       | Entero corto sin signo | `<numero>65535</numero>`                        |
| **FECHA**              |                        |                                                |
| xs:date                | Fecha                  | `<fechaNacimiento>2000-01-01</fechaNacimiento>` |
| xs:time                | Hora                   | `<hora>12:30:00</hora>`                         |
| xs:dateTime            | Fecha y hora           | `<timestamp>2023-11-09T08:30:00</timestamp>`    |
| xs:duration            | Duración               | `<duracion>PT2H30M</duracion>`                  |
| **BOOLEANOS**          |                        |                                                |
| xs:boolean             | Valor booleano         | `<activo>true</activo>` `<activo>1</activo>`    |

> [!IMPORTANT]
> PARA REAL SEPARAMOS CON UN PUNTO

> [!IMPORTANT]
> PARA BOOLEAN PODEMOS USAR 0/1 O TRUE/FALSE

> [!IMPORTANT]
> PARA DATA EL FORMATO ES AAAA-MM-DD Y HORA ES hh:mm:ss