@echo off
set savePATH=C:\Users\%USERNAME%\AppData\LocalLow\Unknown Worlds\Subnautica\Subnautica\SavedGames
set repositoryURL=https://github.com/Malachite01/subnauticaSaves.git

git ls-remote %repositoryURL% master >nul 2>&1
if %errorlevel%==1 (
    echo Le repository git distant est vide, premier commit en cours.
    cd %savePATH% && git init && git add . && git commit -m "Premier commit" && git push --set-upstream %repositoryURL% master
    echo MsgBox "Initialisation effectue, premier commit termine.", vbYesOnly, "Notification" > notification.vbs
    cscript notification.vbs
    del notification.vbs
    goto :eof
) else (
    echo Le repository git distant n'est pas vide, synchronisation en cours.
    set commit_msg=
    :loop
        set /p commit_msg=Entres le message de commit, ou es tu dans le jeu ? : 
        if not defined commit_msg (
            echo Veuillez saisir un message de commit
        ) else (
            set "commit_msg=%commit_msg%"
            cd %savePATH% && git stash save "%commit_msg%" && git pull --rebase --set-upstream %repositoryURL% master && git stash apply && git add . && git commit -m "%commit_msg%" && git push --set-upstream %repositoryURL% master
            echo MsgBox "Git sync effectue.", vbYesOnly, "Notification" > notification.vbs
            cscript notification.vbs
            del notification.vbs
            goto :eof
        )
    goto loop
)