FROM centos:7
LABEL maintainer "it@eltiempo.es"
LABEL version "1.0"
LABEL description "Image with some cli tools for dev environment"
ENV container docker

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install nginx net-tools vim mariadb wget curl && \
    yum -y --setopt=tsflags=nodocs install php70w php70w-cli php70w-gd php70w-mbstring php70w-mysql php70w-opcache php70w-pdo php70w-xml php70w-pecl-xdebug && \
    yum -y --setopt=tsflags=nodocs groupinstall 'Development Tools' && \
    yum clean all

RUN groupadd --gid 1000 cli-user && \
	adduser -u 1000 -g 1000 cli-user 

USER cli-user
ENV NVM_DIR /home/cli-user/nvm
ENV NODE_VERSION v6.9.0
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash && \
	source $NVM_DIR/nvm.sh && \
	nvm install $NODE_VERSION && \
	nvm alias default $NODE_VERSION && \
    nvm use default && \
	npm install -g bower && \
	npm install gulp-cli -g

ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/$NODE_VERSION/bin:$PATH

WORKDIR /home/cli-user