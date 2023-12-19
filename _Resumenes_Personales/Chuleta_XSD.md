
<!-- VE MAS AL GRANO, SINTETIZADO CON FRAGMENTOS DE CODIGOS NECESARIOS PARA REALIZAR UN SCHEMA DE UN XML -->

# REGLAS DE CREACION SCHEMA XML

## INDICE

## 1. CONSTRUCCION DE SCHEMA

### 1.1 DEFINICION DE UN SCHEMA

Los esquemas resulven problemas de las DTD como el tipado de datos, con las DTD no podiamos comprobar los tipos de datos (Int, String,etc.) y con los esquemas **SI**.
Las DTD solo validan la estructura mientras que los esquemas validan ademas los tipos de datos que definimos para cada elemento.

Analogamente a lo explicado en las DTD una instancia concreta de un esquema XML se conoce como *Definicion de esquema XML* por esto su extension sera *.xsd*.

> [!IMPORTANT]
> UN ESQUEMA XML(EXTENSION .xsd) ES XML. USAMOS XML PARA VALIDAR XML.

### 1.2 Diferencias XML↔DTD

- CONTRIBUCION DE LA SINTAXIS. Los esquemas usan XML las DTD no.
- CONTRIBUCION DA TIPAXE. En .xsd podemos especificar tipos de datos y definir los nuestros.
- SECUENCIAS ORDENADAS. .xsd permite que los elementos aparezcan en cualquier orden.
- DECLARACIONES SENSIBLES AL CONTEXTO. Con .xsd podemos hacer declaraciones sensibles al contexto.
- ESPAZOS DE NOMES. .xsd si soporta los espacios de nombres.
- REFERENCIAS CRUZADAS. .xsd puede formar claves a partir de varios atributos/nombres.
- PERMITE ESPECIFICAR RANGOS. Podemos especificar un valor minimo y maximo para los elementos de un tipo en .xsd

### 1.3 Tipos de datos

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

### 1.4 Declaracion de elementos

#### 1.4.1 Basados en un tipo predefinido

Solo pueden contener texto, no se permiten subelementos ni atributos.


```
<xs:element name="nombreElemento" type="tipoDefinido"/>
```


#### 1.4.2 Basados en un tipo simple definido por el usuario

Solo pueden contener texto, no se permiten subelementos ni atributos.

Se puede definir dentro de un elememento por lo que quedaria oculta al resto del schema o bien fuera para reutilizarla.

**Definiendo el tipo de dato fuera del elemento**

&#8595;
```
<xs:simpleType name="nombreDelTipoSimple">
(...)
</xs:simpleType>

<xs:element name="nombreElemento" type="nombreDelTipoSimple"/>
```

**Definiendo el tipo de dato dentro del elemento**

&#8595;
```
<xs:element name="nombreElemento">
    <xs:simpleType>
    (...)
    </xs:simpleType>
</xs:element>

```

#### 1.4.3 Basados en un tipo complejo definido por el usuario

Permite subelementos y atributos.

**Definiendo el tipo de dato fuera del elemento**

&#8595;
```
<xs:complexType name="nombreDelTipoComplejo">
(...)
</xs:complexType>

<xs:element name="nombreElemento" type="nombreDelTipoComplejo"/>
```

**Definiendo el tipo de dato dentro del elemento**

&#8595;
```
<xs:element name="nombreElemento">
    <xs:complexType>
    (...)
    </xs:complexType>
</xs:element>

```

## 1.5 Ajustando declaracion de elementos

Lista de atributos especificables para configurarlo segun nuestras necesidades.

| Atributo      | Descripción                                            | Ejemplo                                       |
|---------------|--------------------------------------------------------|-----------------------------------------------|
| name          | El nombre del elemento en documentos XML                | `<xs:element name="liña" type="xs:string" maxOccurs="unbounded"/>`   |
| type          | Tipo de datos del contenido del elemento                | `<xs:element name="peso" type="xs:double">`       |
| maxOccurs     | Número máximo de veces que el elemento puede aparecer   | `<xs:element name="dataDeNacemento" type="xs:date" maxOccurs="10"/>` |
| minOccurs     | Número mínimo de veces que el elemento debe aparecer    | `<xs:element name="vehiculos" type="xs:string" minOccurs="0"/>`        |
| default       | Valor predeterminado para el contenido del elemento     | `<xs:element name="númeroDeCopias" type="xs:positiveInteger"default="1">`          |
| fixed         | Valor asignado automáticamente al contenido             | `<xs:element name="correoElectronico" type="xs:string" fixed="ejemplo@example.com" />`        |
| ref           | Nombre de otro elemento definido en el esquema           | `<xs:element ref="nomeDoElementoReferenciado"/>`|

<!--TODO pendiente de revisar como usar este atributo-->
```
<!-- Definición de un elemento en el esquema -->
<xs:element name="nombreElementoReferenciado">
  (...)
</xs:element>
 
<!-- Uso del atributo 'ref' para hacer referencia al elemento ya definido -->
<xs:element ref="nombreElementoReferenciado" />
```

## 2. TIPOS DE DATOS

### 2.1 Tipos Simples

- Su valor es siempre de tipo texto.
- No pueden contener marcas `<>` de otros elementos ni atributos.
- Existen tres mecanismos para crear datos simples (Restricciones,Lista y Uniones).

#### 2.1.2 Restricciones
Una vez especificado el nombre del elemento y sussu tipo podemos realizar restricciones.

| Atributo           | Descripción                                            | Ejemplos                                        |
|--------------------|--------------------------------------------------------|-------------------------------------------------|
| xs:length          | Longitud                                              | `<xs:length value="10"/>`                        |
| xs:minLength       | Longitud Mínima                                        | `<xs:minLength value="5"/>`                      |
| xs:maxLength       | Longitud Máxima                                        | `<xs:maxLength value="100"/>`                    |
| xs:pattern         | Patrón (Expresión Regular)                             | `<xs:pattern value="[A-Za-z0-9]+"/>`            |
| xs:enumeration     | Enumeración (Valores Permitidos)                        | `<xs:enumeration value="red"/>`                  |
| xs:whiteSpace      | Espacios en Blanco                                     | `<xs:whiteSpace value="collapse"/>`              |
| xs:maxInclusive    | Máximo (Incluido)                                      | `<xs:maxInclusive value="10"/>`                  |
| xs:maxExclusive    | Máximo (Excluido)                                      | `<xs:maxExclusive value="10"/>`                  |
| xs:minInclusive    | Mínimo (Incluido)                                      | `<xs:minInclusive value="1"/>`                   |
| xs:minExclusive    | Mínimo (Excluido)                                      | `<xs:minExclusive value="1"/>`                   |
| xs:totalDigits     | Dígitos Totales (en Tipos Numéricos)                   | `<xs:totalDigits value="3"/>`                    |
| xs:fractionDigits  | Dígitos Decimales Totales (en Tipos Numéricos)          | `<xs:fractionDigits value="2"/>`                 |


**EJEMPLO DE USO DE LAS RESTRICCIONES definiendo el tipo fuera del elemento**
&#8595;&#8595;&#8595;&#8595;&#8595;
```
<xs:simpleType name="tipoNota">
        <xs:restriction base="xs:integer">
        <xs:minInclusive value="1"/>
        <xs:maxInclusive value="10"/>
        </xs:restriction>
</xs:simpleType>

<xs:element name="nota1Ev" type="tipoNota" />

```

**EJEMPLO DE USO DE LAS RESTRICCIONES definiendo el tipo dentro del elemento**
&#8595;&#8595;&#8595;&#8595;&#8595;
```
<xs:element name="nota1Ev">
    <xs:simpleType>
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="1"/>
            <xs:maxInclusive value="10"/>
        </xs:restriction>
    </xs:simpleType>
</xs:element>
```

### 2.2 Tipos Complejos

