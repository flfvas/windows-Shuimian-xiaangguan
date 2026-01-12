;請確保下段程式碼在腳本最頂部
;SetTitleMatchMode, 2
;=====================

; B3  122	a	d	15.77	Media_Play_Pause	D:\Users\Desktop\功能键改键.ahk - AutoHotkey v1.1.33.09
; B3  122	a	u	0.16	Media_Play_Pause	Volume_Mute   
 	
; AE  12E	a	d	0.19	Volume_Down    	
; AE  12E	a	u	0.20	Volume_Down    	

; AF  130	a	d	0.16	Volume_Up      	
; AF  130	a	u	0.22	Volume_Up

; AD  120	a	d	0.26	Volume_Mute    	

; AD  120	a	u	0.19	      	
; 74  03F	 	d	3.30	F5  

; A5  138	 	u	0.09	RAlt           	
; 5D  15D	 	d	0.74	AppsKey        	
; 5D  15D	 	u	0.19	AppsKey  
;按键1的多重判定
;功能键改成长按触发
;zhengshiban


/*
*$F7::
Send,{PrtScr}
return
;*$F8::
;Send,{Home}
;return
;*$F9::
;Send,{End}
;return
*$F10::
Send,{PgUp}
return
*$F11::
Send,{PgDn}
return
*$F12::
Send,{Ins}
return
*/




; ;#IfWinActive, YouTube
; *$F7::
; ;*$SC122::
; ;將Youtube影片播放速度設為(x2)
; ;Send, {PrintScreen 1}
; Send, {F3}
; Return
; ;#If


; ;#IfWinActive, YouTube
; ;~*$F7::
; *$SC138:: ;ralt
; ;將Youtube影片播放速度設為(x2)
; ;Send, {PrintScreen 1}
; Send, {PrtScr}
; Return
; ;#If






; ;#IfWinActive, YouTube
; ;~*$F7::
; *$SC15D:: ;rappkey
; ;將Youtube影片播放速度設為(x2)
; ;Send, {PrintScreen 1}
; Send, {F2}
; Return
; ;#If



; ;#IfWinActive, YouTube
; ;~*$F7::
; *$SC12E::
; ;將Youtube影片播放速度設為(x2)
; ;Send, {PrintScreen 1}
; Send, {F5}
; Return
; ;#If







; ;#IfWinActive, YouTube
; ;~*$F7::
; *$SC130::
; ;將Youtube影片播放速度設為(x2)
; Send, {F6}
; ;Send, {PrintScreen}
; Return
; ;#If








; ;#IfWinActive, YouTube
; ;~*$F7::
; *$SC120::
; ;將Youtube影片播放速度設為(x2)
; ;Send, {PrintScreen 1}
; Send, {F4}
; Return
; ;#If








; ; ;#IfWinActive, YouTube
; ; ;~*$F7::
; ; *$F7::
; ; ;將Youtube影片播放速度設為(x2)
; ; ;Send, {PrintScreen 1}
; ; Send, {PrintScreen}
; ; Return
; ; ;#If

