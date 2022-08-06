FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y ruby-full ruby-dev build-essential libcurl3 git
RUN git clone https://github.com/hatterfix/MongoDB.git
RUN cd ~/MongoDB/4.2/
RUN dpkg -i mongodb-org-tools_4.2.10_amd64.deb mongodb-org-mongos_4.2.10_amd64.deb mongodb-org-server_4.2.10_amd64.deb mongodb-org shell_4.2.10_amd64.deb mongodb-org_4.2.10_amd64.deb
RUN cd ~/
RUN gem install bundler
RUN git clone -b monolith https://github.com/express42/reddit.git

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

RUN cd /reddit && rm Gemfile.lock && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]
