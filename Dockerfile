FROM ubuntu:14.04
MAINTAINER James Carscadden <james@carscadden.org>

# Prepare for software installs
RUN apt-get update
RUN apt-get install curl -y

# install the prerequisite patches here so that rvm will install under non-root account.
RUN apt-get install -y patch gawk g++ gcc make libc6-dev libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev unzip libgmp-dev

# Add more up to date Node sources
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -

# INSTALL GIT
RUN apt-get install git -y

# INSTALL postgres dev libraries for PG gem.
RUN echo "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/postgres.list
RUN curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install postgresql-server-dev-9.5 -y

# INSTALL NODE JS
RUN apt-get install nodejs -y

# INSTALL bower
RUN npm install bower -g

# INSTALL nginx
RUN apt-get install nginx -y

# Expose the NGINX service
EXPOSE 80
