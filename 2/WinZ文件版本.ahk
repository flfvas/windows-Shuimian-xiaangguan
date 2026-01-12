#NoTrayIcon


;发送“%日期%当班的人是：”到剪切板,Alt+C，v1.1.20.03测试通过





*$#Z::
              ;~ 保留预设按键功能
              ;$ 避免自我触发
              ;* 可在其他组合键触发


/*
;請確保下段程式碼在腳本最頂部
SetTitleMatchMode, 2
;=====================

#IfWinActive, YouTube
F8::
;將Youtube影片播放速度設為(x2)
Send, +{. 7}
Return


#If
*/










{
;清空剪切板
clipboard =
;格式化输出日期
FormatTime, OutputVar, ,HHmmss
;发送至剪切板

;Random, rand, 0, 99
;Millisecondss := A_MSec
; 函数A_MSec 表示的是 当前三位数表示的 毫秒数(000-999).


clipboard :=OutputVar
;clipboard := clipboard "-"  ; 追加一些文本到剪贴板.
;clipboard := clipboard rand  ; 追加一些文本到剪贴板.
;clipboard := clipboard Millisecondss  ; 追加一些文本到剪贴板.

/*
clipboard :=OutputVar "当前精确到毫秒级别的时间："
;测试代码，ctrl+v粘贴即可
*/


;MsgBox %clipboard%
;MsgBox , 0, Title, Text%clipboard%, 0.45

/*
MsgBox, Text
MsgBox , 0, Title, Text%clipboard%, 0.5
*/


Send ^v
/* 
Sleep 200
Send {Space}
Sleep 250
Send ^a
Sleep 300
Send ^c

 */

} 


