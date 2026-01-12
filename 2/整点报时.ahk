#SingleInstance force
#NoEnv
#Persistent
#NoTrayIcon

;#IfWinNotActive ahk_exe Obsidian.exe
SetTimer, PeriodClock20_0, 900000
isEdit = 0 ; 一个可以用来做判断的编辑模式标志符号,方便你在其他热键触发的时候用
PeriodClock20_0:


; get time
FormatTime, currentHour, %A_Now%, H
FormatTime, currentMinute, %A_Now%, m
FormatTime, currentSecond, %A_Now%, s
; pad with zeros
If currentHour != 0
	pad(currentHour)
pad(currentMinute)
pad(currentSecond)
; announce time
currentTime = %currentHour% 点 %currentMinute%
;timeString = time is %currentTime%
timeString = 现在时间 %currentTime%
say(timeString)
Return

; announce time (using a temporary VBS script)
say(string)
{
	tempFile = %A_TEMP%\TimeAnnounce.vbs
	FileAppend,
		( LTRim
			Dim voic
			Set voic = WScript.CreateObject("SAPI.SpVoice")
			Set voic.voice = voic.GetVoices("", "Language=809").Item(0)
			voic.Speak("%string%")
			Set voic = nothing
		), %tempFile%
	RunWait, WSCRIPT.EXE "%tempFile%",,, WSCRIPT_PID
	FileDelete, %tempFile%
}

; pad with zeros
pad(ByRef var)
{
	If var < 1
		var = hundred
	Else If var < 10
		var = o %var%
}