#NoTrayIcon


;請確保下段程式碼在腳本最頂部
SetTitleMatchMode, 2
;=====================
#IfWinActive ahk_exe Photoshop.exe ; exe有效


;#IfWinActive, Photoshop
;~*$#E::
$#E::
;將Youtube影片播放速度設為(x2)
Send, !l
Sleep % 250 
Send, Z
Sleep % 250 
Send, L
;Sleep % 250 
Return


#If
