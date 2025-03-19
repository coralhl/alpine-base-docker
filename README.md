# 🏔️ Alpine Linux
![size](https://img.shields.io/docker/image-size/coralhl/alpine-base/3.21.3?color=0eb305) ![version](https://img.shields.io/docker/v/coralhl/alpine-base/3.21.3?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/coralhl/alpine-base?color=2b75d6) ![stars](https://img.shields.io/docker/stars/coralhl/alpine-base?color=e6a50e) [<img src="https://img.shields.io/badge/github-coralhl-blue?logo=github">](https://github.com/coralhl)

# SYNOPSIS
This image will give you a base Alpine image with some additional tweaks like some bins which are present by default and the mimalloc memory allocator (optimized malloc for multi threading). 

# COMPOSE
```yaml
services:
  alpine:
    image: coralhl/alpine-base
    container_name: alpine
    environment:
      TZ: Europe/Moscow
    restart: always
```

# DEFAULT SETTINGS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | abc | user abc |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /home/user | home directory of user abc |

# ENVIRONMENT
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Show debug information | |
| `LD_PRELOAD` | Set mimalloc as default memalloc | /lib/libmimalloc.so |
| `MIMALLOC_LARGE_OS_PAGES` | Large memory pages by default | 1 |

# BUILT WITH
* [mimalloc](https://github.com/microsoft/mimalloc)
* [alpine](https://alpinelinux.org)

# TIPS
