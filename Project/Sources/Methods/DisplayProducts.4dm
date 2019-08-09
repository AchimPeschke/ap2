//%attributes = {"publishedWeb":true}
C_LONGINT:C283($Wref)

  //SET MENU BAR(2)
SET WINDOW RECT:C444(20;60;820;580;<>wRef)

ALL RECORDS:C47([Products:4])
CREATE SET:C116([Products:4];"current")
ORDER BY:C49([Products:4];[Products:4]Name:2)
$ref:=Open form window:C675([Products:4];"Input")
MODIFY SELECTION:C204([Products:4];*)
  //<==>

SET MENU BAR:C67(1)
CLEAR SET:C117("current")


