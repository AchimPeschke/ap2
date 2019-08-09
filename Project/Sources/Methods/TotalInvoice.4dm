//%attributes = {"publishedWeb":true}
[Invoices:2]price:4:=Sum:C1([Lines:3]Total:4)
<>Total:=[Invoices:2]price:4*[Invoices:2]VAT rate:6

[Invoices:2]VAT total:5:=<>Total-[Invoices:2]price:4
