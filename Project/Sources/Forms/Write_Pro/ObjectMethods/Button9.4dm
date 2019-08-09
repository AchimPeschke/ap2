If (Form event:C388=On Clicked:K2:4)
	$folder:=Get 4D folder:C485(Current resources folder:K5:16)  // Location of the test document, HTML source
	vSource:=Document to text:C1236($folder+"Template.htm")  // Load it in a text variable
	
	C_OBJECT:C1216(w)  // 4D Write Pro area is of type C_OBJECT
	w:=WP New:C1317(vSource)  // Load the HTML source and render it
End if 