# ----------------------------------------------
# OFFLINER
# ----------------------------------------------

FROM reg.iamlearning.net/soscon/alpine:2025 AS offliner

COPY offliner /offliner

# ----------------------------------------------
# BUILDER
# ----------------------------------------------

FROM reg.iamlearning.net/soscon/alpine:2025 AS builder

RUN --mount=from=offliner,src=/offliner,dst=/offliner \
    apk add --repositories-file=/dev/null --allow-untrusted /offliner/apks/*.apk && \
    cp -r /offliner/npm-cache ~/.npm

WORKDIR /app

COPY package*.json ./

RUN npm ci --cache ~/.npm --offline

# ----------------------------------------------
# FINAL
# ----------------------------------------------

FROM reg.iamlearning.net/soscon/alpine:2025

RUN --mount=from=offliner,src=/offliner,dst=/offliner \
    apk add --repositories-file=/dev/null --allow-untrusted /offliner/apks/*.apk

COPY --from=builder /app/node_modules /app/node_modules

WORKDIR /app

COPY src/server.js ./

EXPOSE 3000

CMD [ "node", "server.js" ]
