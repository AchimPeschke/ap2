If (Form event:C388=On Data Change:K2:15)
	C_LONGINT:C283($col;$row)
	
	LOAD RECORD:C52(Table:C252(vTableNum)->)  // Load current record again
	LISTBOX GET CELL POSITION:C971(*;"LB";$col;$row)  // Which row was clicked
	
	arrFieldPointer{$row}->:=OB Get:C1224(arrObjects{$row};"value")  // Get the value using the pointer array
	SAVE RECORD:C53(Table:C252(vTableNum)->)  // And save the record
	REDRAW:C174(List Box)
	
	  // Get the modified object string
	$value:=arrObjects{$row}
	If ($row>0) & ($row<=Size of array:C274(arrObjects))
		Object_String:=JSON Stringify:C1217(arrObjects{$row};*)
	Else 
		Object_String:=""
	End if 
End if 