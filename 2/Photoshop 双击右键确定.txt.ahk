#NoTrayIcon



;請確保下段程式碼在腳本最頂部
;=====================

SetTitleMatchMode, 2


#IfWinActive ahk_exe Photoshop.exe ; exe有效
; MButton & WheelDown::
; Send, ^{RButton}
; #If
; F10::exitapp ;退出应用


~*$RButton::
if RButton_presses > 0
{
    RButton_presses += 1
    return
}
RButton_presses = 1
Send, RButton
SetTimer, KeyRButton, 300 ;此处是第一个更改
return

KeyRButton:
SetTimer, KeyRButton, off  ;此处是第二个更改
if RButton_presses = 2 
{
    Send, ^{Enter}   ;此是第二处更改
	;Send, eeeeeeeeeeeeeeeee   ;此是第二处更改
}
else if RButton_presses > 2
{
	Send, ^{Enter}   ;此是第二处更改
	;Send, eeeeeeeeeeeeeeeee   ;此是第二处更改
}

RButton_presses = 0      ;此是第三处更改
return
