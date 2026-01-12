#NoTrayIcon

;請確保下段程式碼在腳本最頂部
SetTitleMatchMode, 2
;=====================

;if WinActive("ahk_class Photoshop") or WinActive("ahk_exe" Photoshop)
;#IfWinActive, Photoshop
;#IfWinActive ahk_class Photoshop or ahk_exe Photoshop


/* 
#IfWinActive ahk_class Illustrator
*$^V::

Send, ^+V
Return
#If

 */

SetTitleMatchMode, 2 
GroupAdd, 0o0design, ahk_exe photoshop.exe
GroupAdd, 0o0design, ahk_exe Illustrator.exe
return
#IfWinActive ahk_group 0o0design
*$^V::

Send, ^+V
Return


