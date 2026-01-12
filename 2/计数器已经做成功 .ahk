#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;----------文件路径--------------------
;#Requires AutoHotkey v1.1.33


;-----------读取最后一行---------------


/*
xieru0o0()
{
FileAppend,
(

%lastLine0o0%  
), d:\desktop\AutoHotKey工程\0.txt
}
*/

;-------------触发----------------------
#x::
;KeyWait,x


/* 
;读取
file := A_ScriptDir "\0.txt"
Loop Read, % file
lastLine0o0 := A_LoopReadLine
;MsgBox, 64, Last line, % lastLine0o0


 */

;% x+7
;lastLine0o0 := % lastLine0o0 + 1   ;读取出来之后+1
                                 ;变量此时已经+1
                         ;写入在读取之后执行
;MsgBox, %a%

;什么时候追加
    ;在读取之前追加
;什么时候读取
    ;在追加之前读取




;读取
file := A_ScriptDir "\0.txt"
Loop Read, % file
lastLine0o0 := A_LoopReadLine
;MsgBox, 64, Last line, % lastLine0o0


if (lastLine0o0 < 10)
{
  







    clipboard := 0
    clipboard := clipboard lastLine0o0  ; 追加一些文本到剪贴板.
    ;clipboard := clipboard rand  ; 追加一些文本到剪贴板.
    ;clipboard := clipboard Millisecondss  ; 追加一些文本到剪贴板.
    Send, {Space}
    ;Sleep, 200
    Send, ^v    
    
    
lastLine0o0 := % lastLine0o0 + 1   ;读取出来之后+1

    
;xieru
FileAppend,
(

%lastLine0o0%  
), % file


}
else
{
    clipboard := lastLine0o0  ; 追加一些文本到剪贴板.
    ;clipboard := clipboard rand  ; 追加一些文本到剪贴板.
    ;clipboard := clipboard Millisecondss  ; 追加一些文本到剪贴板.
    Send, {Space}
    ;Sleep, 200
    Send, ^v  
    

lastLine0o0 := % lastLine0o0 + 1   ;读取出来之后+1



;xieru
FileAppend,
(

%lastLine0o0%  
), % file
    
    
    
}
