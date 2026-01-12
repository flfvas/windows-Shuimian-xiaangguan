
#NoTrayIcon


;#IfWinNotActive ahk_class Chrome_WidgetWin_1
;#IfWinActive ahk_exe Obsidian.exe
;SetCapsLockState, AlwaysOff
~a & q::
                    ;~ 保留预设按键功能
                    ;$ 避免自我触发
                    ;* 可在其他组合键触发  
KeyWait, a
KeyWait, q
                ;需要使用系統管理員執行AHK腳本才會生效
                ;BlockInput, On
Send ^!+q
                ;$Space::Send,{Space} ; allow spaces still
                ;清空剪切板
                ;Send z
                ;Sleep 500
                ;PostMessage(0x100, GetKeyVK("."), ControlGetFocus("A"),, "A")
                ;PostMessage, WM_KEYDOWN := 0x0100  ,0 , , , , , , 
                ;SendMessage, Msg [, wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText, Timeout]


;Send z
;Send {Enter}
                ; clipboard =
                ; clipboard := ""
                ; clipboard := clipboard "-"  ; 追加一些文本到剪贴板.
                ; clipboard := clipboard rand  ; 追加一些文本到剪贴板.
                ; clipboard := clipboard Millisecondss  ; 追加一些文本到剪贴板.

                ;BlockInput, Off
                ;Send ^!+p

Return   ;点睛之笔的Return, 避免按快捷键后直接输入Space


;------------------------------------------------------------------------



~s & j::
KeyWait, s
KeyWait, j
Send ^!+{F2}
Return   

/*
;优秀代码
$Space::

Send,{Space down} ; allow spaces still,点睛之笔,直接又重置了
KeyWait, Space
Send,{Space up} ; allow spaces still,点睛之笔,直接又重置了

Return
*/
   

/*
$Space::send,{space} ; allow spaces still
Return
;垃圾代码, 会干扰画布拖动
*/

/*
;输入法切换
;因为此脚本有设定运行条件,通用改键请到其他地方书写
$^Space::
;將Youtube影片播放速度設為(x2)
Send, #{Space 1}
Return
*/



