#!/bin/bash

#Start_date
  start_date="2024-04-10"
current_date=$start_date
last_date=$start_date

#Loop for 250 days
for ((i=1; i<=30; i++)); do
	commit_day=$((RANDOM % 10))
	if [ $commit_day -lt 9 ]; then
		num_commits=1
		if [ $((RANDOM %5)) -eq 0 ];then
			num_commits=$((RANDOM % 3 + 2))
		fi
		
		for ((c=1; c<=$num_commits; c++ )); do
			num_tasks=$((RANDOM % 5 + 1))
			indices=($(seq 0 4 | shuf))

			for (( j=0; j<num_tasks; j++)); do
				eval "${tasks[${indices[$j]}]}"
			done
			
			git add .
			git commit -m "update for $current_date"

			git commit --amend --no-edit --date="$current+date 14:00:00"
		done
	fi
	last_date=$current_date
	current_Date=$(date -I -d "$current_Date +1 day")
done
