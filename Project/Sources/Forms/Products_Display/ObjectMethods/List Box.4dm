If ((Form event:C388=On Clicked:K2:4) | (Form event:C388=On Selection Change:K2:29))
	C_LONGINT:C283(vTableNum;$i)
	C_PICTURE:C286(vPicture)
	ARRAY OBJECT:C1221(arrObjects;0)
	ARRAY TEXT:C222(arrFieldNames;0)
	ARRAY POINTER:C280(arrFieldPointer;0)  // For internal reasons
	
	  // ****** Adopt the next line ******
	vTableNum:=Table:C252(->[Products:4])  // Pointer to table products
	  // ****** Adopt the previous line ******
	
	If (Records in set:C195("$ListboxSet0")=1)  // Is only 1 record selected?
		LOAD RECORD:C52(Table:C252(vTableNum)->)  // Make this the current record
		If (Is record loaded:C669(Table:C252(vTableNum)->))  // If loaded
			For ($i;1;Get last field number:C255(vTableNum))  // Loop over all fields of the table
				If (Is field number valid:C1000(vTableNum;$i))  // Valid field number?
					If (Type:C295(Field:C253(vTableNum;$i)->)=Is picture:K8:10)  // Is a picture field, to be modified with v15 Rx
						vPicture:=Field:C253(vTableNum;$i)->
					Else   // No picture type field
						APPEND TO ARRAY:C911(arrFieldNames;Field name:C257(vTableNum;$i))  // Build the field names array
						APPEND TO ARRAY:C911(arrFieldPointer;Field:C253(vTableNum;$i))  // To get the field pointer easily
						
						  // Build the cell objects depending on the field
						Case of   // Not generic to show you what is going on;-)
							: (Field name:C257(vTableNum;$i)="ID_Product")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("text";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="Name")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("text";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="Price")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("integer";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="Stock")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("integer";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="MinimumQty")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("integer";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="Photo")
								  // Not yet implemented, in an upcoming R-release
							: (Field name:C257(vTableNum;$i)="OnStock")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("boolean";Field:C253(vTableNum;$i)))
							: (Field name:C257(vTableNum;$i)="Size")
								APPEND TO ARRAY:C911(arrObjects;Build_Cell_Content ("text";Field:C253(vTableNum;$i)))
						End case 
						
					End if   // If (Type(Field(vTableNum;$i)->)=Is picture)
				End if   // If (Is field number valid(vTableNum;$i))
			End for 
			
			APPEND TO ARRAY:C911(arrFieldNames;"User action")  // Build an own button below the fields
			APPEND TO ARRAY:C911(arrObjects;Build_Button ("Order..."))
			
		End if   // If (Is record loaded(Table(vTableNum)->))
	Else 
		ALERT:C41("Wrong number of selected records!")
	End if   // If (Records in set("$ListboxSet0")=1)
	CLEAR VARIABLE:C89(LB)  // Deselect lower list box entry if new line selected in above list box
End if   //If (Form event=On Clicked) | (Form event=On Selection Change))