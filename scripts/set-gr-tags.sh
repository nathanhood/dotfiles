#!/bin/bash

#set -euo pipefail


echo "Updating all repos..."

function add_built_tag {
    for repo in $(ls)
    do
        cd $repo
        printf $blu"\nChecking repo status before tagging $repo...\n"$blu
        if [[ $repo != 'case_sensitive' ]] && [[ -d .git ]]
        then
            gr tag add built
        fi
        cd ..
    done
}

SOURCE_DIR=$HOME/BuiltSource

cd $SOURCE_DIR
add_built_tag
cd $SOURCE_DIR/case_sensitive
add_built_tag
