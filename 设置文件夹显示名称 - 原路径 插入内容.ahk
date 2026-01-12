; AutoHotkey 1.1 脚本 - 设置文件夹显示名称
; 快捷键: Shift+0

^3::  ; Shift+0
{
    ; 获取剪贴板内容
    folderPath := Clipboard
    
    ; 检查剪贴板是否为空
    if (folderPath = "") {
        MsgBox, 16, 错误, 剪贴板为空！`n请先复制文件夹路径。
        return
    }
    
    ; 检查路径是否存在
    if (!FileExist(folderPath)) {
        MsgBox, 16, 错误, 路径不存在！`n路径: %folderPath%
        return
    }
    
    ; 检查是否为文件夹
    FileGetAttrib, attributes, %folderPath%
    if (!InStr(attributes, "D")) {
        MsgBox, 16, 错误, 这不是一个文件夹！`n路径: %folderPath%
        return
    }
    
    ; 提示输入显示名称
    InputBox, displayName, 设置文件夹显示名称, 请输入文件夹的显示名称:, , 350, 150
    
    ; 检查用户是否取消或输入为空
    if (ErrorLevel) {
        return
    }
    
    if (displayName = "") {
        MsgBox, 48, 提示, 显示名称不能为空！
        return
    }
    
    ; 构建 desktop.ini 文件路径
    iniPath := folderPath . "\desktop.ini"
    
    ; 新的内容
    newContent := ""
    
    ; 如果 desktop.ini 已存在，读取并修改
    if (FileExist(iniPath)) {
        ; 移除只读、系统、隐藏属性以便修改
        FileSetAttrib, -RSH, %iniPath%
        
        ; 读取现有内容
        FileRead, existingContent, %iniPath%
        
        ; 检查是否已有LocalizedResourceName
        if (RegExMatch(existingContent, "i)LocalizedResourceName=")) {
            ; 替换现有的LocalizedResourceName
            newContent := RegExReplace(existingContent, "i)LocalizedResourceName=.*", "LocalizedResourceName=" . displayName)
        } else {
            ; 在[.ShellClassInfo]后面插入LocalizedResourceName
            if (RegExMatch(existingContent, "i)\[\.ShellClassInfo\]")) {
                newContent := RegExReplace(existingContent, "i)(\[\.ShellClassInfo\]\r?\n?)", "$1LocalizedResourceName=" . displayName . "`r`n")
            } else {
                ; 如果没有[.ShellClassInfo]节,在开头添加
                newContent := "[.ShellClassInfo]`r`nLocalizedResourceName=" . displayName . "`r`n" . existingContent
            }
        }
    } else {
        ; 创建新的 desktop.ini
        newContent := "[.ShellClassInfo]`r`nLocalizedResourceName=" . displayName
    }
    
    ; 写入文件
    FileDelete, %iniPath%
    FileAppend, %newContent%, %iniPath%, UTF-16
    
    ; 检查文件是否创建成功
    if (!FileExist(iniPath)) {
        MsgBox, 16, 错误, 写入 desktop.ini 文件失败！`n可能没有写入权限。
        return
    }
    
    ; 设置 desktop.ini 为隐藏+系统文件
    FileSetAttrib, +HS, %iniPath%
    
    ; 设置文件夹为系统文件夹（使 desktop.ini 生效）
    FileSetAttrib, +S, %folderPath%
    
    ; 刷新资源管理器（尝试让更改立即生效）
    DllCall("shell32\SHChangeNotify", "uint", 0x8000000, "uint", 0x1000, "ptr", 0, "ptr", 0)
    
    ; 显示成功消息
    MsgBox, 64, 成功, 文件夹显示名称已设置！`n`n文件夹: %folderPath%`n显示名称: %displayName%`n`n注意：可能需要刷新文件夹或重启资源管理器才能看到效果。
    
    return
}