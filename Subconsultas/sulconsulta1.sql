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
