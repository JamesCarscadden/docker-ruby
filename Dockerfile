FROM ubuntu:14.04
MAINTAINER James Carscadden <james@carscadden.org>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r railsapp && useradd -r -g railsapp railsapp

# supress debconf
ENV DEBIAN_FRONTEND=noninteractive

# Prepare for software installs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates\
    curl \
    && rm -rf /var/lib/apt/lists/*

# Add more up to date Node sources
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
# Add more up to date Postgres sources
RUN echo "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/postgres.list
RUN curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# install the prerequisite patches here so that rvm will install under non-root account.
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    bison \
    g++ \
    gawk \
    gcc \
    git \
    libc6-dev \
    libffi-dev \
    libgdbm-dev \
    libgmp-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libyaml-dev \
    make \
    nodejs \
    patch \
    pkg-config \
    postgresql-server-dev-9.5 \
    sqlite3 \
    unzip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install GOSU for easy step down from root (as taken from redis dockerfile)
ENV GOSU_VERSION 1.7
RUN set -x \
	&& curl -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& curl -o /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true
    
# INSTALL bower
RUN npm install bower -g
