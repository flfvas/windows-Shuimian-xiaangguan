#SingleInstance, Force
#NoEnv

; 预设初始值
DefaultValue := 5
DefaultUnit := "分钟"

; 1. 构建界面
Gui, +AlwaysOnTop
Gui, Add, Text,, 输入数值 (自动同步到剪切板):
; gCalculate 表示每次输入内容变化都会触发 Calculate 标签
Gui, Add, Edit, vUserValue w150 gCalculate, %DefaultValue%
Gui, Add, Text,, 选择单位:
; gCalculate 表示每次切换单位都会触发 Calculate 标签
Gui, Add, DropDownList, vUnit w150 gCalculate Choose2, 秒|分钟|小时
Gui, Add, Text,, ---
Gui, Add, Text, vResultDisplay w200, 结果: 300000 ms
Gui, Show,, 实时毫秒转换器

; 2. 脚本启动时立即执行一次计算和复制
GoSub, Calculate
return

; ----------------------------------------------------------------
; 核心逻辑：计算并实时同步剪切板
; ----------------------------------------------------------------
Calculate:
    Gui, Submit, NoHide
    
    ; 检查输入是否为有效数字（支持小数）
    if UserValue is not number
    {
        GuiControl,, ResultDisplay, 请输入有效数字...
        return
    }

    ; 单位换算逻辑
    if (Unit = "秒")
        IdleLimit := UserValue * 1000
    else if (Unit = "分钟")
        IdleLimit := UserValue * 60000
    else if (Unit = "小时")
        IdleLimit := UserValue * 3600000
    
    ; 取整处理（防止出现 .000000）
    IdleLimit := Round(IdleLimit)

    ; 更新界面显示
    GuiControl,, ResultDisplay, 结果: %IdleLimit% ms
    
    ; --- 关键步骤：实时同步到剪切板 ---
    Clipboard := IdleLimit
    
    ; 可选：如果你想在屏幕上看到一个微小的提示（类似热键提示），可以取消下面两行的注释
    ; ToolTip, 已同步: %IdleLimit%
    ; SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
    ToolTip
return

GuiClose:
ExitApp