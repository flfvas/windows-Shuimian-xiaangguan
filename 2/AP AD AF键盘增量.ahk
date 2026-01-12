;#NoTrayIcon
#SingleInstance force


SetTitleMatchMode, 2 
;GroupAdd, 0o0design, ahk_exe photoshop.exe
;GroupAdd, 0o0design, ahk_exe Illustrator.exe
GroupAdd, 0o0design, ahk_exe publisher.exe
GroupAdd, 0o0design, ahk_exe designer.exe
GroupAdd, 0o0design, ahk_exe photo.exe
return
#IfWinActive ahk_group 0o0design






/*

$*Tab::
;~ 保留预设按键功能
;$ 避免自我触发
;* 可在其他组合键触发  

if (Tab_presses > 0) ; SetTimer 已经启动, 所以我们记录键击.
{
    Tab_presses += 1
    return
}
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器:
Tab_presses := 1
SetTimer, Keyq, -400 ; 在 400 毫秒内等待更多的键击.
return

Keyq:
if (Tab_presses = 1) ; 此键按下了一次.
{
    Send,{Tab}
}
else if (Tab_presses = 2) ; 此键按下了两次.
{
    	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	Send, ^,
	;KeyWait,q
	clipboard := ""   ; 清空剪贴板.
	clipboard := "距离"   ; 在剪贴板中存入新内容.
	Send ^v
}
else if (Tab_presses > 2)
{
        	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	Send, ^,
	;KeyWait,q
	clipboard := ""   ; 清空剪贴板.
	clipboard := "距离"   ; 在剪贴板中存入新内容.
	Send ^v
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
Tab_presses := 0
return

*/





~`::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	Send, ^,
	;KeyWait,q
	clipboard := ""   ; 清空剪贴板.
	clipboard := "距离"   ; 在剪贴板中存入新内容.
	Send ^v
	;SetCapsLockState % !GetKeyState("CapsLock", "T") ; 需要 [v1.1.30+]

return














