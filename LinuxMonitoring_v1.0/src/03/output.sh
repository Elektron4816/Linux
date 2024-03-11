#!/bin/bash


echo -e "${background_color[$1]}${text_color[$2]} \bHOSTNAME$reset_color = ${background_color[$3]}${text_color[$4]} \b$HOSTNAME$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bTIMEZONE$reset_color = ${background_color[$3]}${text_color[$4]} \b$TIMEZONE$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bUSER$reset_color = ${background_color[$3]}${text_color[$4]} \b$USER$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bOS$reset_color = ${background_color[$3]}${text_color[$4]} \b$OS$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bDATE$reset_color = ${background_color[$3]}${text_color[$4]} \b$DATE$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bUPTIME$reset_color = ${background_color[$3]}${text_color[$4]} \b$UPTIME$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bUPTIME_SEC$reset_color = ${background_color[$3]}${text_color[$4]} \b$UPTIME_SEC$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bIP$reset_color = ${background_color[$3]}${text_color[$4]} \b$IP$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bMASK$reset_color = ${background_color[$3]}${text_color[$4]} \b$MASK$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bGATEWAY$reset_color = ${background_color[$3]}${text_color[$4]} \b$GATEWAY$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bRAM_TOTAL$reset_color = ${background_color[$3]}${text_color[$4]} \b$RAM_TOTAL$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bRAM_USED$reset_color = ${background_color[$3]}${text_color[$4]} \b$RAM_USED$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bRAM_FREE$reset_color = ${background_color[$3]}${text_color[$4]} \b$RAM_FREE$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bSPACE_ROOT$reset_color = ${background_color[$3]}${text_color[$4]} \b$SPACE_ROOT$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bSPACE_ROOT_USED$reset_color = ${background_color[$3]}${text_color[$4]} \b$SPACE_ROOT_USED$reset_color"
echo -e "${background_color[$1]}${text_color[$2]} \bSPACE_ROOT_FREE$reset_color = ${background_color[$3]}${text_color[$4]} \b$SPACE_ROOT_FREE$reset_color"
