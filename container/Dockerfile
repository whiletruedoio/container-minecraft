# Use alpine as the base image
FROM docker.io/library/alpine:3

# Minecraft Version used in entrypoint
ENV MC_VER="1.19.3"
ENV MC_URL="https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar"

# Adding some while-true-do.io information
LABEL io.while-true-do.site="https://while-true-do.io"
LABEL io.while-true-do.blog="https://blog.while-true-do.io"
LABEL io.while-true-do.code="https://github.com/whiletruedoio"
LABEL io.while-true-do.mail="hello@while-true-do.io"
LABEL io.while-true-do.image.authors="dschier@while-true-do.io"

# Install Java Runtime
RUN apk add --no-cache "openjdk17-jre>=17"

# Copy files
COPY files/usr/ /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY files/opt/ /opt/minecraft/

WORKDIR /opt/minecraft/
VOLUME /opt/minecraft/

EXPOSE 25565/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
