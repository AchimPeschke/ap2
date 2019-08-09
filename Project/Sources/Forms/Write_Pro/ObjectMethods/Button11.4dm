If (Form event:C388=On Clicked:K2:4)
	If (vReferences)  //References are displayed
		  // Switch to values
		ST SET OPTIONS:C1289(w;ST Expressions display mode:K78:5;ST Values:K78:6)
		vReferences:=False:C215
	Else   // Values are displayed
		  // Switch to references
		ST SET OPTIONS:C1289(w;ST Expressions display mode:K78:5;ST References:K78:7)
		vReferences:=True:C214
	End if 
End if 