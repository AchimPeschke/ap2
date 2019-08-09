If (Form event:C388=On Clicked:K2:4)
	C_LONGINT:C283($col;$row)
	
	  // Which row was clicked?
	LISTBOX GET CELL POSITION:C971(*;"LB";$col;$row)
	
	  // Show elemenet of object array as string
	If ($row>0) & ($row<=Size of array:C274(arrObjects))
		Object_String:=JSON Stringify:C1217(arrObjects{$row};*)
	Else 
		Object_String:=""
	End if 
	
	If ($row=8)
		  // Handle button click event
		ALERT:C41("User wants to order, so please do it by programming!")
	End if 
End if 