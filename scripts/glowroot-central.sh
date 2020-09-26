#!/bin/bash
set -e

exec java -jar /usr/share/glowroot-central/glowroot-central.jar $GLOWROOT_JAR_OPTS

