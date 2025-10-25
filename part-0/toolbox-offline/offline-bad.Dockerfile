FROM reg.iamlearning.net/soscon/alpine:2025

COPY offline-apks /offline-apks

RUN apk add --repositories-file=/dev/null --allow-untrusted /offline-apks/*.apk && \
    rm -rf /var/cache/apk/* /offline-apks

ENTRYPOINT [ \
  "/bin/bash", \
  "--login" \
]
