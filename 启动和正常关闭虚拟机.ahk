#NoEnv  ; 推荐配置
SendMode Input
SetWorkingDir %A_ScriptDir%

; ========================================================
; 必须修改：将下面的 "windows" 换成你的虚拟机名称
; (可通过 VBoxManage list vms 命令查看)
; ========================================================
VM_NAME := "windows" 

; 设置快捷键为 Ctrl + F8 
^1::
    ; 定义 VBoxManage 的路径
    ; **必须修改**：替换为你的 VirtualBox 安装路径下的 VBoxManage.exe
    VBoxCmd := "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

    ; 1. 尝试正常关闭虚拟机 (ACPI Shutdown)
    ; VBoxManage controlvm <VM名称> acpipowerbutton
    ; 这是一个"软关机"，让操作系统正常关机
    RunWait, "%VBoxCmd%" controlvm "%VM_NAME%" acpipowerbutton,, UseErrorLevel Hide
    
    ; 2. 如果上一条命令执行失败（ErrorLevel 不为 0），说明虚拟机没有在运行
    if (ErrorLevel != 0)
    {
        ; 尝试启动虚拟机，并使用 GUI 模式（弹出界面）
        ; VBoxManage startvm <VM名称> --type gui
        Run, "%VBoxCmd%" startvm "%VM_NAME%" --type gui,, Hide
        ToolTip, 尝试启动 VM 并弹出界面...
    }
    else
    {
        ToolTip, 尝试正常关闭 VM... (ACPI Shutdown)
    }

    ; 1.5 秒后自动移除 ToolTip 提示
    SetTimer, RemoveToolTip, -1500
return

RemoveToolTip:
    ToolTip
return