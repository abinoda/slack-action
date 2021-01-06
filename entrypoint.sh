#!/bin/sh
set -eu

if test -z "$SLACK_BOT_TOKEN"; then
  echo "Set the SLACK_BOT_TOKEN secret."
  exit 1
fi

JSON = $(curl -q \
     -X POST \
     -H "Content-type: application/json" \
     -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
     -d "$*" \
     https://slack.com/api/chat.postMessage)

JSON="${JSON//'%'/'%25'}"
JSON="${JSON//$'\n'/'%0A'}"
JSON="${JSON//$'\r'/'%0D'}"

echo "::set-output name=response::$JSON"
