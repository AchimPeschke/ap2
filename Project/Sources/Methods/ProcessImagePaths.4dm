//%attributes = {}
  // From Technical Note "Sending HTML Emails - 14-06" by Dave Terry
C_POINTER:C301($1)
  //Pointer to Text as HTML
C_TEXT:C284($2)
  //Path to images folder
C_TEXT:C284($3)
  //cid key base name for replaced references
C_POINTER:C301($4)
  //Pointer to text array to fill with full paths
C_POINTER:C301($5)
  //Optional, pointer to text for web area html
ARRAY TEXT:C222($4->;0)
  //Clear the incoming array of paths
  //Various local variables used in this routine
C_LONGINT:C283($Pos;$i;$Find;$P1;$P2)
ARRAY LONGINT:C221($aDocStarts;0)
ARRAY LONGINT:C221($aDocLengths;0)
ARRAY TEXT:C222($aPaths;0)
ARRAY LONGINT:C221($aPositions;0)
ARRAY LONGINT:C221($aLengths;0)
  //The following regex will match on image tags and capture the sources
$RegExp:="<img [^>]*src=\"([^\"]+)\"[^>]*>"

$EHTML:=$1->
  //get the incoming HTML
$Pos:=1
Repeat 
	  //This loop finds all of the src paths in image tags
	  //Gets the start/end of the tag AND the start/end of the tag's source
	$Found:=Match regex:C1019($RegExp;$EHTML;$Pos;$aPositions;$aLengths)
	If ($Found)
		  //We found next one starting at $Pos
		  //The first elements contain the position and length of the tag's source
		APPEND TO ARRAY:C911($aDocStarts;$aPositions{1})
		APPEND TO ARRAY:C911($aDocLengths;$aLengths{1})
		  //The zero elements contain the position and length of the TAG
		  //Set next loop to start further into the string
		$Pos:=$aPositions{0}+$aLengths{0}
	End if 
Until (Not:C34($Found))
  //The next loop extracts the sources and replaces them with id references
  //Go through the tags backward since we will be altering the original
For ($i;Size of array:C274($aDocStarts);1;-1)
	  //Extract the source and build the full path
	$Doc:=$2+Substring:C12($EHTML;$aDocStarts{$i};$aDocLengths{$i})
	$Find:=Find in array:C230($4->;$Doc)
	  //Let's de-dupe the references
	If ($Find<1)
		APPEND TO ARRAY:C911($4->;$Doc)
		$Find:=Size of array:C274($4->)
	End if 
	$P1:=$aDocStarts{$i}-1
	  //Where the 1st part ends
	$P2:=$aDocStarts{$i}+$aDocLengths{$i}
	  //Where the 2nd part starts
	$cid:="cid:"+$3+String:C10($Find)
	$EHTML:=Substring:C12($EHTML;1;$P1)+$cid+Substring:C12($EHTML;$P2)
	  //$Doc:=Replace string($Doc;"\\";"//")  //MS Windowspath handling
	$Doc:=Replace string:C233($Doc;":";"//")  //Mac OS path handling
End for 
$1->:=$EHTML  //Output the HTML for the email body