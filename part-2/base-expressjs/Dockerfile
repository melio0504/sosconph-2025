# ----------------------------------------------
# BUILDER
# ----------------------------------------------

FROM base-nodejs AS builder

COPY /offliner/npm-cache /root/.npm

COPY package*.json ./

RUN npm ci --cache /root/.npm --offline --no-audit

# ----------------------------------------------
# FINAL
# ----------------------------------------------

FROM base-nodejs

COPY --from=builder /app/node_modules /app/node_modules
