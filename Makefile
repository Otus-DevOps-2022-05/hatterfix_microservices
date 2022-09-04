#!make
export USERNAME=hatterfix

#SET NAMES:

.PHONY: post comment ui mon micros full push-post push-comment push-ui push-mon push-micros

full: micros

micros: post comment ui mon


#RUN BUILDERS:


post:
	cd src/post-py && /bin/bash docker_build.sh

comment:
	cd src/comment && /bin/bash docker_build.sh

ui:
	cd src/ui && /bin/bash docker_build.sh

mon:
	cd monitoring/prometheus && docker build -t $(USERNAME)/prometheus_make .


# RUN PUSH

push-micros: push-comment push-post push-ui push-mon

push-post:
	docker push $(USERNAME)/post_make

push-comment:
	docker push $(USERNAME)/comment_make

push-ui:
	docker push $(USERNAME)/ui_make

push-mon:
	docker push $(USERNAME)/prometheus_make
