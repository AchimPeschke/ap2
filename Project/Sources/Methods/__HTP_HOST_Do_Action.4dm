//%attributes = {"shared":true}
C_PICTURE:C286($vPict)
C_BLOB:C604($blob)
C_OBJECT:C1216($resultObject)
C_TEXT:C284($pictText;$codec;$formName;$name)
C_LONGINT:C283($pageNb;$formSizeW;$formSizeH;$formPagesCount)

$what2Do:=$1
$objectPtr:=$2

Case of 
	: ($what2Do="PICTLIB_GETLIST")
		ARRAY LONGINT:C221($ar_LibPICT_ID;0)
		ARRAY TEXT:C222($ar_LibPICT_Name;0)
		PICTURE LIBRARY LIST:C564($ar_LibPICT_ID;$ar_LibPICT_Name)
		OB SET ARRAY:C1227($resultObject;"PICT_IDS";$ar_LibPICT_ID)
		OB SET ARRAY:C1227($resultObject;"PICT_NAMES";$ar_LibPICT_Name)
		$0:=$resultObject
		
	: ($what2Do="PICTLIB_GETPICT")
		$pictID:=OB Get:C1224($objectPtr->;"PICT_ID";Is longint:K8:6)
		GET PICTURE FROM LIBRARY:C565($pictID;$vPict)
		$offset:=0
		VARIABLE TO BLOB:C532($vPict;$blob;$offset)
		BASE64 ENCODE:C895($blob;$pictText)
		OB SET:C1220($resultObject;"PICT_ITSELF";$pictText)
		$0:=$resultObject
		
	: ($what2Do="PICTLIB_ADDPICT")
		$formName:=OB Get:C1224($objectPtr->;"FORM_NAME";Is text:K8:3)
		$pageNb:=OB Get:C1224($objectPtr->;"FORM_PAGE_NB";Is longint:K8:6)
		$pictText:=OB Get:C1224($objectPtr->;"PICT_ITSELF";Is text:K8:3)
		BASE64 DECODE:C896($pictText;$blob)
		$offset:=0
		BLOB TO VARIABLE:C533($blob;$vPict;$offset)
		ARRAY LONGINT:C221($ar_LibPICT_ID;0)
		ARRAY TEXT:C222($ar_LibPICT_Name;0)
		PICTURE LIBRARY LIST:C564($ar_LibPICT_ID;$ar_LibPICT_Name)
		$startNumber:=20000  //You can choose any number you want from 1 to 32767
		Repeat 
			$found:=0
			If (Find in array:C230($ar_LibPICT_ID;$startNumber)>0)
				$startNumber:=$startNumber+1
			Else 
				$found:=$startNumber
			End if 
		Until ($found>0)
		$index:=0
		Repeat 
			$index:=$index+1
			$pictName:=$formName+"_P"+String:C10($pageNb)+"_"+String:C10($index)
			$fl_Good:=(Find in array:C230($ar_LibPICT_Name;$pictName)<1)
		Until ($fl_Good)
		SET PICTURE TO LIBRARY:C566($vPict;$found;$pictName)
		OB SET:C1220($resultObject;"PICT_ID";$found)
		OB SET:C1220($resultObject;"PICT_NAME";$pictName)
		$0:=$resultObject
		
	: ($what2Do="PICTLIB_DELETE")
		$pictID:=OB Get:C1224($objectPtr->;"PICT_ID";Is longint:K8:6)
		REMOVE PICTURE FROM LIBRARY:C567($pictID)
		
	: ($what2Do="PICTLIB_CONVERT")
		$pictID:=OB Get:C1224($objectPtr->;"PICT_ID";Is longint:K8:6)
		$pictName:=OB Get:C1224($objectPtr->;"PICT_NAME";Is text:K8:3)
		$codec:=OB Get:C1224($objectPtr->;"PICT_CODEC";Is text:K8:3)
		GET PICTURE FROM LIBRARY:C565($pictID;$vPict)
		CONVERT PICTURE:C1002($vPict;$codec)
		  //REMOVE PICTURE FROM LIBRARY($pictID)
		SET PICTURE TO LIBRARY:C566($vPict;$pictID;$pictName)
		
	: ($what2Do="FORM_GETPICT&INFOS")
		$formName:=OB Get:C1224($objectPtr->;"FORM_NAME";Is text:K8:3)
		$pageNb:=OB Get:C1224($objectPtr->;"FORM_PAGE_NB";Is longint:K8:6)
		FORM SCREENSHOT:C940($formName;$vPict;$pageNb)
		FORM GET PROPERTIES:C674($formName;$formSizeW;$formSizeH;$formPagesCount)
		$offset:=0
		VARIABLE TO BLOB:C532($vPict;$blob;$offset)
		BASE64 ENCODE:C895($blob;$pictText)
		OB SET:C1220($resultObject;"FORM_PICT";$pictText)
		OB SET:C1220($resultObject;"FORM_SIZEW";$formSizeW)
		OB SET:C1220($resultObject;"FORM_SIZEH";$formSizeH)
		OB SET:C1220($resultObject;"FORM_PAGESCOUNT";$formPagesCount)
		$0:=$resultObject
		
	Else 
		TRACE:C157
		
End case 
