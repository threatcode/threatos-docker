FROM docker.io/threatos/core:rolling-i386
MAINTAINER "ThreatCode" (connect@nextlinux.system)
ENV DEBIAN_FRONTEND noninteractive
ENV VERSION 4.11-2

# Don't configure resolvconf symlink
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Install build dependencies
RUN apt-get update && apt-get -y full-upgrade && apt-get -y --allow-downgrades install git-buildpackage ubuntu-dev-tools devscripts debhelper dh-apparmor dh-autoreconf dh-buildinfo dh-cargo dh-consoledata dh-di dh-exec dh-golang dh-linktree dh-lisp dh-lua dh-make dh-make-golang dh-make-perl dh-perl6 dh-php dh-python dh-runit dh-strip-nondeterminism dh-sysuser dh-vim-addon dh-virtualenv kernel-wedge; rm -rf /var/lib/apt/lists/*

# Try to install debhelper systemd support if available
RUN apt-get update && apt-get -y --allow-downgrades install dh-systemd || true; rm -rf /var/lib/apt/lists/*

ENTRYPOINT bash -c "$@"
CMD bash -c "$@"
