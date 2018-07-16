FROM alpine:3.8

RUN apk add --no-cache openssh-client git curl

RUN cd /tmp/ && curl -fsSL "https://caddyserver.com/download/linux/amd64?plugins=tls.dns.route53&license=personal" | tar xzvf - caddy && install -m 0755 caddy /usr/bin/caddy

EXPOSE 80 443 2015
VOLUME /root/.caddy /srv
WORKDIR /srv

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
