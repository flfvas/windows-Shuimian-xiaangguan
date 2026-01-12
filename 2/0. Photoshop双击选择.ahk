#NoTrayIcon

;請確保下段程式碼在腳本最頂部
;=====================

SetTitleMatchMode, 2


#IfWinActive ahk_exe Photoshop.exe ; exe有效
; MButton & WheelDown::
; Send, ^{XButton1}
; #If
; F10::exitapp ;退出应用


~*$XButton1::
if XButton1_presses > 0
{
    XButton1_presses += 1
    return
}
XButton1_presses = 1
SetTimer, KeyXButton1, 400 ;此处是第一个更改
return

KeyXButton1:
SetTimer, KeyXButton1, off  ;此处是第二个更改
if XButton1_presses = 2 
{
    Send, ^{XButton1}   ;此是第二处更改
	;Send, eeeeeeeeeeeeeeeee   ;此是第二处更改
}
else if XButton1_presses > 2
{
	Send, ^{XButton1}   ;此是第二处更改
	;Send, eeeeeeeeeeeeeeeee   ;此是第二处更改
}

XButton1_presses = 0      ;此是第三处更改
return

