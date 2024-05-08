## Tematica de la base de datos
Se crea la base de datos de una tienda online dedicada a la venta de velas aromaticas para la toma de pedidos. Para ello es necesario contar con la informacion de los productos, los pedidos y los clientes.

# Listado de Vistas

## V_productos_mas_vendidos
Esta vista muestra los productos más vendidos junto con su stock disponible, total vendido y total vendido más el 10% de IVA.

- Objetivo: Proporcionar información sobre los productos más populares y su desempeño en ventas.
- Tablas involucradas:
    - producto
    - item_pedido

## v_pedidos_detalle
Esta vista presenta detalles sobre los pedidos, incluyendo el nombre del cliente, estado del pedido, fecha de creación y monto total más el 10% de IVA.

- Objetivo: Proporcionar una vista general de los pedidos realizados.
- Tablas involucradas:
    - pedido
    - cliente
    - estado_pedido
    - item_pedido
    - producto
    - historico_estado_pedido

# Listado de Funciones

## fn_calcularIva
Esta función calcula el 10% de IVA sobre un monto dado.

- Objetivo: Calcular el monto total más el 10% de IVA.
- Datos/Tablas manipuladas: Montos de productos.
- Sentencias SQL leídas: No aplica.

# Listado de Stored Procedures

## sp_realizar_venta
Este procedimiento realiza una venta, verificando si hay suficiente stock disponible para el producto solicitado.

- Objetivo: Gestionar el proceso de venta, actualizando el stock y registrando la transacción.
- Tablas involucradas:
    - producto
    - pedido
    - item_pedido

# Listado de Triggers

## trigger_actualizar_estado_pedido
Este trigger actualiza la tabla de historial de estado de pedido cada vez que se actualiza el estado de un pedido en la tabla pedido.

- Objetivo: Registrar el historial de cambios en el estado de los pedidos.
- Tablas involucradas:
    - pedido
    - historico_estado_pedido
