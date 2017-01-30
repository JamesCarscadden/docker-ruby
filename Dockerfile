FROM ruby:2.3
MAINTAINER James Carscadden <james@carscadden.org>

# Add more up to date Node sources
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
# Add more up to date Postgres sources
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/postgres.list
RUN curl -sL https://postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y \
    nodejs \
    postgresql-server-dev-9.6 \
    postgresql-client-9.6 \
    && rm -rf /var/lib/apt/lists/*

# INSTALL bower
RUN npm install bower -g
