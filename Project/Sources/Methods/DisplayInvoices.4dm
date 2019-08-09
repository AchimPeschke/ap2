//%attributes = {"publishedWeb":true}
C_LONGINT:C283($Wref)

  //SET MENU BAR(2)
SET WINDOW RECT:C444(20;60;820;580;<>wRef)


ALL RECORDS:C47([Invoices:2])
CREATE SET:C116([Invoices:2];"current")
ORDER BY:C49([Invoices:2];[Invoices:2]ID_Invoice:1)
$ref:=Open form window:C675([Invoices:2];"Input")
MODIFY SELECTION:C204([Invoices:2];*)
  //<==>

SET MENU BAR:C67(1)
CLEAR SET:C117("current")