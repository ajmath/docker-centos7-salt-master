FROM centos:centos7
MAINTAINER Andrew Matheny <andrew.j.matheny@gmail.com>


RUN curl -L https://bootstrap.saltstack.com -o install_salt.sh
RUN sh install_salt.sh -M -X git v2015.2.0rc1

RUN yum install -y python-pygit2 GitPython

RUN mkdir -p /etc/salt/master.d/ && echo "auto_accept: True" >> /etc/salt/master.d/docker.conf

RUN echo "master: localhost" >> /etc/salt/minion

VOLUME ["/etc/salt/master.d", "/srv/salt", "/srv/pillar"]

EXPOSE 4505

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["/usr/local/bin/run.sh"]
