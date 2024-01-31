FROM docker.io/threatos/tools-nmap:latest
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 6.0.38-4.11

# Install components
RUN apt-get update; apt-get -y dist-upgrade;apt-get -y --no-install-recommends install threat-menu;apt-get -y install threat-pico metasploit-framework postgresql aircrack-ng- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common-;apt-get -y install threat-mini threat-tools-cloud zulucrypt- sirikali- apache2*- nginx*- at-spi*- dconf*- gsettings*- gtk*- hicolor*- mesa-*- pyqt5*- qt5-*- qtbase5*- samba-common- alsa*- xserver*- zaproxy- burpsuite- xdg*- intel-*- wine*- i965-va-driver-  threat-drivers- nvidia-*- wireshark-qt- x11*-; rm -rf /var/lib/apt/lists/*

COPY msfconsole-start /msfconsole-start

ENTRYPOINT /msfconsole-start $@
