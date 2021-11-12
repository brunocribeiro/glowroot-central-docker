# Glowroot Central Collector Docker Image by brunocesar
#
# License: GNU Lesser General Public License (LGPL), version 3 or later
# See the LICENSE file in the root directory or <http://www.gnu.org/licenses/lgpl-3.0.html>.

FROM glowroot/glowroot-central:0.14.0-beta.2 AS builder

LABEL autodelete="true"

FROM openjdk:17-slim

LABEL maintainer="Bruno Silva <bruno@brunocesar.com>"

ENV JAVA_OPTS="$JAVA_OPTS -XX:+UnlockExperimentalVMOptions -XX:+UseZGC "

RUN mkdir -p /usr/share/glowroot-central \
      && groupadd -r glowroot \
      && useradd --no-log-init -r -g glowroot glowroot

COPY --from=builder /usr/share/glowroot-central /usr/share/glowroot-central
COPY scripts/ /usr/share/glowroot-central/scripts/

RUN chown -R glowroot:glowroot /usr/share/glowroot-central \
        && sed -i 's/^cassandra.contactPoints=$/cassandra.contactPoints=127.0.0.1/' /usr/share/glowroot-central/glowroot-central.properties

USER glowroot:glowroot

VOLUME /usr/share/glowroot-central

EXPOSE 4000 8181

ENTRYPOINT ["/usr/share/glowroot-central/scripts/docker-entrypoint.sh"]

CMD ["/usr/share/glowroot-central/scripts/glowroot-central.sh"]
