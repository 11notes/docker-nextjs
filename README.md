# Alpine :: Nextjs
![size](https://img.shields.io/docker/image-size/11notes/nextjs/13.5.3?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/nextjs?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/nextjs?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/11notes/docker-nextjs?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/11notes/docker-nextjs?color=c91cb8)

Run Nextjs based on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Volumes
* **/next/js/app** - Directory of  your nextjs app
* **/next/js/public** - Directory of your nextjs app public / static content
* **/next/js/build** - Directory of your nextjs app production build (standalone)

## Run
Starting development
```shell
docker run --name nextjs \
  -v ../app:/next/js/app \
  -v ../public:/next/js/public \
  -d 11notes/nextjs:[tag]
```

Build project
```shell
docker run --name nextjs \
  -v ../app:/next/js/app \
  -v ../public:/next/js/public \
  -v ../build:/next/js/build \
  -d 11notes/nextjs:[tag] \
    build
```

## Defaults
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /next | home directory of user docker |

## Parent Image
* [11notes/node:stable](https://github.com/11notes/docker-node)

## Built with and thanks to
* [nextjs](https://nextjs.org)
* [React Redux](https://react-redux.js.org)
* [Web3](https://www.npmjs.com/package/web3)
* [Iconify](https://docs.iconify.design/icon-components/react)
* [Axios](https://www.npmjs.com/package/axios)
* [Flowbite](https://www.flowbite-react.com/docs/getting-started/nextjs)
* [sass](https://sass-lang.com)
* [Alpine Linux](https://alpinelinux.org)
* [nodejs](https://nodejs.org/en)

## Tips
* Use [11notes/nextjs-cluster](https://github.com/11notes/docker-nextjs-cluster) to run the build output in a cluster on a single or multiple hosts
* Only use rootless container runtime (podman, rootless docker)
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)