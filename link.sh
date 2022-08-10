#!/bin/zsh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    link.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smun <smun@student.42seoul.kr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/21 14:30:25 by smun              #+#    #+#              #
#    Updated: 2022/03/21 14:32:37 by smun             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Prefix path used by symbolic linking.

export HOME_PREFIX=~
export PREFIX=~/goinfre

function copy_and_merge() {
	SRCPATH=$1
	DESTPATH=$2

	echo "Copying.."
	cp -af "$SRCPATH/" "$DESTPATH/"
}

function link() {
	LINKNAME=$1
	SRCPATH="$HOME_PREFIX"'/'"$LINKNAME"
	DESTPATH="$PREFIX"'/'"$LINKNAME"

	if [ ! -L "$SRCPATH" ] && [ ! -d "$SRCPATH" ]
	then
		echo "Not exists link name: $LINKNAME ... skipping.."
		return
	fi

	printf "[%s] \n" "$LINKNAME"

	# Create directory if not exists
	mkdir -p "$DESTPATH"

	# Copy and merging if any caches already exist.

	if [ -d "$SRCPATH" ]
	then
		copy_and_merge "$SRCPATH" "$DESTPATH"
	fi

	echo "Linking.."

	# Remove previous path and make a symbolic link with ~/goinfre
	rm -rf "$SRCPATH"
	ln -s "$DESTPATH" "$SRCPATH"
	echo "Done!"
}

link "Library/Caches/vscode-cpptools"
link "Library/Application Support/Slack/Cache"
link "Library/Application Support/Slack/Service Worker/CacheStorage"
link "Library/Application Support/Code/Cache"
link "Library/Application Support/Code/Code Cache"
link "Library/Application Support/Code/CachedData"
link "Library/Application Support/Code/CachedExtensionVSIXs"
link "Library/Application Support/Code/CachedExtensions"
link "Library/Application Support/Code/User/globalStorage"
link "Library/Application Support/Code/User/snippets"
link "Library/Application Support/Code/User/workspaceStorage"
link "Library/Application Support/discord"
link "Library/Application Support/Caches"
link "Library/Developer/CoreSimulator"
link "Library/Caches/com.apple.Music"
link "Library/Caches/com.tinyspeck.slackmacgap"
link "Library/Caches/com.tinyspeck.slackmacgap.ShipIt"
link "Library/Caches/com.hnc.Discord"
link "Library/Caches/com.hnc.Discord.ShipIt"
link "Library/Caches/Google"
link "Library/Caches/com.microsoft.VSCode"
link "Library/Caches/com.microsoft.VSCode.ShipIt"
link "Library/Caches/com.bitwarden.desktop"
link "Library/Caches/com.bitwarden.desktop.ShipIt"
link "Library/Caches/Firefox"
link "Library/Caches/ru.keepcoder.Telegram"
link "Library/Caches/Yarn"
link "Library/Caches/com.google.SoftwareUpdate"
link "Library/Group Containers/6N38VWS5BX.ru.keepcoder.Telegram"
link ".npm"
