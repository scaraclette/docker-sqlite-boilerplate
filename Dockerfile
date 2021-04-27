FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN mkdir -p /env
WORKDIR /env

CMD ["/bin/bash"]