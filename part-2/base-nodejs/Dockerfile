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
    apk add --repositories-file=/dev/null --allow-untrusted /offliner/apks/*.apk && \
    rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT [ "node" ]
