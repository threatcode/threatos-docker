FROM docker.io/threatos/tools-metasploit:latest
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 8.0.3-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install threat-menu;apt-get -y install set; rm -rf /var/lib/apt/lists/*

ENTRYPOINT setoolkit $@
