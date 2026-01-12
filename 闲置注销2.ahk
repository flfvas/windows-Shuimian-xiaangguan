#Persistent ; 持续运行脚本
#NoEnv ; 不检查空变量为环境变量
;SetTimer, CheckIdle, 30000 ; 每30秒检查一次状态
SetTimer, CheckIdle, 30000 ; 每30秒检查一次状态
return

CheckIdle:
    ; 9分钟 = 9 * 6    0 * 1   000 = 54  0000 毫秒  8分钟
    ;Yifen := 60 * 1000
    
    ;IdleLimit := 9 * Yifen 
    IdleLimit := 300000
    
    
    /*
    ; 第一步：计算 a
    a := 3 * 2

    ; 第二步：计算 b (此时 a 已经是 6 了)
    b := 3 * a

    ; 验证结果
    MsgBox, % "a 的值是: " . a . "`nb 的值是: " . b
    */
    

    if (A_TimeIdle > IdleLimit)
    {
        ; 记录日志或在调试时显示（可选）
        ; MsgBox, 0, 系统提示, 由于长时间无操作，系统即将注销。, 5

        ; 执行强制注销命令
        ; 参数 4 代表 0 (注销) + 4 (强制关闭应用程序)
        ;Shutdown, 4
        
        
        /*
        1. AHK 强制注销的最稳代码
        如果 Shutdown, 4 
        在某些系统环境下被第三方软件拦截，
        你可以改用直接调用系统 DLL 的方式，
        这种方式权限更高： 
        ; 5分钟无操作执行：
        ; 强制注销所有用户会话 (EWX_LOGOFF = 0, EWX_FORCE = 4)
        */
        DllCall("ExitWindowsEx", "UInt", 4, "UInt", 0)
        
        /*
        ; 假设这是你的 5 分钟触发逻辑
        ; 1. 关显示器 (省电)
        SendMessage, 0x112, 0xF170, 2,, Program Manager

        ; 2. 强制关闭虚拟机 (针对 Hyper-V, 减少 SSD 写入的关键)
        Run, powershell.exe -Command "Stop-VM -Name '*' -Save", , Hide

        ; 3. 强制注销 (清空 8GB 内存中的用户数据)
        Shutdown, 4
        */
        
        
        
    }
return