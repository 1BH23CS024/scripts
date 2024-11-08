#!/bin/sh
git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
    printf "ERROR: This command must be run inside a Git repository.\n"
    exit 1

fi

git config commit.gpgsign false
git config init.defaultBranch main
git config user.name "Gaurav Chauhan"
git config --unset gpg.format

printf "Select Local .gitconfig (bti/GLOBAL): "
read config
config=$(printf "%s" "$config" | xargs | tr '[:upper:]' '[:lower:]')

if [ "$config" != "bti" ]; then
    git config user.email "107812523+grvchnx@users.noreply.github.com"
    git config user.signingkey "BDDB9E8DBF0BEF3E"
    git config commit.gpgsign true
    printf "SUCCESS: Global .gitconfig selected\n"

else
    git config user.email "182621594+1BH23CS024@users.noreply.github.com"
    printf "SUCCESS: Local github.com/1BH23CS024 config selected\n"

    printf "\nConfigure GPG signing? (y/N): "
    read gpg
    gpg=$(printf "%s" "$gpg" | xargs | tr '[:upper:]' '[:lower:]')

    if [ "$gpg" != "y" ]; then
        printf "GPG Signing: OFF\n"

    else
        git config user.signingkey "EA67D78E92DD0C37"
        git config commit.gpgsign true
        printf "GPG Signing: ON\n"

    fi
fi