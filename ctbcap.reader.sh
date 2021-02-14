#!/bin/bash
#

exec 1>/tmp/ctbcap.reader.log 2>&1 || true

config_path="${HOME}/.ctbcap"

function check_internet(){
	while [ true ]; do
		if [ $(curl -I -s --connect-timeout 5 www.google.com -w %{http_code} | tail -n1) = "200" ]; then
			# 网络畅通
			break
		else
			# 网络不良
			echo 网络不良, 休眠10秒...
			sleep 10
		fi
	done
}

function read_file(){
	models=($(ls -1 --color=never $config_path))
}

function gen_screen(){

	local screen_name="ctbcap-$1"

	if [[ $(screen -ls | grep $screen_name) == "" ]]; then
		screen -dmS $screen_name
		sleep 1
		screen -x -S $screen_name -p 0 -X stuff "ctbcap $1 $2"
		sleep 1
		screen -x -S $screen_name -p 0 -X stuff $'\n'
		echo "NEW: $1"
	else
		echo "EXIST: $1"
	fi
}

function gen_service(){
	models=($(ls -1 --color=never $config_path))

	local i=0

	while [ $i -lt ${#models[@]} ]; do

	gen_screen ${models[$i]} $(ls -1 --color=never ${config_path}/${models[$i]}/serveredge/ 2>/dev/null)

	i=$[$i+1]

	done
}

check_internet
gen_service

exit 0
