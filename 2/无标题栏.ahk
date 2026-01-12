#NoTrayIcon


;^#h::
^#h::
                    ;~ 保留预设按键功能
                    ;$ 避免自我触发
                    ;* 可在其他组合键触发  
SetTitleMatchMode, 2 ;设定ahk匹配窗口标题的模式
winactivate,A ; 激活此窗口
sleep, 500 ; 延时，确保
;WinSet,Transparent,240,A    ;使得窗口变透明。取值范围0-255.0为完全透明，255完全不透明。
WinSet, Style, -0xC00000,A  ;去掉标题栏
return

;^#t::
^#t::
                    ;~ 保留预设按键功能
                    ;$ 避免自我触发
                    ;* 可在其他组合键触发  
SetTitleMatchMode, 2
WinActivate,A
WinSet,Style,+0xC00000,A     ;恢复标题栏


/*
#h::
  ;等待按鍵釋放，可以避免後面的按鍵操作被干擾
  KeyWait, LWin
  KeyWait, RWin
  KeyWait, h
  ;需要使用系統管理員執行AHK腳本才會生效
  BlockInput, On
  Send ^!+{F4}
  BlockInput, Off
  return
*/
