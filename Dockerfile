FROM ubuntu:14.04
MAINTAINER Gary Leong <gwleong@gmail.com>

# Set locale to avoid apt-get warnings in OSX
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL C
ENV LC_ALL en_US.UTF-8

RUN apt-get update -y 
RUN apt-get install -y --no-install-recommends \
      curl \
      wget \
      git \
      build-essential \
      libxml2-dev \
      libxslt-dev 

RUN apt-get install -y --no-install-recommends libgecode-dev 
RUN apt-get clean 
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN curl -L http://www.opscode.com/chef/install.sh | bash -s -- -v "11.12.8"

RUN USE_SYSTEM_GECODE=1 /opt/chef/embedded/bin/gem install berkshelf

# Clean up
RUN rm -rf /tmp/* /var/tmp/*

