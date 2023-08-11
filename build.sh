#!/usr/bin/env bash

mkdir -p target
rm target/bootstrap* 2>/dev/null
bashing uberbash 
sed -i 's/^ *EOF$/EOF/g' ./target/bootstrap-*.sh 
cp ./target/bootstrap* ./target/bootstrap.sh 
REMOTE_REPO=$(git remote get-url origin | cut -d: -f2)
REMOTE="${REMOTE_REPO/.git/}/$(git rev-parse --abbrev-ref HEAD)"
sed -i "s@raw.githubusercontent.com/.*@raw.githubusercontent.com/$REMOTE/target/bootstrap.sh@g" README.md
