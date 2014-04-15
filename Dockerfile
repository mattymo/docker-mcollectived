FROM centos

MAINTAINER Aleksandr Didenko adidenko@mirantis.com

WORKDIR /root

RUN rm -rf /etc/yum.repos.d/*
RUN echo -e "[nailgun]\nname=Nailgun Local Repo\nbaseurl=http://10.20.0.2:8080/centos/fuelweb/x86_64/\ngpgcheck=0" > /etc/yum.repos.d/nailgun.repo
RUN yum clean all
RUN yum --quiet install -y puppet mcollective

ADD etc /etc
ADD start.sh /usr/local/bin/start.sh
ADD site.pp /root/site.pp
ADD astute.yaml /etc/astute.yaml

RUN chmod +x /usr/local/bin/start.sh

RUN touch /etc/puppet/hiera.yaml /var/lib/hiera/common.yaml
RUN /usr/bin/puppet apply -d -v /etc/puppet/modules/mcollective/examples/mcollective-server-only.pp

# let's disable some services and commands since we don't need them in our container
RUN echo -e '#!/bin/bash\n#chkconfig: 345 20 80\nexit 0' > /etc/init.d/mcollective

CMD ["/usr/local/bin/start.sh"]
