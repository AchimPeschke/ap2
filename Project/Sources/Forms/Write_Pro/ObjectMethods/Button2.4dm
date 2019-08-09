If (Form event:C388=On Clicked:K2:4)
	  // Load the related products
	RELATE MANY:C262([Invoices:2]ID_Invoice:1)
	  // Fille the 4D HTML Tags with real data
	PROCESS 4D TAGS:C816(vSource;vSource)
	  // Import the modified HTML source into the 4D Write Pro area
	w:=WP New:C1317(vSource)
	  // And after using rendering of the references update the source
	  // Use mhtml (mime HTML) as web page archive format for mail
	  // HTML and other resources merged into 1 document
	WP EXPORT VARIABLE:C1319(w;vSource;wk mime html:K81:1)
End if 