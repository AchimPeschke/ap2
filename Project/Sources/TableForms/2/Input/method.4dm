
_O_C_STRING:C293(10;$NextRef)

If (Is new record:C668([Invoices:2]))
	  //compute the next reference

	$NextRef:="F"+Substring:C12(String:C10(Year of:C25(Current date:C33));3)+"-"
	[Invoices:2]ID_Invoice:1:=$NextRef+String:C10(Sequence number:C244([Invoices:2]);"0000")
	[Invoices:2]Invoice date:3:=Current date:C33
	[Invoices:2]VAT rate:6:=<>VAT
	SAVE RECORD:C53([Invoices:2])
	ADD TO SET:C119([Invoices:2];"current")
End if 

TotalInvoice 


