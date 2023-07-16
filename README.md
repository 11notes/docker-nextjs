# Alpine :: Nextjs
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

## Parent
* [11notes/node:stable](https://github.com/11notes/docker-node)

## Build with
* [nextjs](https://nextjs.org)
* [React Redux](https://react-redux.js.org)
* [Web3](https://www.npmjs.com/package/web3)
* [Iconify](https://docs.iconify.design/icon-components/react)
* [Axios](https://www.npmjs.com/package/axios)
* [Alpine Linux](https://alpinelinux.org)
* [NodeJS](https://nodejs.org/en)

## Tips
* Use [11notes/nextjs-cluster](https://github.com/11notes/docker-nextjs-cluster) to run the build output in a cluster on a single or multiple hosts
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy
* [Permanent Storage](https://github.com/11notes/alpine-docker-netshare) - Module to store permanent container data via NFS/CIFS and more