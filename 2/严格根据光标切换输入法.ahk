#SingleInstance force
#NoEnv
#Persistent

            ; 设置自动切换大写, 对其有效的程序群组, (正相关)
            ; GroupAdd, auto_capitalize_group, ahk_exe texstudio.exe
            ; GroupAdd, auto_capitalize_group, ahk_exe chrome.exe
            ; GroupAdd, auto_capitalize_group, ahk_class Framework::CFrame
            ; GroupAdd, auto_capitalize_group, ahk_class Notepad
            ; GroupAdd, auto_capitalize_group, ahk_class WeChatMainWndForPC
            ; GroupAdd, auto_capitalize_group, ahk_exe TIM.exe

            /*
            SwitchIME(dwLayout)  ;定义输入法dll接口和方法, 这是一个函数, 具体含义未知
            ;全局函数放哪里都一样, 因为循环体只是调用了程序中的该函数, 
            {
              HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
              ControlGetFocus,ctl,A
              SendMessage,0x50,0,HKL,%ctl%,A
            }
            */

SetTimer, auto_capitalize, 2000 ; check every 300 ms
            ;SetTimer, auto_capitalize, 300 ; check every 300 ms 25000
            /*
            效果是如果鼠标为指针, 每隔n/1000秒切换一次25miao
            短时间为测试使用
            定义了一个方法, 并设置方法循环间隔,
            增加负担的循环间隔也只对这个方法周期性生效
            理论上循环时间越长, 性能消耗越低
            没有用到Loop因为Loop的CPU消耗过高
            Loop在哪里开始睡眠也是个逻辑难题
            虽然我们并不解决逻辑问题
            只是清楚编程语言本身定义的方法属性和接口
            */
Return 

auto_capitalize: 

	If (A_Cursor = "Arrow")      ;如果鼠标指针为箭头状态
	{
		;sleep, 800
		;SwitchIME(0x04090409)    ;切换到英文(EN-US)0x4090409
		;SwitchIME(0x08040804)    ;切换到中文(EN-US)0x4090409
    SwitchEnglish0_0()

		sleep, 15000
		;return
	}



/*
   if (A_Cursor = "IBeam")

    {  
      SwitchChinese0_0()

    }
*/



SwitchEnglish0_0()
{
  SetDefaultKeyboard(0x0409) ; English (USA)
}

SwitchChinese0_0()
{
  SetDefaultKeyboard(0x0804) ; swiss-german
}



SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
return





/* 

SwitchIME(dwLayout)  ;定义输入法dll接口和方法, 这是一个函数, 具体含义未知
;函数放哪里都一样, 因为循环体只是调用了程序中的该函数, 
;函数也是全局的
{
	HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
	ControlGetFocus,ctl,A
	SendMessage,0x50,0,HKL,%ctl%,A
}

 */




/*
原版英文句首大写
#SingleInstance force
#NoEnv
#Persistent

; create a group of the programs in which you want auto-capitalize
GroupAdd, auto_capitalize_group, ahk_exe texstudio.exe
GroupAdd, auto_capitalize_group, ahk_exe chrome.exe
GroupAdd, auto_capitalize_group, ahk_class Framework::CFrame
GroupAdd, auto_capitalize_group, ahk_class Notepad
GroupAdd, auto_capitalize_group, ahk_class WeChatMainWndForPC
GroupAdd, auto_capitalize_group, ahk_exe TIM.exe


SetTimer, auto_capitalize, 300 ; check every 300 ms
Return 

auto_capitalize: 

If (IMELA_GET()=0x8040804)   ; 0x8040804 指代小狼毫中文输入键盘，如果想知道自己的键盘代号，见末尾代码（注释掉了）

return ; do nothing if it is Chinese input keyboard layout
; else:
If !WinActive("ahk_group auto_capitalize_group") 
    return  ; do nothing
; else:
{
Input key, I L1 M V,{Esc}{BS}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Tab}
StringUpper key, key
If InStr(ErrorLevel,"EndKey")
    state =
Else If InStr(".!?",key)
    state = 1
Else If InStr("`t `n",key) 
{
    If state = 1
    state = 2
} 
Else 
{
    If state = 2
        Send {BS}{%key%}
    state =
}

}

Return

Return


; function that detect which keyboard layout is being used
IMELA_GET(){
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID)
    ;~ MsgBox, %InputLocaleID%
return %InputLocaleID%
}

; 自定义右Shift键

RShift::
SendInput {RShift Down}
KeyWait, RShift
SendInput {RShift Up}
if ( A_PriorKey = "RShift" )
{
        If (IMELA_GET()=0x8040804)
        {
            SendInput, {LShift}
            Sleep, 100
            SendInput, #{Space}
            Return
        }
        Else
        {
            SendInput, #{Space}
            Return
        }
}
return

; F10::  ; F10 显示输入键盘，我电脑上 US keyboard layout 是 0x4090409
; SetFormat, Integer, H
; WinGet, WinID,, A
; ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
; InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID)
; MsgBox, %InputLocaleID%
; Return
*/