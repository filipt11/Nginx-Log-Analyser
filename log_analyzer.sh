#!/bin/bash

log="nginx-access.log"

get_requested_ip(){
echo "liczba requestow: "
	awk '{print $1}' "$log" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %d requests\n",$2,$1}'
	printf "\n"
}

get_requested_path(){
	echo "Top 5 most requested paths:"
	awk '{print $7}' "$log" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %d requests\n",$2,$1}'
	printf "\n"
}

get_requested_status_code(){
	echo "Top 5 most response status codes:"
	awk '{print $9}' "$log" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %d requests\n",$2,$1}'
	printf "\n"
}

get_user_agent(){
	echo "Top user agents:"
	awk '{gsub(/"/,"",$12);print $12}' "$log" | sort | uniq -c | sort -nr | head -n 5 | awk '{printf "%s - %d requests\n",$2,$1}'

}


main(){
get_requested_ip
get_requested_path
get_requested_status_code
get_user_agent


}
main
