#NoTrayIcon


;#IfWinNotActive ahk_exe explorer.exe
#IfWinActive ahk_exe 监视文件+自动备份.exe
;tested on Windows 7
;note: may not work correctly if aero mode is on
;note: some programs don't return the standard NCHITTEST value for a close button,
;a workaround is to compare the cursor position against the window coordinates

LButton::
CoordMode, Mouse, Screen
MouseGetPos, vPosX, vPosY, hWnd

WinGetClass, vWinClass, ahk_id %hWnd%

if vWinClass not in BaseBar,#32768,Shell_TrayWnd,WorkerW,Progman,DV2ControlHost
{
SendMessage, 0x84, 0, vPosX|(vPosY<<16), , ahk_id %hWnd% ;WM_NCHITTEST
vNCHITTEST := ErrorLevel ;(8 min, 9 max, 20 close)
;ToolTip %vNCHITTEST%

if (vNCHITTEST = 20)
{
WinMinimize, ahk_id %hWnd%
Return
}
}

SendInput {LButton Down}
KeyWait, LButton
SendInput {LButton Up}
Return

#If