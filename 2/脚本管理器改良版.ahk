    global Hznconfig:="Hznconfig.ini" ;~;配置文件
    Plugins_Gui:
        Critical ;防止短时间内打开多次界面出现问题
        Gosub,Plugins_Read
        global ColumnName:=1
        global ColumnStatus:=2
        global ColumnAutoRun:=3
        global ColumnContent:=5
        global PluginsImageListID:=IL_Create(6)
        Plugins_LV_Icon_Set(PluginsImageListID)
        Gui,PluginsManage:Destroy
        Gui,PluginsManage:Default
        Gui,PluginsManage:+Resize
        Gui,PluginsManage:Font, s10, Microsoft YaHei
        Gui,PluginsManage:Add, Listview, xm w730 r13 grid AltSubmit Checked vRunAnyPluginsLV1 hwndPLLV1 gPluginsListView1
        , 适用软件|运行状态|自动启动|描述
        GuiControl,PluginsManage: -Redraw, RunAnyPluginsLV1
        LV_SetImageList(PluginsImageListID)
        NPLLV1 := New ListView(PLLV1)
        NPLLV_Index:=0
        For runn, runv in PluginsObjList
        {
            SplitPath,runn,,,,pname_no_ext
            if(!PluginsListViewSwap){
                if(PluginsObjRegGUID[pname_no_ext] || pname_no_ext="RunAny_Menu" || pname_no_ext="RunAny_ObjReg")
                    Continue
            }else if(!PluginsObjRegGUID[pname_no_ext] && pname_no_ext!="RunAny_Menu" && pname_no_ext!="RunAny_ObjReg"){
                Continue
            }
            NPLLV_Index++
            runStatus:=rule_check_is_run(PluginsPathList[runn]) ? "启动" : ""
            pluginsConfig:=runv ? "自启" : ""
            if(!PluginsPathList[runn])
                pluginsConfig:="未找到"
            pluginsConfigChenk:=pluginsConfig="自启" ? "Check" : ""
            LV_Add(LVPluginsSetIcon(PluginsImageListID,runn) " " pluginsConfigChenk, runn, runStatus, pluginsConfig, PluginsNameList[runn], PluginsHelpList[runn])
            if(pluginsConfig!="自启" && !runStatus)
                NPLLV1.Color(NPLLV_Index,0x999999)
        }
        LV_ModifyCol(ColumnStatus, "SortDesc") ; 排序
        LVModifyCol(65,ColumnStatus,ColumnAutoRun)
        GuiControl,PluginsManage: +Redraw, RunAnyPluginsLV1
        LVMenu("ahkGuiMenu")
        Gui,PluginsManage: Menu, ahkGuiMenu
        Gui,PluginsManage:Show, , hzn_工具箱
        Critical,Off
    return
    LVMenu(addMenu){
        flag:=addMenu="ahkGuiMenu" ? true : false
        Menu, %addMenu%, Add,% flag ? "启动" : "启动`tF1", LVPluginsRun
        try Menu, %addMenu%, Icon,% flag ? "启动" : "启动`tF1", %A_AhkPath%,2
        Menu, %addMenu%, Add,% flag ? "编辑" : "编辑`tF2", LVPluginsEdit
        Menu, %addMenu%, Icon,% flag ? "编辑" : "编辑`tF2", SHELL32.dll,134
        Menu, %addMenu%, Add,% flag ? "自启" : "自启`tF3", LVPluginsEnable
        Menu, %addMenu%, Icon,% flag ? "自启" : "自启`tF3", SHELL32.dll,166
        Menu, %addMenu%, Add,% flag ? "关闭" : "关闭`tF4", LVPluginsClose
        Menu, %addMenu%, Icon,% flag ? "关闭" : "关闭`tF4", SHELL32.dll,28
        Menu, %addMenu%, Add,% flag ? "挂起" : "挂起`tF5", LVPluginsSuspend
        try Menu, %addMenu%, Icon,% flag ? "挂起" : "挂起`tF5", %A_AhkPath%,3
        Menu, %addMenu%, Add,% flag ? "暂停" : "暂停`tF6", LVPluginsPause
        try Menu, %addMenu%, Icon,% flag ? "暂停" : "暂停`tF6", %A_AhkPath%,4
        Menu, %addMenu%, Add,% flag ? "移除" : "移除`tF7", LVPluginsDel
        Menu, %addMenu%, Icon,% flag ? "移除" : "移除`tF7", SHELL32.dll,132
        Menu, %addMenu%, Add,重启, LVPluginsReload
        Menu, %addMenu%, Add,最近行, LVPlugins最近行
        Menu, %addMenu%, Add,热键, LVPlugins热键
        Menu, %addMenu%, Add,变量, LVPlugins变量
        Menu, %addMenu%, Add,按键历史, LVPlugins按键历史
    }
    LVPluginsRun:
        menuItem:="启动"
        Gosub,LVApply
    return
    LVPluginsEdit:
        menuItem:="编辑"
        Gosub,LVApply
    return
    LVPluginsEnable:
        menuItem:="自启"
        Gosub,LVApply
    return
    LVPluginsClose:
        menuItem:="关闭"
        Gosub,LVApply
    return
    LVPluginsSuspend:
        menuItem:="挂起"
        Gosub,LVApply
    return
    LVPluginsPause:
        menuItem:="暂停"
        Gosub,LVApply
    return
    LVPluginsDel:
        menuItem:="移除"
        Gosub,LVApply
    return
    LVPluginsReload:
        menuItem:="重启"
        Gosub,LVApply
    return
    LVPlugins最近行:
        menuItem:="最近行"
        Gosub,LVApply
    return
    LVPlugins变量:
        menuItem:="变量"
        Gosub,LVApply
    return
    LVPlugins热键:
        menuItem:="热键"
        Gosub,LVApply
    return
    LVPlugins按键历史:
        menuItem:="按键历史"
        Gosub,LVApply
    return
    LVApply:
        Gui,PluginsManage:Default
        GuiControlGet, focusGuiName, FocusV
        if(focusGuiName="RunAnyPluginsLV1"){
            Gui, ListView, RunAnyPluginsLV1
        }
        DetectHiddenWindows,On ;~显示隐藏窗口
        Row:=LV_GetNext(0, "F")
        RowNumber:=0
        if(Row && menuItem="移除"){
            MsgBox,35,确认移除？(Esc取消),确定移除选中的插件配置？(不会删除文件)
            DelRowList:=""
        }
        Loop
        {
            RowNumber := LV_GetNext(RowNumber) ; 在前一次找到的位置后继续搜索.
            if not RowNumber ; 上面返回零, 所以选择的行已经都找到了.
                break
            LV_GetText(FileName, RowNumber, ColumnName)
            LV_GetText(FileStatus, RowNumber, ColumnStatus)
            LV_GetText(FileAutoRun, RowNumber, ColumnAutoRun)
            FilePath:=PluginsPathList[FileName]
            if(menuItem="启动"){
                runValue:=RegExReplace(FilePath,"iS)(.*?\.exe)($| .*)","$1")	;去掉参数
                try {
                    SplitPath, runValue, name, dir, ext ; 获取扩展名
                    if(dir && FileExist(dir)){
                        SetWorkingDir,%dir%
                    }
                    if(A_AhkPath && ext="ahk"){
                        Run,%A_AhkPath%%A_Space%"%FilePath%"
                    }else{
                        Run,%FilePath%
                    }
                    LV_Modify(RowNumber, "", , "启动")
                } finally {
                    SetWorkingDir,%A_ScriptDir%
                }
            }else if(menuItem="编辑"){
                Plugins_Edit(FilePath)
            }else if(menuItem="挂起"){
                PostMessage, 0x111, 65404,,, %FilePath% ahk_class AutoHotkey
                LVStatusChange(PluginsImageListID,RowNumber,FileStatus,"挂起",FileName)
            }else if(menuItem="暂停"){
                PostMessage, 0x111, 65403,,, %FilePath% ahk_class AutoHotkey
                LVStatusChange(PluginsImageListID,RowNumber,FileStatus,"暂停",FileName)
            }else if(menuItem="关闭"){
                runValue:=RegExReplace(FilePath,"iS)(.*?\.exe)($| .*)","$1")	;去掉参数
                SplitPath, runValue, name,, ext ; 获取扩展名
                if(ext="ahk"){
                    PostMessage, 0x111, 65405,,, %FilePath% ahk_class AutoHotkey
                    runStatus:=""
                }else if(name){
                    Process,Close,%name%
                    if ErrorLevel
                        runStatus:=""
                }
                LV_Modify(RowNumber, "", , runStatus)
            }else if(menuItem="自启"){
                if(FileAutoRun!="未找到" && FileAutoRun!="自启"){
                    IniWrite,1,%Hznconfig%,Plugins,%FileName%
                    LV_Modify(RowNumber, "", , ,"自启")
                }else if(FileAutoRun="自启"){
                    IniWrite,0,%Hznconfig%,Plugins,%FileName%
                    LV_Modify(RowNumber, "", , ,"禁用")
                }
            }else if(menuItem="移除"){
                IfMsgBox Yes
                {
                    DelRowList := RowNumber . ":" . DelRowList
                    IniDelete,%Hznconfig%,Plugins,%FileName% ;删除插件管理数据
                    SplitPath,FileName,,,,o_name_no_ext
                    IniDelete,%RunAny_ObjReg_Path%,objreg,%o_name_no_ext% ;删除插件注册数据
                }
            }else if(menuItem="重启"){
                 PostMessage, 0x111, 65303,,, %FilePath% ahk_class AutoHotkey
            }else if(menuItem="最近行"){
                PostMessage, 0x111, 65406,,, %FilePath% ahk_class AutoHotkey
            }else if(menuItem="变量"){
                PostMessage, 0x111, 65407,,, %FilePath% ahk_class AutoHotkey
            }else if(menuItem="热键"){
                PostMessage, 0x111, 65408,,, %FilePath% ahk_class AutoHotkey
            }else if(menuItem="按键历史"){
                PostMessage, 0x111, 65409,,, %FilePath% ahk_class AutoHotkey
            }
        }
        if(menuItem="移除"){
            IfMsgBox Yes
            {
                stringtrimright, DelRowList, DelRowList, 1
                loop, parse, DelRowList, :
                    LV_Delete(A_loopfield)
                }
            }
            DetectHiddenWindows,Off
            return
            ;[插件脚本编辑操作]
            Plugins_Edit(FilePath){
                try{
                    if(Trim(PluginsEditor," `t`r`n")!=""){
                        Run,% Get_Obj_Path_Transform(PluginsEditor) A_Space """" FilePath """"
                    }else{
                        PostMessage, 0x111, 65401,,, %FilePath% ahk_class AutoHotkey
                    }
                }catch{
                    try{
                        RegRead, AhkSetup, HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AutoHotkeyScript
                        if(AhkSetup){
                            Run,edit "%FilePath%"
                        }else{
                            Run,notepad.exe "%FilePath%"
                        }
                    }catch{
                        Run,notepad.exe "%FilePath%"
                    }
                }
            }
            #If WinActive(hzn_全局按键管理器)
                F1::Gosub,LVPluginsRun
            F2::Gosub,LVPluginsEdit
            F3::Gosub,LVPluginsEnable
            F4::Gosub,LVPluginsClose
            F5::Gosub,LVPluginsSuspend
            F6::Gosub,LVPluginsPause
            F7::Gosub,LVPluginsDel
            #If
                PluginsListView1:
            PluginsListView2:
                LV_Num:=A_ThisLabel="PluginsListView1" ? 1 : 2
                if A_GuiEvent = DoubleClick
                {
                    menuItem:="启动"
                    Gosub,LVApply
                }else if(A_GuiEvent = "I"){
                    Gui,ListView,% PLLV%LV_Num%
                    LV_GetText(FileName, A_EventInfo, 1)
                    LV_GetText(FileAutoRun, A_EventInfo, 3)
                    if(errorlevel == "c" && FileAutoRun="自启"){
                        IniWrite,0,%Hznconfig%,Plugins,%FileName%
                        NPLLV%LV_Num%.Color(A_EventInfo,0x999999)
                        LV_Modify(A_EventInfo, "", , ,"禁用")
                    }else if(errorlevel == "C" && FileAutoRun="禁用"){
                        IniWrite,1,%Hznconfig%,Plugins,%FileName%
                        NPLLV%LV_Num%.Color(A_EventInfo,0x000000)
                        LV_Modify(A_EventInfo, "", , ,"自启")
                    }
                }
            return
            ;[加载插件脚本图标]
            Plugins_LV_Icon_Set(PluginsImageListID){
                IL_Add(PluginsImageListID, A_AhkPath, 1)
                IL_Add(PluginsImageListID, A_AhkPath, 2)
                IL_Add(PluginsImageListID, A_AhkPath, 3)
                IL_Add(PluginsImageListID, A_AhkPath, 4)
                IL_Add(PluginsImageListID, A_AhkPath, 5)
                IL_Add(PluginsImageListID, FuncIconS[1], FuncIconS[2])
            }
            LVPluginsSetIcon(PluginsImageListID,pname){
                if(PluginsIconList[pname]){
                    FileIconS:=StrSplit(Get_Transform_Val(PluginsIconList[pname]),",")
                    addNum:=IL_Add(PluginsImageListID, FileIconS[1], FileIconS[2])
                    return "Icon" addNum
                }
                SplitPath,pname,,,,pname_no_ext
                if(PluginsObjRegGUID[pname_no_ext]){
                    return "Icon6"
                }
            return "Icon2"
        }
        ;[判断脚本当前状态]
        LVStatusChange(PluginsImageListID,RowNumber,FileStatus,lvItem,FileName){
            item:=lvItem
            if(FileStatus="挂起" && lvItem="暂停"){
                LV_Modify(RowNumber, "Icon5", ,"挂起暂停")
                LV_ModifyCol()
            return
        }else if(FileStatus="暂停" && lvItem="挂起"){
            LV_Modify(RowNumber, "Icon5", ,"暂停挂起")
            LV_ModifyCol()
            return
        }else if(FileStatus!="启动"){
            StringReplace, lvItem, FileStatus, %item%
        }
        if(lvItem="")
            lvItem:="启动"
        if(lvItem="启动"){
            LV_Modify(RowNumber, LVPluginsSetIcon(PluginsImageListID,FileName), ,lvItem)
        }else if(lvItem="挂起"){
            LV_Modify(RowNumber, "Icon3", ,lvItem)
        }else if(lvItem="暂停"){
            LV_Modify(RowNumber, "Icon4", ,lvItem)
        }
        LV_ModifyCol()
    }
    ;══════════════════════════════════════════════════════════════════
    rule_check_is_run(runNamePath){
        DetectHiddenWindows,On
        result:=false
        runValue:=RegExReplace(runNamePath,"iS)(.*?\.exe)($| .*)","$1")	;去掉参数
        SplitPath, runValue, name,, ext ; 获取扩展名
        if(ext="ahk"){
            if(InStr(runNamePath,"..\")=1){
                runNamePath:=IsFunc("funcPath2AbsoluteZz") ? Func("funcPath2AbsoluteZz").Call(runNamePath,A_ScriptFullPath) : runNamePath
            }
            if WinExist(runNamePath " ahk_class AutoHotkey")
            {
                result:=true
            }
        }else if(name){
            Process,Exist,%name%
            if ErrorLevel
                result:=true
        }
        DetectHiddenWindows,Off
        return result
    }
    LVModifyCol(width, colList*){
        LV_ModifyCol() ; 根据内容自动调整每列的大小.
        for index,col in colList
        {
            LV_ModifyCol(col, width)
            LV_ModifyCol(col, "center")
        }
    }
    ;[获取变量转换后的应用路径]
    Get_Obj_Path_Transform(z_item){
        if(z_item="")
            return z_item
        itemPath:=Get_Transform_Val(z_item) ; 变量转换
        objPathItem:=Get_Obj_Path(itemPath) ; 自动添加完整路径
        if(objPathItem && itemPath!=objPathItem){
            appParm:=RegExReplace(itemPath,"iS).*?\.exe($| .*)","$1")	;去掉应用名，取参数
            itemPath:=objPathItem
            if(appParm!=""){
                itemPath:=objPathItem . appParm
            }
        }
        return itemPath
    }
    Get_Transform_Val(string){
        try{
            For mVarName, mVarVal in MenuVarIniList
            {
                if(InStr(string,"%" mVarName "%"))
                    string:=StrReplace(string, "%" mVarName "%", mVarVal)
            }
            spo := 1
            out := ""
            while (fpo:=RegexMatch(string, "(%(.*?)%)|``(.)", m, spo))
            {
                out .= SubStr(string, spo, fpo-spo)
                spo := fpo + StrLen(m)
                if (m1)
                    out .= %m2%
                else switch (m3)
                {
                    ;此处报错请升级Autohotkey到v1.1.31以上版本
                    case "a": out .= "`a"
                    case "b": out .= "`b"
                    case "f": out .= "`f"
                    case "n": out .= "`n"
                    case "r": out .= "`r"
                    case "t": out .= "`t"
                    case "v": out .= "`v"
                    default: out .= m3
                }
            }
            return out SubStr(string, spo)
        }catch{
            return string
        }
    }
    Get_Obj_Path(z_item){
        obj_path:=""
        if(InStr(z_item,"|")){
            menuDiy:=StrSplit(z_item,"|",,2)
            obj_path:=MenuObj[menuDiy[1]]
        }else{
            z_item:=RegExReplace(z_item,"iS)(.*?\.[a-zA-Z0-9-_]+)($| .*)","$1")	;去掉参数，取路径
            if(RegExMatch(z_item,"iS)^(\\\\|.:\\).*?\.exe$")){
                obj_path:=z_item
            }else{
                appName:=RegExReplace(z_item,"iS)\.exe$")
                obj_path:=MenuObj[appName]="" ? z_item : MenuObj[appName]
            }
        }
        if(RegExMatch(obj_path,"iS).*?\.[a-zA-Z0-9-_]+($| .*)")){
            obj_path:=RegExReplace(obj_path,"iS)(\.[a-zA-Z0-9-_]+)($| .*)","$1")
        }
        if(obj_path!="" && !InStr(obj_path,"\")){
            if(FileExist(A_WinDir "\" obj_path))
                obj_path=%A_WinDir%\%obj_path%
            if(FileExist(A_WinDir "\system32\" obj_path))
                obj_path=%A_WinDir%\system32\%obj_path%
            return obj_path
        }else if(!InStr(obj_path,"..\")){
            return obj_path
        }else{
            val:=RegExReplace(obj_path,"\.\.\\.*?$")
            aPath:=StrReplace(obj_path,val)
            absolute:=funcPath2AbsoluteZz(aPath,val)
            return absolute ? absolute : obj_path
        }
    }
    funcPath2AbsoluteZz(aPath,ahkPath){
        SplitPath, aPath, fname, fdir, fext, , fdrive
        SplitPath, ahkPath, name, dir, ext, , drive
        if(!aPath || !ahkPath)
            return -1
        ;下级目录直接加上参照目录路径
        if(!fdrive && !InStr(aPath,"..")){
            return dir . "\" . aPath
        }
        pathList:=StrSplit(dir,"\")
        ;上级目录根据层级递进添加多级路径
        if(InStr(aPath,"..\")=1){
            aPathStr:=RegExReplace(aPath, "\.\.\\", , PointCount)
            pathStr:=""
            ;每次向上递进，找到添加与启动项相匹配路径段
            Loop,% pathList.MaxIndex()-PointCount
            {
                pathStr.=pathList[A_Index] . "\"
            }
            filePath:=pathStr . aPathStr
            return filePath
        }
        return false
    }
    Plugins_Read:
        global PluginsObjList:=Object(),PluginsPathList:=Object(),PluginsRelativePathList:=Object(),PluginsNameList:=Object(),pluginsDownList:=Object()
        global PluginsVersionList:=Object(),PluginsIconList:=Object(),PluginsContentList:=Object()
        global PluginsObjNum:=0
        global PluginsDirList:=[]
        global PluginsEditor:=Var_Read("PluginsEditor")
        global PluginsDirPath:=Var_Read("PluginsDirPath")
        global PluginsListViewSwap:=Var_Read("PluginsListViewSwap",0)
        global PluginsDirPathList:="%A_ScriptDir%\%PluginsDir%|" PluginsDirPath
        Loop, parse, PluginsDirPathList, |
        {
            PluginsFolder:=Get_Transform_Val(A_LoopField)
            PluginsFolder:=RegExReplace(PluginsFolder,"(.*)\\$","$1")
            if(!FileExist(PluginsFolder))
                continue
            PluginsDirList.Push(PluginsFolder)
            Loop,%PluginsFolder%\*.ahk,0	;Plugins目录下AHK脚本
            {
                PluginsObjList[(A_LoopFileName)]:=0
                PluginsPathList[(A_LoopFileName)]:=A_LoopFileFullPath
                PluginsRelativePathList[(A_LoopFileName)]:=StrReplace(A_LoopFileFullPath,A_ScriptDir "\")
                PluginsNameList[(A_LoopFileName)]:=Plugins_Read_Name(A_LoopFileFullPath)
                PluginsVersionList[(A_LoopFileName)]:=Plugins_Read_Version(A_LoopFileFullPath)
                PluginsIconList[(A_LoopFileName)]:=Plugins_Read_Icon(A_LoopFileFullPath)
                if(A_LoopField="%A_ScriptDir%\%PluginsDir%"){
                    FileRead,pluginsContent,%A_LoopFileFullPath%
                    PluginsContentList[(A_LoopFileName)]:=pluginsContent
                }
            }
            Loop,%PluginsFolder%\*.*,2	;Plugins目录下文件夹内同名AHK脚本
            {
                IfExist,%A_LoopFileFullPath%\%A_LoopFileName%.ahk
                {
                    PluginsObjList[(A_LoopFileName . ".ahk")]:=0
                    PluginsPathList[(A_LoopFileName . ".ahk")]:=A_LoopFileFullPath "\" A_LoopFileName ".ahk"
                    PluginsRelativePathList[(A_LoopFileName . ".ahk")]:=StrReplace(A_LoopFileFullPath "\" A_LoopFileName ".ahk",A_ScriptDir "\")
                    PluginsNameList[(A_LoopFileName . ".ahk")]:=Plugins_Read_Name(A_LoopFileFullPath "\" A_LoopFileName ".ahk")
                    PluginsVersionList[(A_LoopFileName . ".ahk")]:=Plugins_Read_Version(A_LoopFileFullPath "\" A_LoopFileName ".ahk")
                    PluginsIconList[(A_LoopFileName . ".ahk")]:=Plugins_Read_Icon(A_LoopFileFullPath "\" A_LoopFileName ".ahk")
                    if(A_LoopField="%A_ScriptDir%\%PluginsDir%"){
                        FileRead,pluginsContent,% A_LoopFileFullPath "\" A_LoopFileName ".ahk"
                        PluginsContentList[(A_LoopFileName . ".ahk")]:=pluginsContent
                    }
                }
            }
        }
        IniRead,pluginsVar,%Hznconfig%,Plugins
        Loop, parse, pluginsVar, `n, `r
        {
            varList:=StrSplit(A_LoopField,"=",,2)
            SplitPath,% varList[1], name,, ext, name_no_ext
            PluginsObjList[(varList[1])]:=varList[2]
            if(varList[2])
                PluginsObjNum++
            Loop,% PluginsDirList.MaxIndex()
            {
                if(FileExist(PluginsDirList[A_Index] "\" varList[1]))
                    PluginsPathList[(varList[1])]:=PluginsDirList[A_Index] "\" varList[1]
                if(FileExist(PluginsDirList[A_Index] "\" name_no_ext "\" varList[1]))
                    PluginsPathList[(varList[1])]:=PluginsDirList[A_Index] "\" name_no_ext "\" varList[1]
            }
        }
    return
    Var_Read(rValue,defVar=""){
        IniRead, regVar,%Hznconfig%, Config, %rValue%,% defVar ? defVar : A_Space
        if(regVar!=""){
            if(defVar!="" && regVar=defVar){
                IniDelete, %Hznconfig%, Config, %rValue%
            }
            if(InStr(regVar,"ZzIcon.dll") && !FileExist(A_ScriptDir "\ZzIcon.dll"))
                return defVar
            else
                return regVar
        }else{
            IniDelete, %Hznconfig%, Config, %rValue%
            return defVar
        }
    }
    Plugins_Read_Name(filePath){
        returnStr:=""
        strRegOld:="iS).*?【(.*?)】.*"
    strRegNew=iS)^\t*\s*global RunAny_Plugins_Name:="(.+?)"
    Loop, read, %filePath%
    {
        if(RegExMatch(A_LoopReadLine,strRegNew)){
            returnStr:=RegExReplace(A_LoopReadLine,strRegNew,"$1")
            break
        }else if(RegExMatch(A_LoopReadLine,strRegOld)){
            returnStr:=RegExReplace(A_LoopReadLine,strRegOld,"$1")
            break
        }
    }
    return returnStr
    }
    Plugins_Read_Version(filePath){
        returnStr:=""
    strReg=iS)^\t*\s*global RunAny_Plugins_Version:="([\d\.]*)"
    Loop, read, %filePath%
    {
        if(RegExMatch(A_LoopReadLine,strReg)){
            returnStr:=RegExReplace(A_LoopReadLine,strReg,"$1")
            break
        }
    }
    return returnStr
    }
    Plugins_Read_Icon(filePath){
        returnStr:=""
    strReg=iS)^\t*\s*global RunAny_Plugins_Icon:="(.+?)"
    Loop, read, %filePath%
    {
        if(RegExMatch(A_LoopReadLine,strReg)){
            returnStr:=RegExReplace(A_LoopReadLine,strReg,"$1")
            break
        }
    }
    if(returnStr=""){
        PluginsFile:=RegExReplace(filePath,"iS)\.ahk$")
        Loop, Parse,% IconFileSuffix "*.exe;", `;
        {
            suffix:=StrReplace(A_LoopField, "*")
            if(FileExist(PluginsFile suffix)){
                return PluginsFile suffix ",1"
            }
        }
    }
    return returnStr
    }