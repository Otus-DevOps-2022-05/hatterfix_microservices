# hatterfix_microservices
hatterfix microservices repository

### Как изменить базовое имя проекта в docker-compose:

Базовое имя проекта можно задать используя ключ -p прм запуске docker-compose:
Информация по доступным ключам  --help

```sh

##Пример:

docker-compose --help
Options:
  -f, --file FILE             Specify an alternate compose file
                              (default: docker-compose.yml)
  -p, --project-name NAME     Specify an alternate project name



docker-compose -p redditdocker up -d
Starting redditdocker_comment_1 ... done
Starting redditdocker_post_db_1 ... done
Starting redditdocker_post_1    ... done
Starting redditdocker_ui_1      ... done

##Ссылки на образы Dockerhub:

[prometheus](https://hub.docker.com/repository/docker/hatterfix/otus-prometheus)
[ui](https://hub.docker.com/repository/docker/hatterfix/otus-ui)
[comment](https://hub.docker.com/repository/docker/hatterfix/otus-comment)
[post](https://hub.docker.com/repository/docker/hatterfix/otus-post)
[prometheus+node](https://hub.docker.com/repository/docker/hatterfix/otus-prometheus_nodexp)
[prometheus+node+mongo](https://hub.docker.com/repository/docker/hatterfix/otus-prometheus_mongo)
[prometheus+node+mongo+blackbox](https://hub.docker.com/repository/docker/hatterfix/otus-prometheus_blackbox)
[prometheus pushed via Makefile](https://hub.docker.com/repository/docker/hatterfix/prometheus_make)
