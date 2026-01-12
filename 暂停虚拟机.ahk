#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; ========================================================
; 必须修改：将下面的 "win700" 换成你 list runningvms 查到的名字
; ========================================================
VM_NAME := "win700" 

; 设置快捷键为 Ctrl + F8 (你可以改成别的，比如 F12)
^2::
    ; 定义 VBoxManage 的路径
    ; 如果你已经配置了环境变量，可以直接写 "VBoxManage.exe"
    ; 如果没配置，必须写全路径，例如 "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
    VBoxCmd := "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

    ; 尝试暂停，如果已经暂停了会报错，我们就捕获错误来执行恢复
    ; 这种方法比查询状态更直接、更快
    RunWait, "%VBoxCmd%" controlvm "%VM_NAME%" pause,, UseErrorLevel Hide
    
    ; 如果上一条命令执行失败（ErrorLevel 不为 0），说明虚拟机可能已经是暂停状态
    if (ErrorLevel != 0)
    {
        Run, "%VBoxCmd%" controlvm "%VM_NAME%" resume,, Hide
        ToolTip, 尝试恢复 VM...
    }
    else
    {
        ToolTip, 尝试暂停 VM...
    }

    SetTimer, RemoveToolTip, -1500
return

RemoveToolTip:
    ToolTip
return