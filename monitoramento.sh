
#!/bin/bash -e

LOG_FILE="/var/log/monitoramento.log"
URL="http://localhost"
TOKEN="SEU_TOKEN"
CHAT_ID="SEU_CHATid"
DATA=$(date "+%Y-%m-%d %H:%M:%S")
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

#verifica se o status n é 200 
if [ "$STATUS" -ne 200 ]; then
    MSG="🚨 [$DATA] Site fora do ar! Código HTTP: $STATUS"
    echo "$MSG" >> "$LOG_FILE"
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
         -d chat_id="$CHAT_ID" \
         -d text="$MSG"
else
    echo "[$DATA] Site OK. Código HTTP: $STATUS" >> "$LOG_FILE"
fi
