#!/bin/bash

#set -euo pipefail

repos="$@"
echo "Tag name:"

read tag

if [ -z "$repos" ]; then
	echo "Updating all repos with built tag..."
else
	echo "Updating $repos with $tag..."
fi

function add_tag {
	for repo in $repos
	do
		cd $repo
    printf $blu"\nChecking repo status before tagging $repo...\n"$blu
    if [[ $repo != 'case_sensitive' ]] && [[ -d .git ]]
    then
      gr tag add "$tag"
    fi
    cd ..
	done
}

function add_tag_to_all {
    for repo in $(ls)
    do
        cd $repo
        printf $blu"\nChecking repo status before tagging $repo...\n"$blu
        if [[ $repo != 'case_sensitive' ]] && [[ -d .git ]]
        then
            gr tag add "$tag"
        fi
        cd ..
    done
}

SOURCE_DIR=$HOME/BuiltSource

if [ -z "$repos" ]; then
	cd $SOURCE_DIR
	add_tag_to_all
	cd $SOURCE_DIR/case_sensitive
	add_tag_to_all
else
	cd $SOURCE_DIR
	add_tag
fi
