//%attributes = {}
  // Resave all records to assign primary keys
Begin SQL
	UPDATE lines SET Quantity = Quantity+0
End SQL
