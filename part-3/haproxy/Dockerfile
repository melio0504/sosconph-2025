# ----------------------------------------------
# OFFLINER
# ----------------------------------------------

FROM reg.iamlearning.net/soscon/alpine:2025 AS offliner

COPY offliner /offliner

# ----------------------------------------------
# FINAL
# ----------------------------------------------

FROM reg.iamlearning.net/soscon/alpine:2025

RUN --mount=from=offliner,src=/offliner,dst=/offliner \
    apk add --repositories-file=/dev/null --allow-untrusted /offliner/*.apk && \
    rm -rf /var/cache/apk/*

VOLUME /haproxy.cfg

ENTRYPOINT [ "haproxy", "-f", "/haproxy.cfg" ]
