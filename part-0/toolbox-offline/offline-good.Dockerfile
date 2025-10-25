FROM reg.iamlearning.net/soscon/alpine:2025 AS offliner

COPY offline-apks /offline-apks

FROM reg.iamlearning.net/soscon/alpine:2025

RUN --mount=from=offliner,src=/offline-apks,dst=/offline-apks \
    apk add --repositories-file=/dev/null --allow-untrusted /offline-apks/*.apk && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ \
  "/bin/bash", \
  "--login" \
]
