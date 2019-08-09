
ADD RECORD:C56(Current form table:C627->)
If (OK=1)
	ADD TO SET:C119(Current form table:C627->;"current")
End if 
USE SET:C118("current")
ORDER BY:C49([Invoices:2];[Invoices:2]ID_Invoice:1)
