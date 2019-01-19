#!/bin/sh
set -eu

curl -X POST \
     -H "Content-type: application/json" \
     -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
     -d "$*" \
     https://slack.com/api/chat.postMessage