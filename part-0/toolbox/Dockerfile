FROM reg.iamlearning.net/soscon/alpine:2025

RUN apk --update --no-cache add \
      bash bash-completion curl wget nano \
      vim traceroute netcat-openbsd && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ \
  "/bin/bash", \
  "--login" \
]
