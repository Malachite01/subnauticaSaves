@echo off
cd C:/Users/mathi/AppData/LocalLow/Unknown Worlds/Subnautica/Subnautica/SavedGames && git pull --set-upstream https://github.com/Malachite01/subnauticaSaves.git master
echo MsgBox "Git pull effectue", vbYesOnly, "Notification" > notification.vbs
cscript notification.vbs
del notification.vbs
goto :eof