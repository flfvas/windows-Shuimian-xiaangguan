;#NoTrayIcon
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#Persistent 				; 保持脚本持续运行



SetTimer, HotCorners, 0 		; HotCorners是计时器的名称，将每0秒重置一次，直到进程被终止
return
HotCorners: 				; 时间器内容
CoordMode, Mouse, Screen		; 坐标模式-坐标将传递给鼠标相关的功能，坐标相对于整个屏幕

IsCorner(cornerID)
{
	WinGetPos, X, Y, Xmax, Ymax, Program Manager 		; get desktop size
	MouseGetPos, MouseX, MouseY 							; 函数 MouseGetPos 检索鼠标光标的当前位置
	T = 5 		;默认容差值
	;T = 20 		;容差值
  XM1:= Xmax*2/5       ;左侧线
  XM2:= Xmax*3/5       ;右侧线
  YM1:= Ymax*2/5       ;上侧线
  YM2:= Ymax*3/5       ;下侧线
  XH1:= Xmax*3/4        
                										; adjust tolerance value (pixels to corner) if desired
	CornerTopLeft := (MouseY < T and MouseX < T) 					; Boolean stores whether mouse cursor is in top left corner
	CornerTopRight := (MouseY < T and MouseX > Xmax - T) 			; Boolean stores whether mouse cursor is in top right corner
	CornerTopRightClose := (MouseY < 59 and MouseX > 3975) 			; Boolean stores whether mouse cursor is in top right corner
	CornerBottomLeft := (MouseY > Ymax - T and MouseX < T) 			; Boolean stores whether mouse cursor is in bottom left corner
	CornerBottomRight := (MouseY > Ymax - T and MouseX > Xmax - T) 	; Boolean stores whether mouse cursor is in top left corner
	CornerBottomMiddle := (MouseY > Ymax - T and MouseX > XM1 and MouseX < XM2)     ;底部中间
	;CornerBottomMiddle := (MouseY > Ymax - T and MouseX > XM1 and MouseX < XM2)     ;底部中间
	
	;CornerMiddleRight := (MouseY > YM1 and MouseY < YM2 and MouseX > Xmax - T)     ;
	;CornerHalfRight := (MouseX > XH1)                                              ;右侧
	CornerMiddle := (MouseY > YM1 and MouseY < YM2 and MouseX > XM1 and MouseX < XM2)        ;屏幕正中间
  ; Boolean stores whether mouse cursor is in top left corner
	
  
  
	if (cornerID = "TopLeft"){
		return CornerTopLeft
	}
	else if (cornerID = "TopRight"){
		return CornerTopRight
	}
	else if (cornerID = "TopRightClose"){
		return CornerTopRightClose
	}
	else if (cornerID = "BottomLeft"){
		return CornerBottomLeft
	}
	else if  (cornerID = "BottomRight") {
		return CornerBottomRight
	}
	; else if  (cornerID = "MiddleRight") {
		; return CornerMiddleRight
	; }
  else if  (cornerID = "BottomMiddle"){
		return CornerBottomMiddle
	}  
	; else if  (cornerID = "HalfRight"){
		; return CornerHalfRight
	; }
	else if  (cornerID = "Middle"){
		return CornerMiddle
	}
}


/*
HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}



HideShowTaskbar0_0() {
   static SW_HIDE := 0, SW_SHOWNA := 8, SPI_SETWORKAREA := 0x2F
   DetectHiddenWindows, On
   hTB := WinExist("ahk_class Shell_TrayWnd")
   WinGetPos,,,, H
   hBT := WinExist("ahk_class Button ahk_exe Explorer.EXE")  ; for Windows 7
   b := DllCall("IsWindowVisible", "Ptr", hTB)
   for k, v in [hTB, hBT]
      ( v && DllCall("ShowWindow", "Ptr", v, "Int", b ? SW_HIDE : SW_SHOWNA) )
   VarSetCapacity(RECT, 16, 0)
   NumPut(A_ScreenWidth, RECT, 8)
   NumPut(A_ScreenHeight - !b*H, RECT, 12, "UInt")
   DllCall("SystemParametersInfo", "UInt", SPI_SETWORKAREA, "UInt", 0, "Ptr", &RECT, "UInt", 0)
   WinGet, List, List
   Loop % List {
      WinGet, res, MinMax, % "ahk_id" . List%A_Index%
      if (res = 1)
         WinMove, % "ahk_id" . List%A_Index%,, 0, 0, A_ScreenWidth, A_ScreenHeight - !b*H
   }
}

*/

; Show Task View (Open Apps Overview)
if IsCorner("TopLeft") && WinActive("ahk_exe firefox.exe")	; && is logical-AND
{
	;Send, {LWin down}{tab down}
	;Send, {LWin up}{tab up} 
	Loop 
	{
		if ! IsCorner("TopLeft")
			break ; exits loop when mouse is no longer in the corner
	}
}


/*
if IsCorner("TopRight")
;if IsCorner("TopRight") && WinActive("ahk_exe Photoshop.exe")
{	
	;Send, ^+!{F3}
;Send, ^!z

	;Sleep 800
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("BottomLeft")
			break ; exits loop when mouse is no longer in the corner
	}	
}
*/


;if IsCorner("TopRight")&& WinActive("ahk_exe obsidian.exe")	; && is logical-AND
;{	
	;Send, ^+!{F4}
	;Send, {LWin up}
	;Loop
	;{
		;if ! IsCorner("BottomLeft")
			;break ; exits loop when mouse is no longer in the corner
	;}	
;}



if IsCorner("TopRightClose") && WinActive("ahk_exe files.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}


/*

if IsCorner("TopRightClose") && WinActive("ahk_exe publisher.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}


if IsCorner("TopRightClose") && WinActive("ahk_exe designer.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}




if IsCorner("TopRightClose") && WinActive("ahk_exe photo.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}


if IsCorner("TopRightClose") && WinActive("ahk_exe photoshop.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}


if IsCorner("TopRightClose") && WinActive("ahk_exe illustrator.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}


if IsCorner("TopRightClose") && WinActive("ahk_exe CorelDRW.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}




if IsCorner("TopRightClose") && WinActive("ahk_exe CLIPStudioPaint.exe")	; && is logical-AND
{	
	;Send, ^!z
	Send, ^!x
	;Send, {LWin up}
	Loop
	{
		if ! IsCorner("TopRightClose")
			break ; exits loop when mouse is no longer in the corner
	}	
}




*/





; Show 



; Press Windows 
if IsCorner("BottomLeft")
{	
	;Send, {LWin down}
	;Send, {LWin up}
	;Send, {Alt down}
	;SoundPlay, D:\标签库\声音文件\请输入程序名称.mp3
	;Soundbeep
	;Send, !{F12}
	
	;Send, {M up}
	;Send, {Alt up}
	;Sleep 1000
	Loop
	{
		if ! IsCorner("BottomLeft")
			break ; exits loop when mouse is no longer in the corner
	}	
}


/*

; Press Windows 
if IsCorner("BottomMiddle")
{	
	;Send, {LWin down}
	;Send, {LWin up}
	;Send, {Alt down}
	;SoundPlay, D:\标签库\声音文件\请输入程序名称.mp3
	;Soundbeep
	;Send, !{F12}
	;WinHide, ahk_class Shell_TrayWnd
	;WinShow, ahk_class Shell_TrayWnd
	;HideShowTaskbar0_0()
	;HideShowTaskbar(false)
	;Send,{MButton}
	;Send, {M up}
	;Send, {Alt up}
	;Sleep 1000
	Loop
	{
		if ! IsCorner("BottomMiddle")
			break ; exits loop when mouse is no longer in the corner
	}	
}


*/


; Press Windows 



/*
if IsCorner("Middle")
{	




	;Send, {LWin down}
	;Send, {LWin up}
	;Send, {Alt down}
	;SoundPlay, D:\标签库\声音文件\请输入程序名称.mp3
	;Soundbeep
	;Send, !{F12}
	;WinHide, ahk_class Shell_TrayWnd
 ; HideShowTaskbar0_0()
;HideShowTaskbar(true)
	;Sleep, 5000
	;Send, {M up}
	;Send, {Alt up}
	;Sleep 1000





	Loop
	{
		if ! IsCorner("Middle")
			break ; exits loop when mouse is no longer in the corner
	}	

}
*/












/*
; Press Windows 
if IsCorner("HalfRight")
{	
	;Send, {LWin down}
	;Send, {LWin up}
	;Send, {Alt down}
	;SoundPlay, D:\标签库\声音文件\请输入程序名称.mp3
	;Soundbeep
	;Send, !{F12}
	;WinHide, ahk_class Shell_TrayWnd
  HideShowTaskbar()
	;Send, {M up}
	;Send, {Alt up}
	;Sleep 1000
	Loop
	{
		if ! IsCorner("HalfRight")
			break ; exits loop when mouse is no longer in the corner
	}	
}
*/










if IsCorner("BottomRight")
{	
	;HideShowTaskbar()
	; SendMode Play   ;瞬间移动
	; MouseMove, 2726,1912  ;3000
	; ;MouseMove, 1781,1037     ;1920
	; Sleep 300
    ; Send, {LBUTTON}   ;此是第二处更改
	; ;Sleep 120
	; MouseMove, 1500,1000
	; ;Send, eeeeeeeeeeeeeeeee   ;此是第二处更改
	Loop
	{
		if ! IsCorner("BottomLeft")
			break ; exits loop when mouse is no longer in the corner
	}	
}

#If



#T::Pause