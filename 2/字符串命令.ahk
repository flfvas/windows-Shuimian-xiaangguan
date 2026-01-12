#NoTrayIcon


/*
尽管热字串主要用于在您输入缩写时进行扩展(自动替换),
但是它们也可以用来运行任何脚本动作. 从这个角度看,
它们类似于热键, 只是它们通常由多个字符组成(即字符串).

要定义热字串, 请用两个双冒号包围用来触发的缩写, 例如:

::btw::by the way
S↓


在上面的例子中, 每当您输入缩写 btw 时
会被自动替换为 "by the way"
(不过, 默认情况下您必须在输入 btw 后输入终止符,
例如 Space, . 或 Enter).

上面的 "by the way" 示例被称为自动替换热字串,
因为输入的文本被自动替换为第二个双冒号后指定的字符串.
与之相比, 热字串还可以定义用来执行任何自定义动作,
例如. 注意命令必须放在热字串的 下面.
::btw::
MsgBox You typed "btw".
return

:*:]d::  ; 此热字串通过后面的命令把 "]d" 替换成当前日期和时间.
FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; 看起来会像 9/1/2005 3:53 PM 这样
SendInput %CurrentDateTime%
return

^E::
	ExitApp
*/

::shsj::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "<div style=text-indent:2em;></div>"   ; 在剪贴板中存入新内容.
	Send ^v
return



::wztp::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "![图片 |3000](http://localhost/addons/1.jpg)"   ; 在剪贴板中存入新内容.
	Send ^v
return


::jl::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "距离"   ; 在剪贴板中存入新内容.
	Send ^v
return


::nbsp::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"   ; 在剪贴板中存入新内容.
	Send ^v
return


::info::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "> [!info] 卡片 > 字句段3"   ; 在剪贴板中存入新内容.
	Send ^v
return

/*
::cy::
	;Send "![图片 |3000](http://localhost/addons/1.jpg)"
	clipboard := ""   ; 清空剪贴板.
	clipboard := "X"   ; 在剪贴板中存入新内容.
	Send ^v
return
*/






















