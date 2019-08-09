CONFIRM:C162("Are you shure?")

If (ok=1)
	REMOVE FROM SET:C561([Customers:1];"current")
	DELETE RECORD:C58([Customers:1])
	USE SET:C118("current")
	CANCEL:C270
End if 