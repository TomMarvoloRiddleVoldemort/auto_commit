#!/bin/bash

# Configuration
repo_path="/home/voldemorte/auto_commit"
start_date="2024-01-01"
num_commits=50
commit_message="Fake commit for contribution graph"

# Navigate to the repository
cd $repo_path

# Loop to make fake commits
for i in $(seq 1 $num_commits); do
  commit_date=$(date -d "$start_date +$i days" "+%a %b %d %H:%M:%S %Y")
  git add .
  git commit --date="$commit_date" -m "$commit_message"
done

# Push commits to GitHub
git push origin master
