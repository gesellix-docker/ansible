FROM gesellix/base

# install from ppa
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && apt-add-repository ppa:ansible/ansible
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ansible python python-simplejson

ADD ./ansible_hosts /ansible_hosts
ENV ANSIBLE_HOSTS /ansible_hosts

ADD ./playbooks /playbooks

RUN mkdir -p /root/.ssh/
VOLUME ["/root/.ssh/"]

CMD ["ansible", "--version"]
