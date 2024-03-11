#!/bin/bash


TELEGRAM_USER_ID="456072370"
TELEGRAM_BOT_TOKEN="6952047534:AAHnqv7oaaNgrGMDeRIwE7jBLuj_LCrLCeE"
TIME="5"
STAGE_STATUS="$(echo "$CI_JOB_STATUS")"
STAGE_NAME="$(echo "$CI_JOB_NAME")"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $1 $STAGE_NAME $STAGE_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null