//%attributes = {"publishedWeb":true}
If ([Lines:3]Quantity:3>0) & ([Lines:3]ToID_Product:2#"")
	[Lines:3]Total:4:=[Lines:3]Quantity:3*[Products:4]Price:3
End if 