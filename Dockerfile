FROM busybox:1.29
RUN wget -O - 'https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off' | tar xz caddy

FROM scratch
COPY --from=0 caddy /usr/local/bin/
WORKDIR /caddy
EXPOSE 80
COPY Caddyfile ./
ENV USERNAME= \
    PASSWORD= \
    SCOPE=/srv
ENTRYPOINT [ "caddy" ]
