; ESSENTIAL UDF
; #include <EssentialUDF.au>

; #FUNCTION# ====================================================================================================================
; Name...........: _cLog
; Description ...:
; Syntax.........: _cLog($display)
; Parameters ....: $display          - Message
; Return values .:
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: _cLog('Hello World')
; ===============================================================================================================================
Func _cLog($display)
	ConsoleWrite($display & @CRLF)
EndFunc   ;==>_cLog


;HotKeySet('{ESC}', '_ex')
Func _ex()
	_cLog('*Exit*')
	Exit
EndFunc   ;==>_ex

; #FUNCTION# ====================================================================================================================
; Name...........: _PixGC
; Description ...:
; Syntax.........: _PixGC($x, $y, $ObjectPix, $title)
; Parameters ....:  $x          - x coord
;					$y          - y coord
;					$ObjectPix	- Pixel
;					$title		- Handle to the control
; Return values .:
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
;						If _PixGC(100, 100, 0x272822, 'Spotify') Then
;							;DO SOMETHING
;						EndIf
; ===============================================================================================================================

Func _PixGC($x = Null, $y = Null, $ObjectPix = Null, $title = Null)
	If $x = Null Or $y = Null Or $ObjectPix = Null Then
		_cLog('*ERROR*' & @CRLF & _
				'$x = ' & $x & @CRLF & _
				'$y = ' & $y & @CRLF & _
				'Pix: ' & $ObjectPix)
	Else
		If $title <> Null Then
			If WinActive($title) Then
				$gp = WinGetPos($title)
				$lf = PixelGetColor($gp[0] + $x, $gp[1] + $y)
				If $lf = $ObjectPix Then
					_cLog('*Object found*')
					Return True
				EndIf
			EndIf
		Else
			$lf = PixelGetColor($x, $y)
			If $lf = $ObjectPix Then
				_cLog('*Object found*')
				Return True
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_PixGC

; #FUNCTION# ====================================================================================================================
; Name...........: _cClick
; Description ...:	If you have more than 1 screen x coord goes from first monitor on left
; Syntax.........: _cClick($x, $y, $button, $title)
; Parameters ....:  $x          - x coord
;					$y          - y coord
;					$button		- "left"/"right" button of the mouse
;					$title		- Handle to the control
; Return values .:
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
;						_cClick(57, 441, 'LEFT', 'Spotify')
;						_cClick(57, 441, 'RIGHT', 'Spotify')
;						_cClick(57, 441, 'RIGHT)
;						_cClick(57, 441)
; ===============================================================================================================================
Func _cClick($x = Null, $y = Null, $button = 'left', $title = Null)
	If $x = Null Or $y = Null Then
		_cLog('*ERROR*' & @CRLF & _
				'$x = ' & $x & @CRLF & _
				'$y = ' & $y)
	Else
		If $title = Null Then
			ControlClick('', '', '', $button, 1, $x, $y)
			_cLog('*t_Click*')
		Else
			ControlClick($title, '', '', $button, 1, $x, $y)
			_cLog('*Click*')
		EndIf
	EndIf
EndFunc   ;==>_cClick

; #FUNCTION# ====================================================================================================================
; Name...........: _cSend
; Description ...:
; Syntax.........: _cSend($text, $title)
; Parameters ....:  $text      	- text to send
;					$title		- Handle to the control
; Return values .:
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
;						_cSend('Hello World', 'Spotify')
; ===============================================================================================================================
Func _cSend($text = Null, $title = Null)
	If $title = Null Then
		ControlSend('', '', '', $text)
		_cLog('*Text sent*')
	Else
		ControlSend($title, '', '', $text)
		_cLog('*t_Text sent*')
	EndIf
	If $text = Null Then
		_cLog('*Error* -> $text = Null')
	EndIf
EndFunc   ;==>_cSend

; #FUNCTION# ====================================================================================================================
; Name...........: _PixS
; Description ...:
; Syntax.........: _PixS($left, $top, $right, $bottom, $color)
; Parameters ....:  $left, $top, $right, $bottom      	- Coords
;					$color								- hex color
; Return values .:
; Author ........:
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
;						If _PixS(1, 1, 2, 2, 0x272822) Then
;							;DO SOMETHING
;						EndIf
; ===============================================================================================================================
Func _PixS($left = Null, $top = Null, $right = Null, $bottom = Null, $color = Null)
	If $color = Null Then
		_cLog('*Error* -> $color = Null')
	Else
		$pixSe = PixelSearch($left, $top, $right, $bottom, $color)
		If IsArray($pixSe) = True Then
			_cLog('*Object found*')
			Return True
		EndIf
	EndIf
EndFunc   ;==>_PixS
