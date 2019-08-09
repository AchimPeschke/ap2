//%attributes = {"published4DMobile":{"scope":"table","table":"Customers"}}
C_TEXT:C284($1)
C_LONGINT:C283($0)

QUERY:C277([Customers:1];[Customers:1]Company:2=$1)
RELATE MANY:C262([Customers:1]Company:2)

$0:=Records in selection:C76([Invoices:2])
