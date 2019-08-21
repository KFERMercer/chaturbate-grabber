#!/bin/bash
#
# Copyright (C) 2019 KFERMercer <KFER.Mercer@gmail.com>
#
# GitHub: <https://github.com/KFERMercer/chaturbate-auto-get-m3u8>
#
# This is free software, licensed under the GNU General Public License v3.
#
# Version: 1.0
# Release: 1
#

echo "自动挡1.0-1"
echo "请输入主播名或直播间链接: "
read input

function inputCheck(){
	if [[ ${input} =~ "chaturbate.com" ]]
	then
		if [[ ${input} =~ "m.chaturbate" ]]
		then
			mLink2link
		fi
	else
		name2link
	fi
}

function mLink2link(){
	input=${input//"m.chaturbate/"/"chaturbate/"}
}

function name2link(){
	input="https://chaturbate.com/"${input}"/"
}

function link2M3u8(){
	input=$(wget -q -O - ${input}|grep 'initHlsPlayer' | tail -1)
	if [[ ${input} =~ ".m3u8" ]]
	then
		input=${input%"'"*}
		input=${input#*"'"}
	else
		echo "输入不合法, 可能是链接或者主播名错误"
		exit 0
	fi
	echo "获取成功! 直播流为: "
	echo ${input}
}

function hdLink(){
	input=${input%%playlist.m3u8*}$(wget -q -O - ${input} |tail -1)
	echo ${input}
}

function antiCheck(){
	input=${input//"https://"/"htt删ps://"}
	input=${input//"stream.highwebmedia.com"/"st删ream.highwe删bmedia.co删m"}
	echo ${input}
}

inputCheck
echo "获取直播流中: "
link2M3u8
echo "最高清晰度流为: "
hdLink
echo "防和谐最高清晰度流为: "
antiCheck
unset input
exit 0
