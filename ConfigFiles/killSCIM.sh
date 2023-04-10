pkill -f SCIM.app

ps -ef|grep SCIM_Extension|grep -v grep|awk '{printf("kill -9 %s\n", $2)}'|sh

echo 'done'
