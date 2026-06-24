#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

	# Install iTerm2 Cobalt2 Dynamic Profile (auto-loaded by iTerm2, no manual import needed)
	local iterm2_profiles_dir="${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
	mkdir -p "${iterm2_profiles_dir}"
	cp "init/cobalt2-iterm2-dynamic-profile.json" "${iterm2_profiles_dir}/cobalt2.json"
	echo "Installed Cobalt2 iTerm2 Dynamic Profile."

	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
