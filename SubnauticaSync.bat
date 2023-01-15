@echo off
set commit_msg=
:loop
    set /p commit_msg=Entres le message de commit, ou es tu dans le jeu ? :
    if not defined commit_msg (
        echo Veuillez saisir un message de commit
    ) else (
        set "commit_msg=%commit_msg%"
        cd C:/Users/mathi/AppData/LocalLow/Unknown Worlds/Subnautica/Subnautica/SavedGames && git add . && git commit -m "%commit_msg%" && git pull --rebase --set-upstream https://github.com/Malachite01/subnauticaSaves.git master && git pull --set-upstream https://github.com/Malachite01/subnauticaSaves.git master && git push --set-upstream https://github.com/Malachite01/subnauticaSaves.git master
        echo MsgBox "Git push effectue", vbYesOnly, "Notification" > notification.vbs
        cscript notification.vbs
        del notification.vbs
        goto :eof
    )
goto loop