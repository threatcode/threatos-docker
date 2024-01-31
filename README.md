# Docker images for Threat OS

Docker is a powerful technology that allows users to run containers universally on any host platform.

Docker uses template images, and allows the user to start several instances of the same template, destroy them, or build new custom templates on top of them.

Threat uses docker to allow its users to use its vast arsenal of tools on any platform supported by docker.

[Threat Core](#threatoscore)

[Threat Security](#threatos)

[Nmap](#threatostools-nmap)

[Metasploit](#threatostools-metasploit)

[Social Engineering Toolkit](#threatostools-set)

[Beef-XSS](#threatostools-beef)

[Bettercap](#threatostoos-bettercap)

[SQLMap](#threatostools-sqlmap)

[Builder Container](#threatosbuild)



[skip to usage examples](#general-usage-instructions-and-examples)

# Available Templates

Whether you want to have a container full of tools, or several smaller containers with a tiny selection of tools, or even a clean Threat environment to build yor custom stack on, this is the right place where to learn how to take advantage of the Threat Docker workspace.

## threatos/core

Core system with just the Threat basics.
You can use it as a start point to create your custom containers.

available flavors:

**threatos/core:latest** based on threat rolling (debian testing) amd64

**threatos/core:rolling-amd64** based on threat rolling (debian testing) amd64

**threatos/core:rolling-i386** based on threat rolling (debian testing) i386

**threatos/core:lts-amd64** based on threat lts (devuan stable) amd64

**threatos/core:lts-i386** based on threat lts (devuan stable) i386

**threatos/core:lts-arm64** based on threat lts (devuan stable) arm64

**threatos/core:lts-armhf** based on threat lts (devuan stable) armhf

launch the container:

`docker run --rm -ti --network host -v $PWD/work:/work threatos/core:lts-amd64`


## threatos/security

This container includes a huge collection of tools that can be used via command line from inside a docker container.

Some tools with graphical interface were excluded for obvious reasons.

This container ships with the following metapackages:

* threat-pico
* threat-mini
* threat-tools-cloud

available flavors:

**threatos/security:latest** built over threatos/core:rolling-amd64

**threatos/security:rolling** built over threatos/core:rolling-amd64

**threatos/security:lts** built over threatos/core:lts-amd64

Launch the container:

`docker run --rm -ti --network host -v $PWD/work:/work threatos/security`


## threatos/tools-*

This is a curated selection of smaller docker containers that contain only specific tools, alone or in cherry-picked collections.

Containers with shared tools are stacked on top of each other (when possible) to minimize storage waste and maximize layers reuse.

available templates:

### threatos/tools-nmap
based on threatos/core:rolling-amd64
provides the following packages:
* nmap
* ncat
* ndiff
* dnsutils
* netcat
* telnet

usage: 
`docker run --rm -ti threatos/tools-nmap <nmap options>`

examples:

`docker run --rm -ti threatos/tools-nmap -F 192.168.1.1`

`docker run --rm -ti threatos/tools-nmap -Pn 89.36.210.176`

### threatos/tools-metasploit
based on threatos/tools-nmap:latest
provides the following packages:
* threat-pico
* metasploit-framework
* postgresql

usage:

`docker run --rm -ti --network host -v $PWD/msf:/root/ threatos/tools-metasploit`

### threatos/tools-set
based on threatos/tools-metasploit:latest
provides the following packages:
* set

usage:

`docker run --rm -ti --network host -v $PWD/set:/root/.set threatos/tools-set`

### threatos/tools-beef
based on threatos/core:rolling-amd64
provides the following packages:
* beef-xss

usage:

`docker run --rm --network host -ti -v $PWD/beef:/var/lib/beef-xss threatos/tools-beef`

### threatos/tools-bettercap
based on threatos/core:rolling-amd64
provides the following packages:
* bettercap

usage:

`docker run --rm -ti threatos/tools-bettercap`

### threatos/tools-sqlmap
based on threatos/core:rolling-amd64
provides the following packages:
* sqlmap

usage:
`docker run --rm -ti threatos/tools-sqlmap <sqlmap options>`

example:
`docker run --rm -ti threatos/tools-sqlmap -u threatos.org --wizard`


## threatos/build

This container is used internally by the Threat Build Platform to test and build the distro packages.

Even if it is not meant to be used directly by users, it contains all the tools to work on debian packaging and properly test package builds in clean and disposable environments.

This container ships with the following packages:

* git-buildpackage
* ubuntu-dev-tools
* devscripts
* debhelper
* dh-apparmor
* dh-autoreconf
* dh-buildinfo
* dh-cargo
* dh-consoledata
* dh-di
* dh-exec
* dh-golang
* dh-linktree
* dh-lisp
* dh-lua
* dh-make
* dh-make-golang
* dh-make-perl
* dh-metainit
* dh-perl6
* dh-php
* dh-python
* dh-runit
* dh-strip-nondeterminism
* dh-sysuser
* dh-vim-addon
* dh-virtualenv
* kernel-wedge

Available flavors:

**threatos/build:latest** based on threatos/core:rolling-amd64

**threatos/build:rolling-amd64** based on threatos/core:rolling-amd64

**threatos/build:rolling-i386** based on threatos/core:rolling-i386

**threatos/build:lts-amd64** based on threatos/core:lts-amd64

**threatos/build:lts-i386** based on threatos/core:lts-i386

**threatos/build:lts-arm64** based on threatos/core:lts-arm64

**threatos/build:lts-armhf** based on threatos/core:lts-armhf


Example usage:

```
git clone https://nest.threat.sh/packages/tools/metasploit-framework
cd metasploit-framework
<make your modfications to the package here>
cd ..
docker run --rm -ti -v $PWD:/build/ threatos/build:rolling-amd64 - bash

cd /build/metasploit-framework
apt build-dep .
debuild -us -uc
exit
```


# General Usage Instructions and Examples

## Launch a container:
`docker run --name pcore-1 -ti threatos/core`
	NOTE: the pcore-1 name is arbitrary and can be customized

## Stop the container:
`docker stop pcore-1`

## Resume a previously-stopped container:
`docker start pcore-1`

## Remove a container after use:
`docker rm pcore-1`

## List all the instantiated containers:
`docker ps -a`

## Start multiple containers:
on terminal 1 -> `docker run --name pentest1 -ti threatos/security`
on terminal 2 -> `docker run --name pentest2 -ti threatos/security`
on terminal 3 -> `docker run --name msf-listener -ti threatos/tools-metasploit`

## Remove all the containers:
`docker rm $(docker ps -qa)`

## Start a container and automatically remove it on exit:
`docker run --rm -ti threatos/core`

## Use Volumes to share files with the host:
It is a good practice to not keep persistent docker containers, but to remove them on every use and make sure to save important files on a docker volume.

The following command creates a **work** folder inside the current directory and mounts it in /work inside the container.

`docker run --rm -ti -v $PWD/work:/work threatos/core`

## Use Volumes to share files across multiple containers:
on terminal 1 -> `docker run --name pentest -ti -v $PWD/work:/work threatos/security`
on terminal 2 -> `docker run --rm --network host -v $PWD/work:/work -ti threatos/security`
on terminal 3 -> `docker run --rm -v $PWD/work:/work -ti threatos/tools-metasploit`

## Open a port from the container to the host
Every docker container has its own network space connected to a virtual LAN.

All the traffic from within the docker container will be NATted by the host computer.

If you need to expose a port to other machines outside your local computer, use the following exaple:

`docker run --rm -p 8080:80 -ti threatos/core`

Note that the first port is the port that will be opened on your host, and the second one is the container port to bind to.

Here a reference usage of the -p flag:

**-p <host port>:<container port>** `-p 8080:80`
**-p <host port>:<container port>/<proto>** `-p 8080:80/tcp`
**-p <address>:<host port>:<container port>** `-p 192.168.1.30:8080:80` (in case of multiple adresses on host network)

## Use network host instead of docker NAT
Every docker container has its own network space connected to a virtual LAN.

All the traffic from within the docker container will be NATted by the host computer.

If you need to make the docker container share the same networking space of the host machine, then use the **--network host** flag as shown below

`docker run --rm --network host -ti threatos/core`

	NOTE 1: every port opened in the container will be opened on the host as well.

	NOTE 2: you can perform packet sniffing on the host network.

	NOTE 3: iptables rules applied inside the container will take effect on the host as well.
