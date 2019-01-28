FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gnupg2
RUN echo "deb     http://ag-projects.com/ubuntu bionic main" >/etc/apt/sources.list.d/ag-projects.list
ADD http://download.ag-projects.com/agp-debian-gpg.key /agp-debian-gpg.key
RUN apt-key add /agp-debian-gpg.key && \
    rm /agp-debian-gpg.key
RUN apt-get update && apt-get install -y sylkserver

CMD sylk-server --no-fork
