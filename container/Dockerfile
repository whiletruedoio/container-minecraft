# Use the latest available slim build
FROM docker.io/library/alpine:3

# Adding some while-true-do.io information
LABEL io.while-true-do.site="https://while-true-do.io"
LABEL io.while-true-do.blog="https://blog.while-true-do.io"
LABEL io.while-true-do.code="https://github.com/whiletruedoio"
LABEL io.while-true-do.mail="hello@while-true-do.io"

# Adding authors is recommended
LABEL io.while-true-do.image.authors="dschier@while-true-do.io"

RUN apk add --no-cache "openjdk17-jre>=17"

COPY files/usr/ /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY files/opt/ /opt/minecraft/

WORKDIR /opt/minecraft/
VOLUME /opt/minecraft/

EXPOSE 25565/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
