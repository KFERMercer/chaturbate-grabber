#!/bin/bash
#
# Copyright (C) 2019 KFERMercer <KFER.Mercer@gmail.com>
#
# GitHub: <https://github.com/KFERMercer/chaturbate-auto-get-m3u8>
#
# This is free software, licensed under the GNU General Public License v3.
#
# Version: 1.0
# Release: 2
#

echo "自动挡1.0-2"
echo "请输入主播名或直播间链接: "
read input

function inputCheck(){
	if [[ ${input} =~ "chaturbate.com" ]]
	then
		if [[ ${input} =~ "m.chaturbate" ]]
		then
			mLink2Link
		fi
	else
		name2Link
	fi
}

function mLink2Link(){
	input=${input//"m.chaturbate/"/"chaturbate/"}
}

function name2Link(){
	input="https://chaturbate.com/"${input}"/"
}

function link2M3u8(){
	if [[ $(curl -4 -s --connect-timeout 5 --head ${input} | head -n 1) =~ "200" ]]
	then
		input=$(wget -4 -q -O - ${input}|grep 'initHlsPlayer' | tail -1)
		if [[ ${input} =~ ".m3u8" ]]
		then
			input=${input%"'"*}
			input=${input#*"'"}
		else
			echo "主播已下播."
			exit 0
		fi
		echo "获取成功! 直播流为: "
		echo ${input}
	else
		echo "链接或主播名错误. "
		exit 0
	fi
}

function hdLink(){
	input=${input%%playlist.m3u8*}$(wget -4 -q -O - ${input} |tail -1)
	echo "最高清晰度流为: "
	echo ${input}
}

function antiCheck(){
	input=${input//"http"/"ht删tp"}
	input=${input//"stream.highwebmedia.com"/"st删ream.highwe删bmedia.co删m"}
	echo "防和谐最高清晰度流为: "
	echo ${input}
}

inputCheck
echo "获取直播流中..."
link2M3u8
echo "解析清晰度..."
hdLink
antiCheck
unset input
exit 0
