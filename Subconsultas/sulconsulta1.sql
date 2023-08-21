SELECT ProductID AS PID,
	   Quantity,
	   (SELECT ProductName FROM Products WHERE OrderDetails.ProductID = ProductID) AS Nombre,
	   (SELECT Price FROM Products WHERE OrderDetails.ProductID = ProductID) AS Precio
	   FROM OrderDetails


SELECT ProductID, sum(Quantity) AS TOTAL_VENDIDO,
	   (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID) AS Price,
	   (sum(Quantity) * (SELECT Price FROM Products WHERE ProductID = OrderDetails.ProductID)) AS TOTAL_RECAUDO
FROM OrderDetails
GROUP BY ProductID
