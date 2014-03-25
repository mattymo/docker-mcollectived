FROM centos

MAINTAINER Aleksandr Didenko adidenko@mirantis.com

WORKDIR /root

RUN rm -rf /etc/yum.repos.d/*
RUN echo -e "[nailgun]\nname=Nailgun Local Repo\nbaseurl=http://10.20.0.2:8080/centos/fuelweb/x86_64/\ngpgcheck=0" > /etc/yum.repos.d/nailgun.repo
RUN yum clean all
RUN yum --quiet install -y puppet mcollective mcollective-client
ADD start.sh /usr/local/bin/start.sh
ADD astute.yaml /etc/astute.yaml
ADD site.pp /root/site.pp
RUN chmod +x /usr/local/bin/start.sh
# chmod to 0 to disable mcollective start from puppet manifests
RUN chmod 0 /etc/init.d/mcollective

CMD ["/usr/local/bin/start.sh"]
