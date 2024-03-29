#!/bin/ash
  elevenLogJSON INFO "disable telemetry"
  npx next telemetry disable
  
  if [[ -z "${PORT}" ]]; then PORT=3000; fi

  if [ -z "${1}" ]; then
    cd ${APP_ROOT_JS}
    elevenLogJSON INFO "run dev server"
    set -- "npm" run dev -- -p ${PORT}
  else
    case "${1}" in
      build)
        cd ${APP_ROOT_JS}
        elevenLogJSON INFO "build stand-alone server"
        set -- "npm" run build
      ;;
    esac
  fi

  exec "$@"