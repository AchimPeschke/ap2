

C_LONGINT:C283($Event)
_O_C_STRING:C293(10;$NextRef)

$Event:=Form event:C388

Case of 
	: ($Event=On Printing Detail:K2:18)
		TotalLine 
		
	: ($Event=On Printing Footer:K2:20)
		TotalInvoice 
		
End case 