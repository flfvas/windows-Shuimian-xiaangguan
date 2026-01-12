#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2 
;GroupAdd, 0o0design, ahk_exe photoshop.exe
GroupAdd, 0o0design, ahk_exe Illustrator.exe
return
#IfWinActive ahk_group 0o0design

~MButton & WheelDown::
Send, !{WheelDown}
;Send, !{WheelDown}
;Send, !{WheelDown}
return


~MButton & WheelUp::
Send, !{WheelUp}
;Send, !{WheelUp}
;Send, !{WheelUp}
return

