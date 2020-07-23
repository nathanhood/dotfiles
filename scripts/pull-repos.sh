#!/bin/bash

blu=$'\e[1;34m'
red=$'\e[1;31m'
white=$'\e[0m'

#set -euo pipefail

CASE_SENSITIVE_REPOS=$(find $HOME/BuiltSource/case_sensitive -type d -depth 1 -exec test -e "{}/.git" ";" -print -prune)

echo "Updating all repos..."

function process {
    for repo in $(ls)
    do
        cd $repo
        printf $blu"\nChecking repo status before pulling $repo...\n"$blu
        if [[ $repo != 'case_sensitive' ]]
        then
            local branch_name=$(git branch | grep \* | cut -d ' ' -f2)
            echo $branch_name
            if [ $branch_name == 'master' ] || [ $branch_name == 'develop' ]
            then
                if [[ -z $(git status -s) ]]
                then
                    git pull origin $branch_name
                else
                    echo $red"$repo is dirty, please commit changes before pulling"$white
                fi
            else
                echo $red"$repo is on $branch_name branch"$white
            fi
        fi
        cd ..
    done
}

SOURCE_DIR=$HOME/BuiltSource

cd $SOURCE_DIR
process
cd $SOURCE_DIR/case_sensitive
process
