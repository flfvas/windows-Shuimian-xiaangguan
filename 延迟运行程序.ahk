miaov := 1000              ;1秒 = 1000毫秒, 
fen_ := 60 * miaov         ;1分钟 = 60秒X1000 = 60000毫秒


xu_Yaomiaov_1 := 180 * miaov        ;实际需要秒数
xu_Yaofen_2 := 3 * fen             ;实际需要分钟数


Sleep, xu_Yaomiaov_1          ;延时实际需要分钟数
Run, "C:\Users\a\AppData\Local\Programs\Obsidian\Obsidian.exe"
;Run, "C:\Program Files\Netease\GameViewer\GameViewer.exe"
;Run, "X:\X\123PAN\123pan.exe"

