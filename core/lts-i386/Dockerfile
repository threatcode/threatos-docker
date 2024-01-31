FROM docker.io/threatos/core:base-lts-i386
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0-2

# Add LTS Repos
RUN echo "Package: *" > /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=lts" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=lts-backports" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 501" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=lts-updates" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=lts-security" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=threat" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=threat-backports" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 599" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=threat-updates" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Package: *" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin: release n=threat-security" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Pin-Priority: 600" >> /etc/apt/preferences.d/threat-pinning; \
    echo "Acquire::Retries \"4\";" > /etc/apt/apt.conf.d/99retry-on-error; \
    echo "deb https://deb.threat.sh/threat threat main contrib non-free" > /etc/apt/sources.list; \
    echo "deb https://mirror.threat.sh/direct/threat threat-security main contrib non-free" >> /etc/apt/sources.list; \
    echo "#deb https://deb.threat.sh/threat threat-updates main contrib non-free" >> /etc/apt/sources.list; \
    echo "deb https://deb.threat.sh/threat threat-backports main contrib non-free" >> /etc/apt/sources.list

# Update system
RUN	apt update;\
	apt -y dist-upgrade;\
	apt -y autoremove;\
	rm -rf /var/lib/apt/lists/*


ENTRYPOINT bash $@
