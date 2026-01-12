/* #NoTrayIcon


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

;下面需要判断两种情况, 一种是在工字型的时候是否单击
;一种是在非工字型的时候'
;GetKeyState, state, LButton, P  
; 获取当前左键的状态,  LButton为内置变量,P表示press的状态
; 当左键按下后, 输入法才开始切换, 
; 输入前, 必定会按下鼠标左键
; 打字的时候遗失光标, 也可以流畅输入中文
; 但是不输入的时候, 你不一定会按下鼠标左键
; 不输入的时候, 我是不会按下, 
; 但是中文切换的机会很少, 
; 只要有点击, 肯定会切英文
; 把按键判定去掉
; 只要不是输入状态, 管你点击不点击, 统统给你切英文
; 输入状态下, 你没法使用快捷键, 即便此时是英文键盘, 因为会直接输入字母的
; 只有光标是箭头的情况, 快捷键才有效
; 这个脚本的意思好像是在说: 点击一下鼠标左键, 切换输入法
; 你想不点就执行命令, 此时还在输入状态, 
; 所以不点就切换的, 根本不切实际, 哪怕光标已经变成箭头, 移动到窗口外, 然后依然会打出字母, 命令依旧得不到执行



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









 */