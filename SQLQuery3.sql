USE [TiendaVirtualDB];
GO

-- CLIENTE
INSERT INTO Cliente (Nombres, Apellidos, Dni, Telefono, Correo, Direccion)
VALUES 
('Juan','Perez','12345678','999111111','juan@gmail.com','Av. Principal 123'),
('Maria','Lopez','87654321','999222222','maria@gmail.com','Calle Falsa 456'),
('Carlos','Ramirez','11223344','999333333','carlos@gmail.com','Jr. Lima 789'),
('Ana','Torres','44332211','999444444','ana@gmail.com','Av. Los Pinos 101'),
('Luis','Vargas','55667788','999555555','luis@gmail.com','Calle Sol 202');

-- TARJETA
INSERT INTO Tarjeta (Marca, Numero)
VALUES
('Visa','4111111111111111'),
('MasterCard','5500000000000004'),
('Visa','4111111111111122'),
('Amex','340000000000009'),
('Visa','4111111111111133');

-- PEDIDO
INSERT INTO Pedido (IdCliente, IdTarjeta, FechaHora, Estado, Total)
VALUES
(1,1,GETDATE(),'Pagado',100.00),
(2,2,GETDATE(),'Pendiente',30.00),
(3,3,GETDATE(),'Enviado',100.00),
(4,4,GETDATE(),'Pagado',50.00),
(5,5,GETDATE(),'Pendiente',90.00);

-- PEDIDODETALLE
INSERT INTO PedidoDetalle (IdPedido, IdProducto, Cantidad, PrecioUnitario, SubTotal)
VALUES
(1,1,2,50,100),
(2,2,1,30,30),
(3,3,4,25,100),
(4,1,1,50,50),
(5,2,3,30,90);

--Consulta de datos

SELECT 
    p.Id AS IdPedido,
    CAST(p.FechaHora AS DATE) AS FechaPedido,
    p.Estado AS EstadoPedido,
    p.Total AS MontoTotal,
    c.Nombres + ' ' + c.Apellidos AS Cliente,
    t.Marca AS MarcaTarjeta,
    t.Numero AS NumeroTarjeta
FROM Pedido p
INNER JOIN Cliente c ON p.IdCliente = c.Id
INNER JOIN Tarjeta t ON p.IdTarjeta = t.Id
ORDER BY 
    Cliente ASC,
    FechaPedido ASC;

-- Consulta de productos por pedido 

SELECT
    pd.IdPedido,
    pr.Nombre AS NombreProducto,
    pd.Cantidad,
    pd.PrecioUnitario,
    pd.SubTotal
FROM PedidoDetalle pd
INNER JOIN Producto pr ON pd.IdProducto = pr.Id
ORDER BY pr.Nombre ASC;

-- Procedimientos almacenados, Lista pedidos (sin parámetros)

CREATE PROCEDURE sp_ListarPedidos
AS
BEGIN
    SELECT 
        p.Id AS IdPedido,
        CAST(p.FechaHora AS DATE) AS FechaPedido,
        p.Estado AS EstadoPedido,
        p.Total AS MontoTotal,
        c.Nombres + ' ' + c.Apellidos AS Cliente,
        t.Marca AS MarcaTarjeta,
        t.Numero AS NumeroTarjeta
    FROM Pedido p
    INNER JOIN Cliente c ON p.IdCliente = c.Id
    INNER JOIN Tarjeta t ON p.IdTarjeta = t.Id
    ORDER BY 
        Cliente ASC,
        FechaPedido ASC;
END
GO

--Procedimientos para listar productos de un pedido (Con parámetro)
CREATE PROCEDURE sp_ProductosPorPedido
    @IdPedido INT
AS
BEGIN
    SELECT
        pd.IdPedido,
        pr.Nombre AS NombreProducto,
        pd.Cantidad,
        pd.PrecioUnitario,
        pd.SubTotal
    FROM PedidoDetalle pd
    INNER JOIN Producto pr ON pd.IdProducto = pr.Id
    WHERE pd.IdPedido = @IdPedido
    ORDER BY pr.Nombre ASC;
END
GO
--Ejemplo de ejecución
EXEC sp_ProductosPorPedido 1;

--Actualiza el modelo si se agrega una nueva columna
ALTER TABLE Marca
ADD Activo BIT NOT NULL DEFAULT 1;