FROM docker.io/threatos/core:5.0
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 2.29-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install threat-menu;apt-get -y install bettercap; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bettercap $@
