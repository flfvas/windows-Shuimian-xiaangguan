;#NoTrayIcon



SetTitleMatchMode, 2 
GroupAdd, 0o0design, ahk_exe photoshop.exe
GroupAdd, 0o0design, ahk_exe Illustrator.exe
GroupAdd, 0o0design, ahk_exe premiere.exe
;GroupAdd, 0o0design, ahk_exe designer.exe
;GroupAdd, 0o0design, ahk_exe photo.exe
return
#IfWinActive ahk_group 0o0design






;#IfWinActive, Photoshop
;~*$#E::



F6::
;將Youtube影片播放速度設為(x2)
;Send, {esc}
;Sleep % 250 
Send, {Enter}
SwitchEnglish0_0()
Sleep, 300
Send, v
return



F7::
;將Youtube影片播放速度設為(x2)
;Send, {esc}
;Sleep % 250 
Send, {Enter}
SwitchEnglish0_0()
Sleep, 300
Send, h
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



