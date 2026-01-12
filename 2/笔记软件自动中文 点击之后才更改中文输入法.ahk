;#NoTrayIcon


#SingleInstance force
#NoEnv
#Persistent

#IfWinNotActive ahk_exe Obsidian.exe
SetTimer, PeriodClock0_0, 2
isEdit = 0 ; 一个可以用来做判断的编辑模式标志符号,方便你在其他热键触发的时候用
PeriodClock0_0:


/* 
if isEdit = 0
{
  ;ToolTip,非编辑模式, A_CursorX, A_CursorY - 20
}
if isEdit = 1
{
  ;ToolTip,编辑模式, A_CursorX, A_CursorY - 20
}
*/

;只要光标是箭头就切换输入法
			if A_Cursor = Arrow 
			{
				isEdit=0
				SwitchEnglish0_0()
				
			}


;按下左键后才切换的场景, 排除某些程序
GetKeyState, state, LButton, P  
if state = D
{
  if WinActive("ahk_exe Obsidian.exe") or WinActive("ahk_exe Firefox.exe") or WinActive("ahk_exe msedge.exe")
	{
		  if A_Cursor = Arrow 
			{
				isEdit=0
				SwitchEnglish0_0()
				
			}
			else
			{
				isEdit = 1
				SwitchChinese0_0()     ;
				
			}
		
	}
	else
	{
			if A_Cursor = Arrow 
			{
				isEdit=0
				SwitchEnglish0_0()
				
			}
			else
			{
				isEdit = 1
				;SwitchChinese0_0()     ;
				
			}
		
	}

}


; 只要输入光标存在,无论前面的鼠标操作如何,都会是编辑状态.  光标不存在并不代表不在输入,所以不处理.
if A_CaretX
{
  isEdit = 1

}
return















SwitchEnglish0_0()
{
  SetDefaultKeyboard(0x0409) ; English (USA)
}

SwitchChinese0_0()
{
	SetDefaultKeyboard(0x0804) ; swiss-german
}



SetDefaultKeyboard(LocaleID)
{
	global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	loop %windows%
	{
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
return

#If









