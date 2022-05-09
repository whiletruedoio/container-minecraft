# Use the latest available slim build
FROM docker.io/library/alpine:3

RUN apk add --no-cache openjdk17-jre

COPY files/usr/ /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY files/opt/ /opt/minecraft/

WORKDIR /opt/minecraft/
VOLUME /opt/minecraft/

EXPOSE 25565/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
