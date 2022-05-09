<!--
reference: https://www.makeareadme.com/
reference: https://commonmark.org/
-->

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/whiletruedoio/container-minecraft?logo=Cirrus-ci)](https://cirrus-ci.com/github/whiletruedoio/container-minecraft)
[![CodeFactor](https://www.codefactor.io/repository/github/whiletruedoio/container-minecraft/badge)](https://www.codefactor.io/repository/github/whiletruedoio/container-minecraft)
[![Docker Image Version](https://img.shields.io/docker/v/whiletruedoio/minecraft?logo=Docker&label=Release&sort=semver)](https://hub.docker.com/r/whiletruedoio/minecraft)
[![GitHub Tag (latest SemVer)](https://img.shields.io/github/v/tag/whiletruedoio/container-minecraft?logo=GitHub&label=Release&sort=semver)](https://github.com/whiletruedoio/container-minecraft/releases)
[![GitHub issues](https://img.shields.io/github/issues/whiletruedoio/container-minecraft)](https://github.com/whiletruedoio/container-minecraft/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/whiletruedoio/container-minecraft)](https://github.com/whiletruedoio/container-minecraft/pulls)
[![GitHub license](https://img.shields.io/github/license/whiletruedoio/container-minecraft)](https://github.com/whiletruedoio/container-minecraft/blob/main/LICENSE)

# Container: Minecraft

Minecraft server as container image.

## Disclaimer

[while-true-do.io](https://while-true-do.io) is NOT approved or endorsed by
Mojang AB or Microsoft Corporation. We are also NOT associated or connected
with Mojang AB or Microsoft Corporation.

## Motivation

Playing some games is relaxing and Minecraft is something we wanted to play.

## Description

This container image is a wrapper to download and configure a Minecraft server.
It provides most of the Vanilla configuration options.

## Requirements

You need to have a container engine like [Docker](https://docker.com) or
[Podman](https://podman.io) installed.

## Usage

Running the container image is described in details in this section.

### Minecraft Eula

Be aware, that You need to acknowledge the Minecraft EULA.
You can read about it here <https://www.minecraft.net/download/server/>

To acknowledge the EULA, you need to provide `--env EULA=true` during the start.

### Run container

You can run a simple instance and acknowledge the Eula.

```bash
# Podman (automatic port)
$ podman run --detach --tty --publish-all --env EULA=true \
  docker.io/whiletruedoio/minecraft:latest

# Podman (defined port)
$ podman run --detach --tty --publish 25565:25565 --env EULA=true \
  docker.io/whiletruedoio/minecraft:latest

# Docker (defined port)
$ docker run --detach --tty --publish 25565:25565 --env EULA=true \
  docker.io/whiletruedoio/minecraft:latest
```

You can also specify the version.

```bash
# Podman
$ podman run --detach --tty --publish 25565:25565 --env EULA=true \
  docker.io/whiletruedoio/minecraft:1.18.2

# Docker
$ docker run --detach --tty --publish 25565:25565 --env EULA=true \
  docker.io/whiletruedoio/minecraft:1.18.2
```

You can use a volume to persist the storage (your world and settings).

```bash
# Podman
$ podman run --detach --tty --publish 25565:25565 --env EULA=true \
  --volume minecraft:/opt/minecraft/ \
  docker.io/whiletruedoio/minecraft:latest

# Docker
$ docker run --detach --tty --publish 25565:25565 --env EULA=true \
  --volume minecraft:/opt/minecraft/ \
    docker.io/whiletruedoio/minecraft:latest
```

You can configure your server with environment variables. Please see below for
details about usable variables and default values.

For simple configurations, you can provide the variables inline.

```bash
# Podman
$ podman run --detach --tty --publish 25565:25565 --env EULA=true \
  --env XMS=512M --env XMX=2048M --env PVP=false \
    docker.io/whiletruedoio/minecraft:latest

# Docker
$ docker run --detach --tty --publish 25565:25565 --env EULA=true \
  --env XMS=512M --env XMX=2048M --env PVP=false \
    docker.io/whiletruedoio/minecraft:latest
```

Since Mincecraft can be configured with several properties and options you can
provide an environment file.

```bash
# Podman
$ podman run --detach --tty --publish 25565:25565 \
  --env-file=/path/to/file \
  docker.io/whiletruedoio/minecraft:latest

# Docker
$ docker run --detach --tty --publish 25565:25565 \
  --env-file=/path/to/file \
  docker.io/whiletruedoio/minecraft:latest
```

### Variables

Minecraft can be tuned and configured to your liking via server properties. You
can adjust various settings and behavior. For a complete list of supported
options, please have a look at the [envfile.sample](files/envfile.sample). The
[Minecraft Wiki](https://minecraft.fandom.com/wiki/Server.properties) provides
additional explanations for the properties.

### Administration

Sometimes, you need to adjust settings on the fly. Minecraft offers a server
console to interact with a running server. This can be useful to promote players
to ops or ban players and test some settings.

After starting a container with one of the above commands, you can attach to the
container and run server console commands.

```bash
# Podman
$ podman attach CONTAINERID
help
[19:57:07] [Server thread/INFO]: /advancement (grant|revoke)
[19:57:07] [Server thread/INFO]: /attribute <target> <attribute> (base|get|modifier)
[19:57:07] [Server thread/INFO]: /ban <targets> [<reason>]
[19:57:07] [Server thread/INFO]: /ban-ip <target> [<reason>]
[19:57:07] [Server thread/INFO]: /banlist [ips|players]
...
[19:57:07] [Server thread/INFO]: /worldborder (add|center|damage|get|set|warning)
[19:57:07] [Server thread/INFO]: /xp -> experience

/op mumbojumbo
[19:59:25] [Server thread/INFO]: Made MumboJumbo a server operator
```

After doing your administration, you can detach from the container with
`Ctrl+p Ctrl+q`.

Please check [here](https://minecraft.fandom.com/wiki/Commands) to get detailed
documentation about the possible commands.

## Known Issues

None.

## Contribute

Thank you so much for considering to contribute! We are happy, when someone is
joining the hard work.

### Issues

Issues and Pull Requests are handled on a regular basis. Please be aware, that
we may reach out to you, ask you to provide additional resources or want to
discuss the issue a little, before planning it.

- [Bugs and Feature Requests](https://github.com/whiletruedoio/container-minecraft/issues)
- [Pull Requests](https://github.com/whiletruedoio/container-minecraft/pulls)

### Develop

Providing code to this repository is pretty straight forward. Open an issue,
so we can discuss the bug/feature and start working on it afterwards. You just
need to open the pull request afterwards and that's it.

It is also strongly recommended to read the
[Contribution Guideline](https://github.com/whiletruedoio/.github/blob/main/docs/CONTRIBUTING.md)
beforehand.

### Changelog

We are maintaining a [changelog](CHANGELOG.md) for repositories. Normally, the
developers will update the changelog, according to
[keepachangelog.com](https://keepachangelog.com/).

### Test

To ensure a high quality and functionality, we want to carefully test our
software. The provided code is automatically tested as described in the
[.cirrus.yml](.cirrus.yml).

## License

Except otherwise noted, all work is [licensed](LICENSE) under a
[BSD-3-Clause License](https://opensource.org/licenses/BSD-3-Clause).

## Contact

Please feel free to reach out to us and the community. We also recommend to read
and understand the
[Code of Conduct](https://github.com/whiletruedoio/.github/blob/main/docs/CODE_OF_CONDUCT.md)
beforehand.

- Site: <https://while-true-do.io>
- Blog: <https://blog.while-true-do.io>
- Code: <https://github.com/whiletruedoio>
- Chat: [libera.chat #whiletruedoio](https://web.libera.chat/gamja/#whiletruedo)
- Mail: [hello@while-true-do.io](mailto:hello@while-true-do.io)
