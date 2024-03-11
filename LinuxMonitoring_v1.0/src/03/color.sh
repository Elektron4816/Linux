#!/bin/bash

reset_color='\033[0m'

white_text='\033[97m'	
white_back='\033[107m'
red_text='\033[91m'
red_back='\033[101m'
green_text='\033[92m'
green_back='\033[102m'
blue_text='\033[94m'
blue_back='\033[104m'
purple_text='\033[95m'
purple_back='\033[105m'
black_text='\033[30m'
black_back='\033[40m'

text_color=([1]="$white_text" "$red_text" "$green_text" "$blue_text" "$purple_text" "$black_text")
background_color=([1]="$white_back" "$red_back" "$green_back" "$blue_back" "$purple_back" "$black_back")