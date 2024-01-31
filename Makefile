docker-base:
	cd docker-base && ./build.sh

core-rolling:
	podman build -t docker.io/threatos/core:rolling-amd64 core/rolling-amd64/

core: docker-base
	podman build -t docker.io/threatos/core:amd64 core/lts-amd64/
	podman build -t docker.io/threatos/core:i386 core/lts-i386/
	podman build -t docker.io/threatos/core:arm64 core/lts-arm64/
	podman build -t docker.io/threatos/core:armhf core/lts-armhf/

builder:
	podman build -t docker.io/threatos/build:amd64 build/lts-amd64/
	podman build -t docker.io/threatos/build:i386 build/lts-i386/
	podman build -t docker.io/threatos/build:arm64 build/lts-arm64/
	podman build -t docker.io/threatos/build:armhf build/lts-armhf/


security:
	podman build -t docker.io/threatos/tools-nmap:latest tools/nmap
	podman build -t docker.io/threatos/tools-metasploit:latest tools/metasploit
	podman build -t docker.io/threatos/tools-set:latest tools/set
	podman build -t docker.io/threatos/tools-bettercap:latest tools/bettercap
	podman build -t docker.io/threatos/tools-beef:latest tools/beef
	podman build -t docker.io/threatos/tools-sqlmap:latest tools/sqlmap
	podman build -t docker.io/threatos/security:latest security/lts/

build: core-rolling core builder security

push-docker: build
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:lts-amd64
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:lts
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:latest
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:5
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:5.0
	podman push docker.io/threatos/core:amd64 docker.io/threatos/core:5.0.0

	podman push docker.io/threatos/core:arm64 docker.io/threatos/core:lts-arm64
	podman push docker.io/threatos/core:arm64 docker.io/threatos/core:5-arm64
	podman push docker.io/threatos/core:arm64 docker.io/threatos/core:5.0-arm64
	podman push docker.io/threatos/core:arm64 docker.io/threatos/core:5.0.0-arm64

	podman push docker.io/threatos/core:armhf docker.io/threatos/core:lts-armhf
	podman push docker.io/threatos/core:i386 docker.io/threatos/core:lts-i386

	podman push docker.io/threatos/core:rolling-amd64 docker.io/threatos/core:rolling-amd64
	podman push docker.io/threatos/core:rolling-amd64 docker.io/threatos/core:rolling

	podman push docker.io/threatos/build:amd64 docker.io/threatos/build:latest
	podman push docker.io/threatos/build:amd64 docker.io/threatos/build:amd64
	podman push docker.io/threatos/build:arm64 docker.io/threatos/build:arm64
	podman push docker.io/threatos/build:i386 docker.io/threatos/build:i386

	podman push docker.io/threatos/tools-nmap:latest docker.io/threatos/tools-nmap:latest
	podman push docker.io/threatos/tools-metasploit:latest docker.io/threatos/tools-metasploit:latest
	podman push docker.io/threatos/tools-set:latest docker.io/threatos/tools-set:latest
	podman push docker.io/threatos/tools-bettercap:latest docker.io/threatos/tools-bettercap:latest
	podman push docker.io/threatos/tools-beef:latest docker.io/threatos/tools-beef:latest
	podman push docker.io/threatos/tools-sqlmap:latest docker.io/threatos/tools-sqlmap:latest
	podman push docker.io/threatos/security:latest docker.io/threatos/security:latest
	podman push docker.io/threatos/security:latest docker.io/threatos/security:5
	podman push docker.io/threatos/security:latest docker.io/threatos/security:5.0
	podman push docker.io/threatos/security:latest docker.io/threatos/security:5.0.0

push-threat: build
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:lts-amd64
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:lts
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:latest
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:5
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:5.0
	podman push docker.io/threatos/core:amd64 registry.threat.run/core:5.0.0

	podman push docker.io/threatos/core:arm64 registry.threat.run/core:lts-arm64
	podman push docker.io/threatos/core:arm64 registry.threat.run/core:5-arm64
	podman push docker.io/threatos/core:arm64 registry.threat.run/core:5.0-arm64
	podman push docker.io/threatos/core:arm64 registry.threat.run/core:5.0.0-arm64

	podman push docker.io/threatos/core:armhf registry.threat.run/core:lts-armhf
	podman push docker.io/threatos/core:i386 registry.threat.run/core:lts-i386

	podman push docker.io/threatos/core:rolling-amd64 registry.threat.run/core:rolling-amd64
	podman push docker.io/threatos/core:rolling-amd64 registry.threat.run/core:rolling

	podman push docker.io/threatos/build:amd64 registry.threat.run/build:latest
	podman push docker.io/threatos/build:amd64 registry.threat.run/build:amd64
	podman push docker.io/threatos/build:arm64 registry.threat.run/build:arm64
	podman push docker.io/threatos/build:i386 registry.threat.run/build:i386

	podman push docker.io/threatos/tools-nmap:latest registry.threat.run/tools-nmap:latest
	podman push docker.io/threatos/tools-metasploit:latest registry.threat.run/tools-metasploit:latest
	podman push docker.io/threatos/tools-set:latest registry.threat.run/tools-set:latest
	podman push docker.io/threatos/tools-bettercap:latest registry.threat.run/tools-bettercap:latest
	podman push docker.io/threatos/tools-beef:latest registry.threat.run/tools-beef:latest
	podman push docker.io/threatos/tools-sqlmap:latest registry.threat.run/tools-sqlmap:latest
	podman push docker.io/threatos/security:latest registry.threat.run/security:latest
	podman push docker.io/threatos/security:latest registry.threat.run/security:5
	podman push docker.io/threatos/security:latest registry.threat.run/security:5.0
	podman push docker.io/threatos/security:latest registry.threat.run/security:5.0.0
