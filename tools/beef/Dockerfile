FROM docker.io/threatos/core:5.0
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 0.5.0-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install threat-menu;apt-get -y install beef-xss geoip-database; rm -rf /var/lib/apt/lists/*

COPY init.sh /init.sh

RUN chmod +x /init.sh

ENTRYPOINT /init.sh $@
