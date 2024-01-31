FROM docker.io/threatos/core:lts
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 5.0-1

# Install components
RUN apt-get update;apt-get -y install threat-mini threat-tools-cloud zulucrypt- sirikali- apache2*- nginx*- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common- alsa*- xserver*- zaproxy- burpsuite- xdg*- intel-*- wine*- i965-va-driver-  threat-drivers- nvidia-*- wireshark-qt- x11*-; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash $@
