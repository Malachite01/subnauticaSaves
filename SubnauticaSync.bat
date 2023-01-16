@echo off
set repositoryURL=https://github.com/Malachite01/subnauticaSaves.git
set commit_msg=
:loop
    set /p commit_msg=Entres le message de commit, ou es tu dans le jeu ? :
    if not defined commit_msg (
        echo Veuillez saisir un message de commit
    ) else (
        set "commit_msg=%commit_msg%"
        cd C:\Users\%USERNAME%\AppData\LocalLow\Unknown Worlds\Subnautica\Subnautica\SavedGames && git stash save "%commit_msg%" && git pull --rebase --set-upstream %repositoryURL% master && git stash apply && git add . && git commit -m "%commit_msg%" && git push --set-upstream %repositoryURL% master
        echo MsgBox "Git sync effectue", vbYesOnly, "Notification" > notification.vbs
        cscript notification.vbs
        del notification.vbs
        goto :eof
    )
goto loop