# :: Header
  FROM 11notes/node:stable
  ENV APP_VERSION=13.4.10
  ENV APP_ROOT=/next
  ENV APP_ROOT_JS=${APP_ROOT}/js

# :: Run
  USER root

  # :: prepare image
    RUN set -ex; \
      npm install -g npm@latest; \
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
      sed -i "s@next build@next build \&\& /usr/bin/rsync -az --delete ${APP_ROOT_JS}/.next/standalone/ ${APP_ROOT_JS}/build@" ${APP_ROOT_JS}/package.json; \
      npm install \
        react-redux \
        @reduxjs/toolkit \
        react-uuid \
        sass \
        @iconify/react \
        axios \
        web3;

  # :: update image
    RUN set -ex; \
      apk --update --no-cache add \
        rsync; \
      apk update; \
      apk upgrade;

  # :: cleanup
    RUN set -ex; \
      rm -rf ${APP_ROOT_JS}/app/*; \
      rm -rf ${APP_ROOT_JS}/public/*;

  # :: copy root filesystem changes and add execution rights to init scripts
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin

  # :: set correct permission
    RUN set -ex; \
      usermod -d ${APP_ROOT} docker; \
      chown -R 1000:1000 \
        ${APP_ROOT};

# :: Volumes
  VOLUME ["${APP_ROOT_JS}/app", "${APP_ROOT_JS}/public", "${APP_ROOT_JS}/build"]

# :: Start
  USER docker
  ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]