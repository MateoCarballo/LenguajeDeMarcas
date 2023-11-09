# XML para organizar la información de clientes, vehículos y alquileres de un negocio.

Comenzando con una etiqueta llamada "RedAlquiler", que contiene las sucursales de la empresa, identificadas mediante los atributos "direccion" y "cantidadTotalVehiculos". Cada sucursal consta de una lista de vehículos disponibles.

**Para cada vehículo, se registran los siguientes detalles:**

- **Estado:** Indica si el vehículo está en el garaje o alquilado por un cliente.
- **Tipo:** Clasifica el vehículo como coche, furgoneta, etc.
- **Marca.**
- **Modelo.**
- **Fecha de matriculación.**
- **Kilómetros recorridos.**
- **Matrícula, potencia, peso y precio por día de alquiler.**
- **Una breve descripción general y aspectos destacados del vehículo.**

**Cada vehículo debe identificarse de manera única para indicar a qué sucursal pertenece.** Se asume que los vehículos siempre están en la misma sucursal y no pueden ser recogidos en una sucursal y dejados en otra, incluso si pertenecen a la misma compañía.

**Los clientes están registrados en la etiqueta "Clientes", que incluye como atributo la cantidad total de clientes, tanto activos como aquellos que han alquilado vehículos en alguna ocasión. Para cada cliente, se registran los siguientes datos:**

- **Nombre, apellidos, número de teléfono, correo electrónico y fecha de nacimiento.**
- **Un registro de los vehículos que han alquilado, si han realizado alquileres.**
- **El vehículo que tienen alquilado actualmente, si es el caso.**
- **Cada cliente cuenta con un código único para identificar la sucursal a la que están asociados.**
