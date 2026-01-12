#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
;display the date and time, useful for print screen
#singleinstance force

Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui, Color, CCCCCC
Gui, Font, cFF0000 s10 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
;Gui, Font, cFFFFFF s7 , verdana  ;white
Gui, Add, Text, vD y0 BackgroundTrans, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%:%a_sec%
Gui, Show, NoActivate x750 y3,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
SetTimer, RefreshD, 1000
return

RefreshD:
GuiControl, , D, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%:%a_sec%
return
*/





/*
;display the date and time, useful for print screen
#singleinstance force

Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui, Color, CCCCCC
Gui, Font, cFF0000 s10 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
;Gui, Font, cFFFFFF s7 , verdana  ;white
Gui, Add, Text, vD y0 BackgroundTrans, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%
Gui, Show, NoActivate x750 y3,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
SetTimer, RefreshD, 1000
return

RefreshD:
GuiControl, , D, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%
return
*/



;display the date and time, useful for print screen
#singleinstance force  ;单例运行

Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption    ;添加
Gui, Color, E9BDFF   ;颜色
;Gui, Font, cFF0000 s12 , Algerian ;red
;Gui, Font, cFF0000 s10 , verdana ;red
Gui, Font, c000000 s12 , verdana ;black    ;字体颜色, sXX字体大小, XX字体
;Gui, Font, cFFFFFF s12 , Algerian  ;white
Gui, Add, Text, vD y0 BackgroundTrans, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%   ;
Gui, Show, NoActivate x2000 y0,uptime  ; 屏幕坐标
WinSet, TransColor, E9BDFF 128,uptime
SetTimer, RefreshD, 30000
return

RefreshD:
GuiControl, , D, %A_YYYY%-%A_MM%-%A_DD% %a_hour%:%a_min%
return









