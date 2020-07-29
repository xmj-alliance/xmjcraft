FROM node:14-alpine as builder-client

ARG BUILD_DIR=/build/client

ADD ./client ${BUILD_DIR}/

WORKDIR ${BUILD_DIR}/

RUN echo " --- Building Client --- " \
 && yarn install --frozen-lockfile \
 && yarn run build

# ======================================================================

FROM node:14-alpine as builder-server

ARG BUILD_DIR=/build/server

ADD ./server ${BUILD_DIR}/

WORKDIR ${BUILD_DIR}/

RUN echo " --- Building Server --- " \
 && yarn install \
 && yarn run build:prod \
 && cp package.dist.json dist/package.json

# ======================================================================

FROM node:14-alpine as runner

ARG BUILD_DIR=/build
ARG BASE_DIR=/www/xmjcraft

COPY --from=builder-server --chown=node:node ${BUILD_DIR}/server/dist ${BASE_DIR}
COPY --from=builder-client --chown=node:node ${BUILD_DIR}/client/build ${BASE_DIR}/statics/client/

WORKDIR ${BASE_DIR}/

RUN echo " --- Collecting node modules --- " \
 && yarn install \
 && yarn cache clean --all \
 && rm yarn.lock

VOLUME [${BASE_DIR}"/configs"]

CMD [ "node", "xmjcraft" ]