FROM busybox:1.29
RUN wget -O - 'https://caddyserver.com/download/linux/arm64?plugins=http.webdav&license=personal&telemetry=off' | tar xz caddy

FROM scratch
COPY --from=0 caddy /usr/local/bin/
WORKDIR /caddy
COPY Caddyfile ./
ENV PORT=80 \
    USERNAME= \
    PASSWORD= \
    SCOPE=/srv
EXPOSE ${PORT}
ENTRYPOINT [ "caddy" ]
