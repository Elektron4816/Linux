#!/bin/bash


echo -e "${background_color[$b1]}${text_color[$f1]} \bHOSTNAME$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$HOSTNAME$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bTIMEZONE$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$TIMEZONE$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bUSER$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$USER$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bOS$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$OS$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bDATE$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$DATE$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bUPTIME$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$UPTIME$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bUPTIME_SEC$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$UPTIME_SEC$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bIP$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$IP$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bMASK$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$MASK$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bGATEWAY$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$GATEWAY$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bRAM_TOTAL$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$RAM_TOTAL$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bRAM_USED$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$RAM_USED$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bRAM_FREE$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$RAM_FREE$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bSPACE_ROOT$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$SPACE_ROOT$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bSPACE_ROOT_USED$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$SPACE_ROOT_USED$reset_color"
echo -e "${background_color[$b1]}${text_color[$f1]} \bSPACE_ROOT_FREE$reset_color = ${background_color[$b2]}${text_color[$f2]} \b$SPACE_ROOT_FREE$reset_color"

echo -e "\nColumn 1 background = $d1 (${name_color[$b1]})"
echo -e "Column 1 font color = $d2 (${name_color[$f1]})"
echo -e "Column 2 background = $d3 (${name_color[$b2]})"
echo -e "Column 2 font color = $d4 (${name_color[$f2]})"
