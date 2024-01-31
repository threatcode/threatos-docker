FROM threat-core:latest
MAINTAINER Lorenzo "Palinuro" Faletra (palinuro@linux.it)
ENV DEBIAN_FRONTEND noninteractive

# Install components
RUN apt-get update; apt-get -y dist-upgrade
RUN apt-get -y install threat-pico
RUN apt-get -y install threat-mini threat-tools-cloud

ENTRYPOINT bash $@