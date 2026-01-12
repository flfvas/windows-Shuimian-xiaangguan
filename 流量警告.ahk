#NoEnv
#Persistent
SetBatchLines, -1

SetTimer, Check, 10000  ; 每10秒检查一次
return

Check:
    ; 检查浏览器是否运行
    Process, Exist, chrome.exe
    chrome := ErrorLevel
    Process, Exist, brave.exe
    brave := ErrorLevel
    Process, Exist, msedge.exe
    edge := ErrorLevel
    
    if (!chrome && !brave && !edge)
        return
    
    ; 获取WiFi名称
    RunWait, %ComSpec% /c netsh wlan show interfaces | findstr "SSID" > %A_Temp%\wifi.txt, , Hide
    FileRead, wifi, %A_Temp%\wifi.txt
    FileDelete, %A_Temp%\wifi.txt
    
    
    /*
    ; 检查是否为指定WiFi
    if InStr(wifi, "aaaaaaaaa") {
        SoundBeep
        
        ; 创建大字体tooltip，透明度30%
        Gui, WarningTip:New, +AlwaysOnTop -Caption +ToolWindow
        Gui, Font, s20 bold, Microsoft YaHei
        Gui, Color, FFFFE0
        Gui, Add, Text, cRed, ⚠️ 当前为计费流量
        Gui, Show, NoActivate x0 y0
        ;WinSet, Transparent, 77, A  ; 77 = 30% 透明度 (255 * 0.3)
        
        SetTimer, RemoveToolTip, 5000  ; 5秒后自动消失
    }
    */
    
    
    
    
    ; ... 前面代码保持不变 ...

    ; 检查是否为指定WiFi
    if InStr(wifi, "aaaaaaaaa") {
        SoundBeep
        
        ; 创建大字体tooltip
        Gui, WarningTip:New, +AlwaysOnTop -Caption +ToolWindow +LastFound ; 添加 +LastFound 以便后续设置透明度
        Gui, Font, s20 bold, Microsoft YaHei
        Gui, Color, FFFFE0
        Gui, Add, Text, cRed, ⚠️ 当前为计费流量
        
        ; 设置透明度为 30% (255 * 0.3 ≈ 76)
        WinSet, Transparent, 76
        
        Gui, Show, NoActivate x0 y0
        
        SetTimer, RemoveToolTip, 5000  ; 5秒后自动消失
    }
 
    
    
    
    
    
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    Gui, WarningTip:Destroy
return