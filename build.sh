#!/usr/bin/env bash

mkdir -p target
rm target/bootstrap* 2>/dev/null
bashing uberbash 
sed -i 's/^ *EOF$/EOF/g' ./target/bootstrap-*.sh 
cp ./target/bootstrap* ./target/bootstrap.sh 
