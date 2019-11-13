#!/bin/bash
#
# Copyright (C) 2019 KFERMercer <KFER.Mercer@gmail.com>
#
# GitHub: <https://github.com/KFERMercer/chaturbate-auto-get-m3u8>
#
# This is free software, licensed under the GNU General Public License v3.
#
# Version: 1.0
# Release: 8
#

function inputCheck(){
	if [[ ${input} =~ "chaturbate.com" ]]
	then
		modelName=${input#*"chaturbate.com/"}
		modelName=${modelName%"/"*}
		if [[ ${input} =~ "m.chaturbate" ]]
		then
			mLink2Link
		fi
	else
		modelName=${input}
		name2Link
	fi

	if ! [[ $(curl -4 -s --connect-timeout 10 --head ${input} | head -n 1 | cut -c 8-) =~ "200" ]]
	then
		echo "错误输入或检查网络(404). "
		exit 0
	fi
}

function mLink2Link(){
	input=${input//"m.chaturbate"/"chaturbate"}
}

function name2Link(){
	input="https://chaturbate.com/"${input}"/"
}

function link2M3u8(){
	input=$(wget -4 -q -O - --timeout=10 ${input} | grep 'm3u8' | tail -1)
	if [[ ${input} =~ ".m3u8" ]]
	then
		serverEdge=${input#*"https://"}
		serverEdge=${serverEdge%'.stream.highwebmedia.com/live\'*}
		input=${input#*"${modelName}"}
		input=${input#*'u002Dsd\u002D'}
		input=${input%"_trns"*}
		input="https://${serverEdge}.stream.highwebmedia.com/live-hls/amlst:${modelName}-sd-${input}_trns_h265/playlist.m3u8"
	else
		echo "获取失败, 主播已下播."
		exit 0
	fi
	echo "获取成功! 直播流为: (建议电脑端使用此链接, h.265传输效率更高)"
	echo ${input}
}

function hdLink(){
	input=${input%%playlist.m3u8*}$(wget -4 -q -O - ${input} | tail -1)
	input=${input//"h265"/"h264"}
	echo "最高清直播流为: "
	echo ${input}
}

function antiCheck(){
	input=${input//"http"/"ht删tp"}
	input=${input//"stream.highwebmedia.com"/"st删ream.highwe删bmedia.co删m"}
	echo "防和谐高清直播流为: "
	echo ${input}
}


echo "自动挡 v1.0-8"
echo "请输入直播间链接(https/http)或主播名(注意下划线): "
read input
inputCheck
echo "获取直播流中..."
link2M3u8
echo "解析清晰度信息..."
hdLink
antiCheck
unset input
unset modelName
unset serverEdge
exit 0
