#SingleInstance, Force
#NoEnv

; --- 1. 设置托盘菜单 ---
Menu, Tray, NoStandard
Menu, Tray, Add, 显示转换器, ShowGui
Menu, Tray, Add, 退出程序, ExitScript  ; 添加退出选项
Menu, Tray, Default, 显示转换器
Menu, Tray, Click, 1

; --- 2. 构建界面 ---
Gui, +AlwaysOnTop
Gui, Add, Text,, 输入数值 (自动同步到剪切板):
Gui, Add, Edit, vUserValue w150 gCalculate, 5
Gui, Add, Text,, 选择单位:
Gui, Add, DropDownList, vUnit w150 gCalculate Choose2, 秒|分钟|小时
Gui, Add, Text,, ---
Gui, Add, Text, vResultDisplay w200, 结果: 300000 ms
Gui, Show,, 实时毫秒转换器

; 启动时立即计算一次
GoSub, Calculate
return

; --- 3. 核心计算与同步逻辑 ---
Calculate:
    Gui, Submit, NoHide
    if UserValue is not number
    {
        GuiControl,, ResultDisplay, 请输入有效数字...
        return
    }
    
    if (Unit = "秒")
        IdleLimit := UserValue * 1000
    else if (Unit = "分钟")
        IdleLimit := UserValue * 60000
    else if (Unit = "小时")
        IdleLimit := UserValue * 3600000
    
    IdleLimit := Round(IdleLimit)
    GuiControl,, ResultDisplay, 结果: %IdleLimit% ms
    Clipboard := IdleLimit
return

; --- 4. 窗口行为控制 ---

; 当点击最小化按钮时
GuiSize:
    if (A_EventInfo = 1)
        GoSub, HideGui
return

; 【关键修改】当点击关闭(X)按钮时，执行隐藏而不是退出
GuiClose:
HideGui:
    Gui, Hide
    TrayTip, 毫秒转换器, 脚本仍在运行`n单击托盘图标重新显示, 2
return

; 托盘点击后执行的操作
ShowGui:
    Gui, Show
return

; 真正的退出逻辑
ExitScript:
ExitApp