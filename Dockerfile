FROM debian:wheezy

ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /btsync/btsync.tar.gz
WORKDIR /btsync
#RUN useradd -m -d /btsync btsync
RUN tar xf btsync.tar.gz
RUN /btsync/btsync --dump-sample-config | sed -e 's/My Sync Device/bla/' -e 's/listening_port" : 0,/listening_port":55555,/' > /btsync/btsync.conf
#USER btsync
#RUN chown -R btsync /btsync
EXPOSE 55555 8888
VOLUME /btsync/.sync
ENTRYPOINT ["/btsync/btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"] 
