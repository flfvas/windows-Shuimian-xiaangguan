+d:: ; 快捷键 Ctrl+d 
{
    ; 获取剪切板内容
    ClipFile := Clipboard
    
    ; 检查是否存在该文件路径
    if FileExist(ClipFile)
    {
        ; 提取目录和完整文件名（含扩展名）
        SplitPath, ClipFile, OutFileName, OutDir
        
        ; 构造新的 txt 文件路径：目录 + 完整文件名 + .txt
        NewFile := OutDir . "\" . OutFileName . ".txt"
        
        ; 如果文件不存在则创建
        if !FileExist(NewFile)
        {
            FileAppend,, %NewFile%
            MsgBox, 64, 成功, 已创建文件：`n%NewFile%
        }
        else
        {
            MsgBox, 48, 提示, 文件已存在：`n%NewFile%
        }
    }
    else
    {
        MsgBox, 16, 错误, 剪切板内容不是有效的文件路径！
    }
}
return