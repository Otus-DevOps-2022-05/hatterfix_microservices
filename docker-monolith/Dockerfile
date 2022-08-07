FROM ubuntu:18.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y ruby-full ruby-dev mongodb-server build-essential libcurl3 tzdata git
#RUN git clone https://github.com/hatterfix/MongoDB.git
#RUN dpkg -i MongoDB/4.2/mongodb-org-tools_4.2.10_amd64.deb \
#&& dpkg -i MongoDB/4.2/mongodb-org-mongos_4.2.10_amd64.deb \
#&& dpkg -i MongoDB/4.2/mongodb-org-server_4.2.10_amd64.deb \
#&& dpkg -i MongoDB/4.2/mongodb-org-shell_4.2.10_amd64.deb \
#&& dpkg -i MongoDB/4.2/mongodb-org_4.2.10_amd64.deb
RUN gem install bundler
RUN git clone -b monolith https://github.com/express42/reddit.git

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

RUN cd /reddit && rm Gemfile.lock && bundle install
RUN chmod 777 /start.sh

CMD ["/start.sh"]
