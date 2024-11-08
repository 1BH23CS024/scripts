#!/bin/sh
git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: Run this command inside a Git repository."
    exit 1
fi

git config init.defaultBranch main
git config user.email "182621594+1BH23CS024@users.noreply.github.com"
git config user.name "Gaurav Chauhan"
echo -e "\nLocal .gitconfig Profile: github.com/1BH23CS024"

echo -e -n "\nConfigure GPG signing? (y/N): "
read response
response=$(echo "$response" | xargs | tr '[:upper:]' '[:lower:]')

if [ "$response" != "y" ]; then
    echo "GPG Signing: OFF"
else
    git config --unset gpg.format
    git config user.signingkey "EA67D78E92DD0C37"
    git config commit.gpgsign true
    echo "GPG Signing: ON"
fi