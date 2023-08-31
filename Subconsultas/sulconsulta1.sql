SELECT ProductID AS PID,
	   Quantity,
	   (SELECT ProductName FROM Products WHERE OrderDetails.ProductID = ProductID) AS Nombre,
	   (SELECT Price FROM Products WHERE OrderDetails.ProductID = ProductID) AS Precio
	   FROM OrderDetails

-- Producto mayor recaudado
SELECT ProductID, sum(Quantity) AS TOTAL_VENDIDO,
	   (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID) AS Price,
	   (SELECT ProductName FROM Products WHERE ProductID = OrderDetails.ProductID) AS Name,
	   round((sum(Quantity) * (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID))) AS Total_Recaudado
FROM OrderDetails
GROUP BY ProductID
ORDER BY TOTAL_RECAUDADO DESC

-- 
SELECT ProductID, sum(Quantity) AS TOTAL_VENDIDO,
	   (SELECT ProductName FROM Products WHERE ProductID = OrderDetails.ProductID) AS Name,
	   round((sum(Quantity) * (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID))) AS Total_Recaudado
FROM OrderDetails
WHERE (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID) > 40
GROUP BY ProductID
ORDER BY TOTAL_RECAUDADO

-- Empleados que vendieron mas que el promedio
SELECT FirstName, LastName, 
(SELECT sum(od.Quantity) FROM [Orders] o, [OrderDetails] od
WHERE o.EmployeeID = e.EmployeeID AND od.OrderID = o.OrderID) as unidades_totales
FROM [Employees] e
WHERE unidades_totales < (SELECT avg(unidades_totales) FROM (
	SELECT (SELECT sum(od.Quantity) FROM [Orders] o, [OrderDetails] od
	WHERE o.EmployeeID = e2.EmployeeID AND od.OrderID = o.OrderID) as unidades_totales 
	FROM [Employees] e2
	GROUP BY e2.EmployeeID
))
