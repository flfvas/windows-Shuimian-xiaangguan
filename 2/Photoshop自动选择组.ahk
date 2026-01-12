#NoTrayIcon

;請確保下段程式碼在腳本最頂部
;=====================

SetTitleMatchMode, 2


#IfWinActive ahk_exe Photoshop.exe ; exe有效

/*
*$!WheelUp::
Send, ^{F6}
Return

*$!WheelDown::
Send, ^{F7}
Return


MButton & WheelDown::
Send, ^{F7}
Return

WheelDown & MButton::
Send, ^{F6}
Return
*/


~MButton & WheelUp::
Send, ^{F6}
Return


~MButton & WheelDown::
Send, ^{F7}
Return



