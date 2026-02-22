SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([Id], [Nombre], [Activo]) VALUES (1, N'Zapatillas', 1)
GO
INSERT [dbo].[Categoria] ([Id], [Nombre], [Activo]) VALUES (2, N'Polos', 1)
GO
INSERT [dbo].[Categoria] ([Id], [Nombre], [Activo]) VALUES (3, N'Buzos', 0)
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (1, N'Asics')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (2, N'Umbro')
GO
INSERT [dbo].[Marca] ([Id], [Nombre]) VALUES (3, N'Adidas')
GO
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([Id], [IdCategoria], [IdMarca], [Nombre], [Descripcion], [Precio], [Url], [Destacado], [Activo]) VALUES (1, 1, 1, N'GEL-NIMBUS 19', NULL, CAST(256.50 AS Decimal(10, 2)), N'https://images.freeimages.com/images/premium/previews/2444/24444520-stylized-photo-camera.jpg', 1, 1)
GO
INSERT [dbo].[Producto] ([Id], [IdCategoria], [IdMarca], [Nombre], [Descripcion], [Precio], [Url], [Destacado], [Activo]) VALUES (2, 1, 3, N'ZAPATILLA SOLAR GLIDE 19', NULL, CAST(449.00 AS Decimal(10, 2)), N'https://images.freeimages.com/images/premium/previews/2444/24444520-stylized-photo-camera.jpg', 0, 1)
GO
INSERT [dbo].[Producto] ([Id], [IdCategoria], [IdMarca], [Nombre], [Descripcion], [Precio], [Url], [Destacado], [Activo]) VALUES (3, 2, 3, N'POLO ID ALLOVER PRINT', NULL, CAST(109.00 AS Decimal(10, 2)), N'https://images.freeimages.com/images/premium/previews/2444/24444520-stylized-photo-camera.jpg', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO

SELECT P.Id, P.Nombre AS 'Producto', P.Precio, M.Nombre AS 'Marca', C.Nombre AS 'Categoria',
	IIF(P.Destacado > 0, 'SI', 'NO') AS 'Destacado',
	IIF(P.Activo > 0, 'SI', 'NO') AS 'Activo'
FROM Producto P
INNER JOIN Marca M ON P.IdMarca = M.Id
INNER JOIN Categoria C ON P.IdCategoria = C.Id


USE TiendaVirtualDB;
GO

SELECT * 
FROM producto;