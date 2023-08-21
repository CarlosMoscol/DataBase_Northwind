SELECT ProductID AS PID,
	   Quantity,
	   (SELECT ProductName FROM Products WHERE OrderDetails.ProductID = ProductID) AS Nombre,
	   (SELECT Price FROM Products WHERE OrderDetails.ProductID = ProductID) AS Precio
	   FROM OrderDetails
