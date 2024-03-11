#!/bin/bash

mas_code=([1]="200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
rand_code_num=$(($RANDOM % 10 + 1))
rand_code=${mas_code[$rand_code_num]}

rand_byte=$(($RANDOM % 9999 + 32))


# 200 OK («хорошо»)
# 201 Created («создано»)
# 400 Bad Request («неправильный, некорректный запрос»)
# 401 Unauthorized («не авторизован (не представился)»)
# 403 Forbidden («запрещено (не уполномочен)»)
# 404 Not Found («не найдено»)
# 500 Internal Server Error («внутренняя ошибка сервера»)
# 501 Not Implemented («не реализовано»)
# 502 Bad Gateway («плохой, ошибочный шлюз»)
# 503 Service Unavailable («сервис недоступен»)