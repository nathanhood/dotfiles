#!/bin/bash


function daily-notes {
    current_date=`date +%Y-%m-%d`
    notes_file="$HOME/notes/recharge/daily/$current_date.md"

    if [ ! -f "$notes_file" ]; then
        touch "$notes_file"
        echo -e "# $current_date Daily Notes\n\n## Retrospective\n\n\n## Goals for Today\n\n\n## Stand Up\nWhat did I do?\n\nWhat will I do?\n\nAny blockers?\n\nParking lot\n\n## General Notes\n" > "$notes_file"
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
        for APP in "Google Chrome" Slack "Caret Beta" Todoist; do
            open -a "$APP"
        done
    fi   
}

start-day $1
