#!/bin/bash


function start-day {
    # Pre-cache sudo credentials for 15min
    # sudo -v

    if [ ! -d "$HOME/notes" ]; then
        echo "Notes directory does not exist. Moving on..."
    else
        echo "Need to make note command accessible from start.sh"
        # python $HOME/notes/scripts/note/main.py daily
    fi

    for APP in Twingate "Google Chrome" Slack "Nota" Postman; do
        open -a "$APP"
    done
}

start-day $1
