#!/bin/sh

# For more information visit: https://github.com/downthecrop/TwitchVOD

while [ true ]; do
	echo streamlink \
		--output=/home/download/"{time:%Y%m%d%H%M%S}-{id}-{title}".mkv \
		--hls-live-restart \
		--twitch-api-header="Authorization=OAuth ${TWITCH_TOKEN}" \
		--twitch-supported-codecs=h264,h265,av1 \
		$STREAM_URL $QUALITY
	streamlink \
		--output=/home/download/"{time:%Y%m%d%H%M%S}-{id}-{title}".mkv \
		--hls-live-restart \
		--twitch-api-header="Authorization=OAuth ${TWITCH_TOKEN}" \
		--twitch-supported-codecs=h264,h265,av1 \
		--twitch-disable-ads \
		$STREAM_URL $QUALITY
	sleep ${RETRY_SECS}s
done