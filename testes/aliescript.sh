#!/usr/bin/env bash

sleep 3 && xdotool key ctrl+shift+n &&
	sleep 2 && xdotool type "https://a.aliexpress.com/_mKO8IWd" && sleep 1 && xdotool key 36 &&
	sleep 3 && xdotool key ctrl+shift+i && sleep 2 && xdotool key 71 &&
	xdotool mousemove 3068 665 && sleep 4 && xdotool click 1 &&  xdotool mousemove 3020 426 && sleep 3 && xdotool click 1 &&
	xdotool key ctrl+t && sleep 0.5 && xdotool type "https://www.invertexto.com/gerador-email-temporario" && sleep 1 && xdotool key 36 &&
	xdotool mousemove 3450 569 && sleep 4 && xdotool click 1 && sleep 3 && xdotool key ctrl+23 && xdotool mousemove 3039 536 && sleep 1.5 && xdotool click 1 &&
	sleep 3 && xdotool type "$(xclip -o -selection clipboard)" && sleep 2 && xdotool key 23 && xdotool type "QualquerSenha920" &&
	sleep 1.5 && xdotool mousemove 3041 667 && sleep 1 && xdotool click 1 && sleep 8 && xdotool mousemove 2928 367 && xdotool click 1 &&
    sleep 1 && xdotool mousemove 3080 667 && sleep 0.5 && xdotool click 1 && sleep 3 && xdotool key 64+70
