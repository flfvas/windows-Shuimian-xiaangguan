#NoTrayIcon
;-------------------------注释----------------------------
;obsidian://advanced-uri?vault=ob&uid=20220807-160810-441
;此程序根据积木图生成, 可详见上一条链接

;-------------------------主体----------------------------
~#q::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, q
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send ^!+q
BlockInput, Off
Return

~#a::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, a
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send ^!+a
BlockInput, Off
Return

~#s::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, s
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send ^!+s
BlockInput, Off
Return

~#t::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, t
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send ^{F8}
BlockInput, Off
Return

~#h::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, h
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send ^+!{F4}
BlockInput, Off
Return




~#1::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
KeyWait, 1
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
Send {F13}
BlockInput, Off
Return

~#2::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 2    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F14}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return

~#3::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 3    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F15}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return

~#4::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 4    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F16}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return

~#5::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 5    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F17}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return

~#6::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 6    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F18}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return


~#7::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 7    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F19}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return

LWin & 8::F20
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
;KeyWait, LWin
;KeyWait, RWin
 ;   KeyWait, 8    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
;BlockInput, On
    ;Send {F20}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;BlockInput, Off
Return



~#9::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 9    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F21}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return



~#0::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, 0    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F22}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return



~#NumpadSub::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, -    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F23}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return



~#SC00C::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, =    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F24}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return


~#o::
;等待按鍵釋放，可以避免後面的按鍵操作被干擾
KeyWait, LWin
;KeyWait, RWin
    KeyWait, =    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;需要使用系統管理員執行AHK腳本才會生效
BlockInput, On
    Send {F24}    ;!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
BlockInput, Off
Return






;-----------------------版本控制--------------------------
; ----------------------问题代码-------------------------
/*
总是跳转到Office, 卸载Office也无济于事
可能问题出在还在按住Win键激活了其他
~#q::
Send ^!+q
Return
*/




