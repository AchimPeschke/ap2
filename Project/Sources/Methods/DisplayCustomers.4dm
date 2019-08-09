//%attributes = {"publishedWeb":true}


  //SET MENU BAR(2)
SET WINDOW RECT:C444(20;60;820;580;<>wRef)

ALL RECORDS:C47([Customers:1])
CREATE SET:C116([Customers:1];"current")
ORDER BY:C49([Customers:1];[Customers:1]Company:2)
$ref:=Open form window:C675([Customers:1];"Input")
MODIFY SELECTION:C204([Customers:1];*)
  //<==>

SET MENU BAR:C67(1)
CLEAR SET:C117("current")
