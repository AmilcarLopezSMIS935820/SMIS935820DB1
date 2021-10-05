USE Northwind;

-----| EJERCICIO #1 |-----
CREATE VIEW listadoProductos
AS 
SELECT 
	p.ProductName Producto,
	c.CategoryName Categoria,
	s.CompanyName Proveedor 
FROM
	Products p
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

--- Consulta de la vista
SELECT 
	Producto,
	Categoria,
	Proveedor
FROM listadoProductos
ORDER BY Categoria DESC;


-----| EJERCICIO #2 |-----
--Modificar la vista anterior que esten o no en las ordenes
--Datos a mostrar: nombre producto, nombre categoria, y el orden ID de Order Details

ALTER VIEW listadoProductos
AS 
SELECT 
	p.ProductName Producto,
	c.CategoryName Categoria,
	od.OrderID OrderID
FROM
	Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
LEFT JOIN [Order Details] od
ON p.ProductID = od.ProductID;

--- Consulta de la vista modificada
SELECT 
	Producto,
	Categoria,
	OrderID
FROM listadoProductos
ORDER BY Categoria DESC;


-----| EJERCICIO #3 |-----
--Modificar la vista anterior Utilizando FullJOIN

ALTER VIEW listadoProductos
AS 
SELECT 
	p.ProductName Producto,
	c.CategoryName Categoria,
	od.OrderID OrderID
FROM
	Products p
FULL JOIN Categories c
ON p.CategoryID = c.CategoryID
FULL JOIN [Order Details] od
ON p.ProductID = od.ProductID;


--- Consulta de la vista modificada
SELECT * FROM listadoProductos
SELECT * FROM Products 
