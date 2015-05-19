run:
	docker run --rm -it -p 55555:55555 -p 8888:8888 -v /usr/local/share/btsync:/btsync/sync bartojs/btsync

start:
	docker run -d --restart=always -e DEVICE_NAME=blabla -p 55555:55555 -p 8888:8888 -v /usr/local/share/btsync/folder:/btsync/folder -v /usr/local/share/btsync/.sync:/btsync/.sync bartojs/btsync

build:
	docker build -t bartojs/btsync .
