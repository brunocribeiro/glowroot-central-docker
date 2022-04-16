Glowroot Central Collector Docker Image
==========
[![License (LGPL version 3)](https://img.shields.io/badge/license-GNU%20LGPL%20version%203.0-green.svg?maxAge=2592000)](https://github.com/brunocesarsilva/glowroot-central-docker/blob/main/LICENCE)  [![](https://images.microbadger.com/badges/image/brunocesar/glowroot-central.svg)](https://microbadger.com/images/brunocesar/glowroot-central "Badge by microbadger.com")

This is a simple image using [`openjdk:17-slim`](https://hub.docker.com/_/openjdk/) as the base image for [Glowroot](https://glowroot.org/).

# Supported tags and respective `Dockerfile` links

- `latest`, `0.14.0-beta.3` [(Dockerfile)](https://github.com/brunocesarsilva/glowroot-central-docker/blob/main/Dockerfile)
- `0.14.0-beta.2` [(Dockerfile)](https://github.com/brunocesarsilva/glowroot-central-docker/blob/0.14.0-beta.2/Dockerfile)
- `0.13.6` [(Dockerfile)](https://github.com/brunocesarsilva/glowroot-central-docker/blob/0.13.6/Dockerfile)

# How to use this image

The following ports may be mapped to the host:

- `4000`: central UI will be available at this port (ex.: http://localhost:4000)
- `8181`: central collector will listen for HTTP/2 connections from agents on this port

You can create a container from this image running something like this:

# How to extend this image

## start a collector

```console
docker run -d --rm --name glowroot_central \
      -p 4000:4000 -p 8181:8181 -e CASSANDRA_CONTACT_POINTS=cassandra \
      brunocesar/glowroot-central
```

You can configure it in many ways, but it is not our goal to support every possible configuration use case. The following is just a few options that might be useful.

## Environment Variables:

`CASSANDRA_CONTACT_POINTS`

This optional environment variable can be used to define cassandra's contact points. Default on `glowroot-central.properties` is `cassandra.contactPoints=127.0.0.1`

`CASSANDRA_PORT`

This optional environment variable can be used to define cassandra's port. Default on `glowroot-central.properties` is `cassandra.port=9042`

`CASSANDRA_USERNAME`

This optional environment variable can be used to define the username for cassandra authentication. Default is to connect without credentials

`CASSANDRA_PASSWORD`

This optional environment variable can be used to define the password for cassandra authentication. Default is to connect without credentials

`CASSANDRA_KEYSPACE`

This optional environment variable can be used to define the keyspace on cassandra. Default on `glowroot-central.properties` is `cassandra.keyspace=glowroot`

`CASSANDRA_CONSISTENCY_LEVEL`

This optional environment variable can be used to define cassandra's consistency level. Default on `glowroot-central.properties` is `cassandra.consistencyLevel=QUORUM`

`CASSANDRA_SYMMETRIC_ENCRYPTION_KEY`

This optional environment variable can be used to define cassandra's symmetric encryption key.

`UI_CONTEXT_PATH`

This optional environment variable can be used to define context path to acess UI. Default on `glowroot-central.properties` is `ui.contextPath=/`

Also, `/usr/share/glowroot-central` is exposed as a volume.

See more about glowroot central collector configuration here: [Central Collector Installation](https://github.com/glowroot/glowroot/wiki/Central-Collector-Installation)

# License

This project and its documentation are licensed under the LGPL license. Refer to [LICENCE](https://github.com/brunocesarsilva/glowroot-central-docker/blob/main/LICENCE) for more information.
