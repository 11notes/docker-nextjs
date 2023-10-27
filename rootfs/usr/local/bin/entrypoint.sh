#!/bin/ash
  npx next telemetry disable
  
  if [[ -z "${PORT}" ]]; then PORT=3000; fi

  if [ -z "${1}" ]; then
    cd ${APP_ROOT_JS}
    set -- "npm" run dev -- -p ${PORT}
  else
    case "${1}" in
      build)
        cd ${APP_ROOT_JS}
        
        set -- "npm" run build
      ;;
    esac
  fi

  exec "$@"