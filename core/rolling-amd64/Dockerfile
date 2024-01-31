FROM docker.io/threatos/core:base-rolling-amd64
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.11-3

# Update base image
RUN	apt-get update;\
	apt-get -y dist-upgrade;\
	apt-get -y autoremove;\
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
