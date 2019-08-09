If (Form event:C388=On Load:K2:1)
	Case of 
		: ([Products:4]Name:2="Cups solid")
			OBJECT SET LIST BY NAME:C237([Products:4]Size:8;Choice list:K42:19;"Size")
		: ([Products:4]Name:2="Paper Plates")
			OBJECT SET LIST BY NAME:C237([Products:4]Size:8;Choice list:K42:19;"Size")
		: ([Products:4]Name:2="Paper towels")
			OBJECT SET LIST BY NAME:C237([Products:4]Size:8;Choice list:K42:19;"Size")
		: ([Products:4]Name:2="Printer paper")
			OBJECT SET LIST BY NAME:C237([Products:4]Size:8;Choice list:K42:19;"Paper size")
		: ([Products:4]Name:2="Coffee filters")
			OBJECT SET LIST BY NAME:C237([Products:4]Size:8;Choice list:K42:19;"Filter size")
	End case 
End if 
