# hatterfix_microservices
hatterfix microservices repository

### Как изменить базовое имя проекта в docker-compose:

Базовое имя проекта можно задать используя ключ -p прм запуске docker-compose:
Информация по доступным ключам  --help

```sh

#Пример:

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
