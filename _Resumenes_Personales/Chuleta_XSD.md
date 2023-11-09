# REGLAS DE CREACION SCHEMA XML

## INDICE

## 1. CONSTRUCCION DE SCHEMA.

### 1.1 DEFINICION DE UN SCHEMA.

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

### 1.3 Vinculacion de un esquema.
