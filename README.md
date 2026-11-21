# 🏔️ Alpine Linux
![size](https://img.shields.io/docker/image-size/coralhl/alpine-base/3.24.4?color=0eb305) ![version](https://img.shields.io/docker/v/coralhl/alpine-base/3.24.4?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/coralhl/alpine-base?color=2b75d6) ![stars](https://img.shields.io/docker/stars/coralhl/alpine-base?color=e6a50e) [<img src="https://img.shields.io/badge/github-coralhl-blue?logo=github">](https://github.com/coralhl)

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

# TAGS
| Tag | Alpine | Purpose |
| --- | --- | --- |
| `latest`, `3.24.4` | 3.24.4 | Current branch, used by PHP 8.3/8.4/8.5 images |
| `3.22.7` | 3.22.7 | Legacy branch, kept for the PHP 8.2 image |

# DEFAULT SETTINGS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | abc | user abc |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /home/user | home directory of user abc |

# ENVIRONMENT
| Parameter | Description | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | — |
| `DEBUG` | Show debug information | — |
| `LD_PRELOAD` | Use mimalloc as the default allocator | `/lib/libmimalloc.so` |
| `MIMALLOC_LARGE_OS_PAGES` | Use large memory pages | `1` |

# BUILD ARGS
| Argument | Default | Description |
| --- | --- | --- |
| `ALPINE_VER` | `3.24.4` | Alpine base tag. Use `3.22.7` for the legacy image. |
| `MIMALLOC_VERSION` | `v2.5.3` | mimalloc release tag. v2 is the stable legacy line. |

# BUILT WITH
* [mimalloc](https://github.com/microsoft/mimalloc)
* [alpine](https://alpinelinux.org)
