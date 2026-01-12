#NoTrayIcon

                    ;#IfWinNotActive ahk_exe Photoshop.exe or ahk_exe Designer.exe
;if WinActive("ahk_class Notepad") or WinActive("ahk_class" ClassName)
#IfWinActive ahk_exe Obsidian.exe
;if WinActive("ahk_exe Obsidian.exe") or WinActive("ahk_class" ClassName)
;if WinActive("ahk_exe Obsidian.exe") or WinActive("ahk_class" ClassName)
Space & p::
                    ;~ 保留预设按键功能
                    ;$ 避免自我触发
                    ;* 可在其他组合键触发  
KeyWait, P
KeyWait, Space
                ;需要使用系統管理員執行AHK腳本才會生效
                ;BlockInput, On
Send ^!+p
                ;$Space::Send,{Space} ; allow spaces still
                ;清空剪切板
                ;Send z
                ;Sleep 500
                ;PostMessage(0x100, GetKeyVK("."), ControlGetFocus("A"),, "A")
                ;PostMessage, WM_KEYDOWN := 0x0100  ,0 , , , , , , 
                ;SendMessage, Msg [, wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText, Timeout]


Send z
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










Space & m::





                    ;~ 保留预设按键功能
                    ;$ 避免自我触发
                    ;* 可在其他组合键触发  
KeyWait, m
KeyWait, Space
                ;需要使用系統管理員執行AHK腳本才會生效
                ;BlockInput, On
Send !m
Sleep 200
Send ^e
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




;优秀代码
Space & b::
Send !m
    Sleep 200
    Send ^e

Return



;优秀代码
$Space::

Send,{Space down} ; allow spaces still,点睛之笔,直接又重置了
KeyWait, Space
Send,{Space up} ; allow spaces still,点睛之笔,直接又重置了

Return



/*
$Space::
if (Space_presses > 0) ; SetTimer 已经启动, 所以我们记录键击.
{
    Space_presses += 1
    return
}
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器:
Space_presses := 1
SetTimer, KeySpace, -200 ; 在 400 毫秒内等待更多的键击.
return

KeySpace:
if (Space_presses = 1) ; 此键按下了一次.
{
    ;Run, m:\  ; 打开文件夹.
Send {Space}
}
else if (Space_presses = 2) ; 此键按下了两次.
{
    ;Run, m:\multimedia  ; 打开不同的文件夹.
    Send !m
    Sleep 200
    Send ^e
}
else if (Space_presses > 2)
{
    Send ^e
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
Space_presses := 0
return
*/



/*
$Space::send,{space} ; allow spaces still
Return
;垃圾代码, 会干扰画布拖动
*/


;输入法切换
;因为此脚本有设定运行条件,通用改键请到其他地方书写
$^Space::
;將Youtube影片播放速度設為(x2)
Send, #{Space 1}
Return





Space & n::
KeyWait, n
KeyWait, Space
Send ^!+n
Return   ;点睛之笔的Return, 避免按快捷键后直接输入Space
;------------------------------------------------------------------------




