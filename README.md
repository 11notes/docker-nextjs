# Alpine :: NextJS
![size](https://img.shields.io/docker/image-size/11notes/nextjs/14.1.0?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/nextjs?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/nextjs?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/11notes/docker-nextjs?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/11notes/docker-nextjs?color=c91cb8)

Run NextJS based on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Description
With this image you can quickly start a NextJS development environment to build your application. You can then use the ```build```command to build a stand-alone version of your app that can be hosted via Node.

## Volumes
* **/next/js/app** - Directory of your NextJS app
* **/next/js/public** - Directory of all certs
* **/next/js/build** - Directory of your NextJS app production build (standalone)

## Run
Starting development
```shell
docker run --name nextjs \
  -p 3000:3000 \
  -v ../app:/next/js/app \
  -v ../public:/next/js/public \
  -d 11notes/nextjs:[tag]
```

Build project
```shell
docker run --name nextjs \
  -p 3000:3000 \
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
| `server` | http://${IP}:3000 | Certbot endpoint |

## Environment
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Show debug information | |

## Parent image
* [11notes/node:stable](https://hub.docker.com/r/11notes/node)

## Built with (thanks to)
* [NextJS](https://nextjs.org)
* [React Redux](https://react-redux.js.org)
* [npm::Web3](https://www.npmjs.com/package/web3)
* [Iconify](https://docs.iconify.design/icon-components/react)
* [npm::Axios](https://www.npmjs.com/package/axios)
* [Flowbite](https://www.flowbite-react.com/docs/getting-started/nextjs)
* [npm::sass](https://sass-lang.com)
* [Alpine Linux](https://alpinelinux.org)
* [nodejs](https://nodejs.org/en)

## Tips
* Only use rootless container runtime (podman, rootless docker)
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)
* Use [11notes/nextjs-cluster](https://github.com/11notes/docker-nextjs-cluster) to run the build output in a cluster on a single or multiple hosts