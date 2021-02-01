#!/bin/bash


function daily-notes {
    current_date=`date +%Y-%m-%d`
    notes_file="$HOME/notes/built/daily/$current_date.md"

    if [ ! -f "$notes_file" ]; then
        touch "$notes_file"
        echo -e "# $current_date Daily Notes\n\n## Retrospective\n\n\n## General Notes" > "$notes_file"
    fi
}

function start-day {
    # Pre-cache sudo credentials for 15min
    # sudo -v

    if [ ! -d "$HOME/notes" ]; then
        echo "Notes directory does not exist. Moving on..."
    else
        daily-notes
    fi

    if [ "$1" = "fresh" ]; then
        for APP in "Google Chrome" Slack "Caret Beta" Todoist Postman; do
            open -a "$APP"
        done
    fi   

    if [ "$1" != "simple" ]; then
        cd $HOME/BuiltSource/

        cd ./frontend-auth/ && git checkout -- package* && cd ../cla-miniapp/ && git checkout -- package* && cd ../built-dashboards/ && git checkout -- package* && cd ../cla-local-dev/

        bash $HOME/scripts/pull-repos.sh
    fi
}

start-day $1
