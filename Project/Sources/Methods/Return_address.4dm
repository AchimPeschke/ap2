//%attributes = {}
C_TEXT:C284($0)

  //ALL RECORDS([Customers])
$0:=[Customers:1]Company:2+"\r"
$0:=$0+[Customers:1]Address:3+"\r"+"\r"
$0:=$0+[Customers:1]Country:6+"-"+[Customers:1]Zip:4+" "+[Customers:1]City:5