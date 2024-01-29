# :: Arch
  FROM alpine AS qemu
  ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-aarch64.tar.gz
  RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . && mv qemu-3.0.0+resin-aarch64/qemu-aarch64-static .

# :: Header
  FROM 11notes/node:arm64v8-stable
  COPY --from=qemu qemu-aarch64-static /usr/bin
  ENV APP_VERSION=14.1.0
  ENV APP_ROOT=/next
  ENV APP_ROOT_JS=${APP_ROOT}/js

# :: Run
  USER root

  # :: prepare image
    RUN set -ex; \
      mkdir -p ${APP_ROOT};

  # :: install
    RUN set -ex; \
      cd ${APP_ROOT}; \
      npx --yes create-next-app@${APP_VERSION} \
        js \
        --js \
        --tailwind \
        --eslint \
        --app \
        --no-src-dir \
        --import-alias \
        --use-npm; \
      cd ${APP_ROOT_JS}; \
      sed -i "s@next build@next build \&\& /usr/bin/rsync -az --delete ${APP_ROOT_JS}/.next/standalone/ ${APP_ROOT_JS}/build/" ${APP_ROOT_JS}/package.json; \
      npm --save install \
        react-redux \
        react-icons \
        @reduxjs/toolkit \
        react-uuid \
        @iconify/react \
        sass \
        axios \
        web3 \
        flowbite \
        flowbite-react;

  # :: update image
    RUN set -ex; \
      apk --no-cache add \
        rsync; \
      apk --no-cache upgrade;

  # :: cleanup
    RUN set -ex; \
      rm -rf ${APP_ROOT_JS}/app/*; \
      rm -rf ${APP_ROOT_JS}/public/*;

  # :: copy root filesystem changes and set correct permissions
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin; \
      chown -R 1000:1000 \
        ${APP_ROOT};

# :: Volumes
  VOLUME ["${APP_ROOT_JS}/app", "${APP_ROOT_JS}/public", "${APP_ROOT_JS}/build"]

# :: Start
  USER docker
  ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]