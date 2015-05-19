FROM debian:wheezy

ENV DEVICE_NAME "My Sync Device"
WORKDIR /btsync
ADD https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /btsync/
RUN cd /btsync && tar xf BitTorrent-Sync_x64.tar.gz
RUN /btsync/btsync --dump-sample-config | sed -e 's/listening_port" : 0,/listening_port":55555,/' > /btsync/btsync.conf
RUN echo '#!/bin/sh\nsed -i "s/My Sync Device/$DEVICE_NAME/" /btsync/btsync.conf\n/btsync/btsync --config /btsync/btsync.conf --nodaemon' > /btsync/btsync.sh && chmod 755 /btsync/btsync.sh
EXPOSE 55555 8888
VOLUME /btsync/.sync
ENTRYPOINT ["/btsync/btsync.sh"]
