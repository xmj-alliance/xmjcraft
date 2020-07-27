FROM node:14-alpine as builder

ARG BUILD_DIR=/build

ADD ./server ${BUILD_DIR}/

WORKDIR ${BUILD_DIR}/

RUN echo " --- Building App --- " \
 && yarn install \
 && yarn run build:prod \
 && cp package.dist.json dist/package.json

# ======================================================================

FROM node:14-alpine as runner

ARG BUILD_DIR=/build
ARG BASE_DIR=/www/xmjcraft

COPY --from=builder --chown=node:node ${BUILD_DIR}/dist ${BASE_DIR}

WORKDIR ${BASE_DIR}/

RUN echo " --- Collecting node modules --- " \
 && npm install \
 && npm cache clean --force

VOLUME [${BASE_DIR}"/configs"]

CMD [ "node", "xmjcraft" ]