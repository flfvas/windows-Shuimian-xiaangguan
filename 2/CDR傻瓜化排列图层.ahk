#NoTrayIcon


SetTitleMatchMode, 2 
GroupAdd, 0o0design2, ahk_exe CorelDRW.exe
return
#IfWinActive ahk_group 0o0design2


*$+WheelUp::
;shift滚轮顶层
;Send, 
Send, +{PgUp}
Return

*$^+WheelUp::
;ctrl shift滚轮上一层
Send, ^{PgUp}
;Send, ^+]
Return

*$+WheelDown::
;;shift滚轮底层
;Send, ^[ 
Send, +{PgDn}
Return

*$^+WheelDown::
;;ctrl shift滚轮下一层
Send, ^{PgDn}
;Send, ^+[
Return

















