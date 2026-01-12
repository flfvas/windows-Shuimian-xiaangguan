#NoTrayIcon


SetTitleMatchMode, 2 
GroupAdd, 0o0design2, ahk_exe illustrator.exe
GroupAdd, 0o0design2, ahk_exe photo.exe
GroupAdd, 0o0design2, ahk_exe designer.exe
GroupAdd, 0o0design2, ahk_exe publisher.exe
;GroupAdd, 0o0design2, ahk_exe CorelDRW.exe
;GroupAdd, 0o0design2, ahk_exe CorelDRW.exe
return
#IfWinActive ahk_group 0o0design2


*$+WheelUp::
;shift滚轮顶层
;Send, 
;Send, ^]
Send, ^+]
Return

*$^+WheelUp::
;ctrl shift滚轮上一层
;Send, ^{PgUp}
;Send, ^+]
Send, ^]
Return

*$+WheelDown::
;;shift滚轮底层
;Send, ^[ 
Send, ^+[
;Send, +{PgDn}
Return

*$^+WheelDown::
;;ctrl shift滚轮下一层
;Send, ^{PgDn}
;Send, ^+[
Send, ^[
Return

















