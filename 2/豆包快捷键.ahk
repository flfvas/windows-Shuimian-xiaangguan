#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.







; 单例运行：避免重复启动
#SingleInstance Force
; 提升脚本响应速度（可选）
#InstallKeybdHook
#UseHook

; 仅豆包浏览器窗口激活时生效（替换为实际进程名）
;#IfWinActive, ahk_exe DoubaoBrowser.exe
; $前缀：防止SendInput的按键触发自身，同时屏蔽原按键的默认行为
$!Space::
    ; 屏蔽原Alt+空格的系统响应（关键）
    KeyWait, Alt
    KeyWait, Space
    ; 发送Alt+Z（可替换为其他按键）
    SendInput, !z
    return
;#IfWinActive




$#Space::
    ; 屏蔽原Alt+空格的系统响应（关键）
    KeyWait, LWin
    KeyWait, Space
    ; 发送Alt+Z（可替换为其他按键）
    SendInput, !x
    return