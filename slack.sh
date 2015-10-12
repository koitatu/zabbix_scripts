#!/bin/bash

CHANNEL="slackのチャンネル名"
WEBHOOK_URL="slackのwebhookURL"

status="$1"

if [ "$status" == 'OK' ]; then
        emoji=':smile:'
elif [ "$status" == 'PROBLEM' -o "$status" == 'NG' ]; then
        emoji=':frowning:'
else
        emoji=':ghost:'
fi

message="$@"
payload="payload={\"channel\": \"#${CHANNEL}\", \"username\": \"zabbix_bot_chan\", \"text\": \"${message}\", \"icon_emoji\": \"${emoji}\"}"

curl -m 5 --data "${payload}" ${WEBHOOK_URL}
